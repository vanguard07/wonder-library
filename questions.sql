-- 1. List the details of all the supervisors of the library hired in past two months.
SELECT * FROM employee JOIN person ON person.id = employee.emp_id  WHERE emp_type IN ('LS') AND start_date >= CURRENT_DATE - INTERVAL '2 months';

-- 2. Find the names of employees who are also members and the books they have borrowed in the past month.
SELECT person.first_name || ' ' || person.middle_name || ' ' || person.last_name AS employee_name, member.member_id, book.title 
FROM person
JOIN member ON person.id = member.member_id
JOIN borrows ON member.member_id = borrows.member_id
JOIN book ON borrows.book_id = book.book_id
JOIN employee ON person.id = employee.emp_id
WHERE employee.emp_id IS NOT NULL AND borrows.date_of_issue >= CURRENT_DATE - INTERVAL '1 month';

-- 3. Find the average number of books borrowed by the top five gold members in the library.
SELECT AVG(books_borrowed) AS average_books_borrowed
FROM (
  SELECT member.member_id, COUNT(*) AS books_borrowed
  FROM member
  JOIN borrows ON member.member_id = borrows.member_id
  WHERE member.card_id IN (SELECT card_id FROM card WHERE membership_level = 'Gold') AND borrows.date_of_issue >= CURRENT_DATE - INTERVAL '1 month'
  GROUP BY member.member_id
  HAVING COUNT(*) > 5
  ORDER BY COUNT(*) DESC
  LIMIT 5
);

-- 4. Find the name of publishers and the title of the most popular book for each publisher.
WITH BookPublisherStats AS (
  SELECT book.publisher_id, borrows.book_id, COUNT(*) AS borrow_count
  FROM borrows 
  JOIN book ON book.book_id = borrows.book_id
  WHERE borrows.date_of_issue >= CURRENT_DATE - INTERVAL '1 year'
  GROUP BY book.publisher_id, borrows.book_id
) SELECT publisher.publisher_name, book.title
  FROM BookPublisherStats
  JOIN book ON book.book_id = BookPublisherStats.book_id
  JOIN publisher ON publisher.publisher_id = book.publisher_id
  WHERE (BookPublisherStats.publisher_id, BookPublisherStats.borrow_count) IN (
    SELECT BookPublisherStats.publisher_id, MAX(BookPublisherStats.borrow_count) 
    FROM BookPublisherStats
    GROUP BY BookPublisherStats.publisher_id
  );

-- 5. Find names of books that were not borrowed in the last 5 months.
SELECT title
FROM book
WHERE book_id NOT IN (
  SELECT DISTINCT book_id
  FROM borrows
  WHERE date_of_issue >= CURRENT_DATE - INTERVAL '5 months'
);

-- 6. Find the members who have borrowed all the books wrote by the most popular author.
WITH MostPopularAuthor AS (
  SELECT author_id FROM author 
  WHERE author_id IN (
    SELECT author_id FROM book_author
    WHERE book_id IN (
      SELECT book_id
      FROM borrows
      WHERE borrows.date_of_issue >= CURRENT_DATE - INTERVAL '1 year'
      GROUP BY book_id
      HAVING COUNT(*) = (
        SELECT COUNT(*) AS borrow_count
        FROM borrows
        WHERE borrows.date_of_issue >= CURRENT_DATE - INTERVAL '1 year'
        GROUP BY book_id
        HAVING COUNT(*) > 0
        ORDER BY COUNT(*) DESC
        LIMIT 1
      )
      ORDER BY COUNT(*) DESC
    )
  )
) SELECT DISTINCT(person.first_name || ' ' || COALESCE(person.middle_name, '') || ' ' || person.last_name) AS members
  FROM person
  JOIN member ON member.member_id = person.id
  JOIN borrows ON borrows.member_id = member.member_id
  JOIN book_author ON book_author.book_id = borrows.book_id
  WHERE book_author.author_id IN (SELECT * FROM MostPopularAuthor);

-- 7. Find the Gold Member with the greatest number of guests.
SELECT person.first_name, person.middle_name, person.last_name AS member_name, COUNT(guest.guest_id) AS guest_count
FROM person
JOIN member ON person.id = member.member_id
JOIN card ON member.card_id = card.card_id
LEFT JOIN guest ON card.card_id = guest.card_id
WHERE card.membership_level = 'Gold'
GROUP BY person.first_name, person.middle_name, person.last_name
ORDER BY guest_count DESC
LIMIT 1;

-- 8. Find the year with the maximum number of books borrowed.
SELECT EXTRACT(YEAR FROM date_of_issue) AS borrowing_year, COUNT(*) AS book_count
FROM borrows
GROUP BY borrowing_year
ORDER BY book_count DESC
LIMIT 1;

-- 9. Find the names of members who borrowed the most popular books.
SELECT DISTINCT(person.first_name, person.middle_name, person.last_name), book.title
FROM person
JOIN member ON person.id = member.member_id
JOIN borrows ON member.member_id = borrows.member_id
JOIN book ON borrows.book_id = book.book_id
WHERE borrows.book_id IN (
  SELECT book_id
  FROM borrows
  WHERE borrows.date_of_issue >= CURRENT_DATE - INTERVAL '1 year'
  GROUP BY book_id
  HAVING COUNT(*) = (
      SELECT COUNT(*) AS borrow_count
      FROM borrows
      WHERE borrows.date_of_issue >= CURRENT_DATE - INTERVAL '1 year'
      GROUP BY book_id
      HAVING COUNT(*) > 0
      ORDER BY borrow_count DESC
      LIMIT 1
    )
);

-- 10. List all the employees that have enrolled into Gold membership within a month of being employed.
SELECT emp_id, person.first_name, person.middle_name, person.last_name, employee.start_date, card.date_of_issue FROM employee 
INNER JOIN member ON member.member_id = employee.emp_id
INNER JOIN card ON member.card_id = card.card_id
INNER JOIN person ON person.id = employee.emp_id
WHERE card.membership_level = 'Gold' AND card.date_of_issue <= employee.start_date + INTERVAL '1 month';

-- 11. Find the name of members who have been a silver member for over 5 years.
SELECT person.first_name, person.middle_name, person.last_name, card.date_of_issue
FROM person
JOIN member ON person.id = member.member_id
JOIN card ON member.card_id = card.card_id
WHERE card.membership_level = 'Silver' AND card.date_of_issue <= CURRENT_DATE - INTERVAL '5 years';

-- 12. Find the names of the potential gold members and number of books they borrowed in the last year.
SELECT borrows.member_id, person.first_name || ' ' || COALESCE(person.middle_name, '') || ' ' || person.last_name AS potential_gold_members, COUNT(*) 
FROM borrows INNER JOIN person ON person.id = borrows.member_id 
WHERE borrows.member_id IN (SELECT member_id FROM PotentialGoldMember) 
GROUP BY borrows.member_id, person.first_name, person.middle_name, person.last_name;

-- 13. List the employee who trained the most number of receptionists.
SELECT trainer_emp_id, person.first_name, person.middle_name, person.last_name, COUNT(*) AS trained_employees
FROM employee
INNER JOIN person ON person.id = employee.trainer_emp_id
WHERE trainer_emp_id IS NOT NULL
GROUP BY trainer_emp_id, person.first_name, person.middle_name, person.last_name
HAVING COUNT(*) = (
  SELECT COUNT(*)
  FROM employee
  WHERE trainer_emp_id IS NOT NULL
  GROUP BY trainer_emp_id
  ORDER BY COUNT(*) DESC
  LIMIT 1
)
ORDER BY COUNT(*) DESC;

-- 14. List the Cataloging Managers who cataloged all categories every week in past 4 weeks.
WITH CatalogCounts AS (
    SELECT employee_id, COUNT(DISTINCT category_id) AS num_categories, DATE_TRUNC('week',catalog_date) AS week
    FROM catalog_manage
    WHERE catalog_date >= CURRENT_DATE - INTERVAL '4 weeks'
    GROUP BY employee_id, DATE_TRUNC('week',catalog_date)
)
SELECT CatalogCounts.employee_id
FROM CatalogCounts
WHERE CatalogCounts.num_categories = (SELECT COUNT(*) FROM category)
GROUP BY CatalogCounts.employee_id
HAVING COUNT(DISTINCT CatalogCounts.week) = 4;
