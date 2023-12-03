1. List the details of all the supervisors of the library hired in past two months.
SELECT * FROM employee JOIN person ON person.id = employee.emp_id  WHERE emp_type IN ('LS') AND start_date >= CURRENT_DATE - INTERVAL '2 months';

2. Find the names of employees who are also members and the books they have borrowed in the past month.
SELECT person.first_name || ' ' || person.middle_name || ' ' || person.last_name AS employee_name, member.member_id, book.title 
FROM person
JOIN member ON person.id = member.member_id
JOIN borrows ON member.member_id = borrows.member_id
JOIN book ON borrows.book_id = book.book_id
JOIN employee ON person.id = employee.emp_id
WHERE employee.emp_id IS NOT NULL AND borrows.date_of_issue >= CURRENT_DATE - INTERVAL '1 month';

3. Find the average number of books borrowed by the top five gold members in the library.
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

4. Find the name of publishers and the title of the most popular book for each publisher.
SELECT publisher.publisher_name, book.title AS most_popular_book
FROM publisher
JOIN book ON publisher.publisher_id = book.publisher_id
JOIN (
  SELECT book_id, COUNT(*) AS borrow_count
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
  ORDER BY borrow_count DESC
) AS popular_book ON b.book_id = popular_book.book_id;

5. Find names of books that were not borrowed in the last 5 months.
SELECT title
FROM book
WHERE book_id NOT IN (
  SELECT DISTINCT book_id
  FROM borrows
  WHERE date_of_issue >= CURRENT_DATE - INTERVAL '5 months'
);

6. Find the members who have borrowed all the books wrote by the most popular author.
WITH MostPopularAuthor AS (
    SELECT
        a.author_id
    FROM
        author a
    JOIN
        book_author ba ON a.author_id = ba.author_id
    GROUP BY
        a.author_id
    ORDER BY
        COUNT(ba.book_id) DESC
    LIMIT 1
)

SELECT p.first_name, p.last_name from person p JOIN (SELECT
    m.member_id
FROM
    member m
JOIN
    borrows b ON m.member_id = b.member_id
JOIN
    book_author ba ON b.book_id = ba.book_id
WHERE
    ba.author_id = (SELECT author_id FROM MostPopularAuthor)) k ON k.member_id = p.id


7. Find the Gold Member with the greatest number of guests.
SELECT person.first_name, person.middle_name, person.last_name AS member_name, COUNT(guest.guest_id) AS guest_count
FROM person
JOIN member ON person.id = member.member_id
JOIN card ON member.card_id = card.card_id
LEFT JOIN guest ON card.card_id = guest.card_id
WHERE card.membership_level = 'Gold'
GROUP BY person.first_name, person.middle_name, person.last_name
ORDER BY guest_count DESC
LIMIT 1;

8. Find the year with the maximum number of books borrowed.
SELECT EXTRACT(YEAR FROM date_of_issue) AS borrowing_year, COUNT(*) AS book_count
FROM borrows
GROUP BY borrowing_year
ORDER BY book_count DESC
LIMIT 1;

9. Find the names of members who borrowed the most popular books.
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

10. List all the employees that have enrolled into Gold membership within a month of being employed.
SELECT emp_id, person.first_name, person.middle_name, person.last_name, employee.start_date, card.date_of_issue FROM employee 
INNER JOIN member ON member.member_id = employee.emp_id
INNER JOIN card ON member.card_id = card.card_id
INNER JOIN person ON person.id = employee.emp_id
WHERE card.membership_level = 'Gold' AND card.date_of_issue <= employee.start_date + INTERVAL '1 month';

11. Find the name of members who have been a silver member for over 5 years.
SELECT person.first_name, person.middle_name, person.last_name, card.date_of_issue
FROM person
JOIN member ON person.id = member.member_id
JOIN card ON member.card_id = card.card_id
WHERE card.membership_level = 'Silver' AND card.date_of_issue <= CURRENT_DATE - INTERVAL '5 years';

12. Find the names of the potential gold members and number of books they borrowed in the last year.
SELECT
    pgm.member_id,
    COUNT(b.book_id) AS books_borrowed
FROM
    PotentialGoldMember pgm
JOIN
    borrows b ON pgm.member_id = b.member_id
WHERE
    EXTRACT(YEAR FROM b.date_of_issue) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY
    pgm.member_id;
--TO be completed    
13. List the employee who trained the most number of receptionists.
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

14. List the Cataloging Managers who cataloged all categories every week in past 4 weeks. 

