CREATE VIEW TopGoldMember AS
SELECT member.member_id, person.first_name, person.last_name, COUNT(*) AS books_borrowed
FROM member
JOIN borrows ON member.member_id = borrows.member_id
JOIN person ON member.member_id = person.id
WHERE member.card_id IN (SELECT card_id FROM card WHERE membership_level = 'Gold') AND borrows.date_of_issue >= CURRENT_DATE - INTERVAL '1 month'
GROUP BY member.member_id, person.first_name, person.last_name
HAVING COUNT(*) > 5
ORDER BY COUNT(*) DESC;


CREATE VIEW PopularBooks AS
SELECT borrows.book_id, book.title, COUNT(*) AS borrow_count
FROM borrows
JOIN book ON book.book_id = borrows.book_id
WHERE borrows.date_of_issue >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY borrows.book_id, book.title
HAVING COUNT(*) = (
  SELECT COUNT(*) AS borrow_count
  FROM borrows
  WHERE borrows.date_of_issue >= CURRENT_DATE - INTERVAL '1 year'
  GROUP BY book_id
  HAVING COUNT(*) > 0
  ORDER BY borrow_count DESC
  LIMIT 1
)
ORDER BY borrow_count DESC;

CREATE VIEW BestRatingPublisher AS
SELECT book.publisher_id, publisher.publisher_name, AVG(comment.rating) FROM person_comments
INNER JOIN comment ON comment.comment_id = person_comments.comment_id
INNER JOIN book ON person_comments.book_id = book.book_id
INNER JOIN publisher ON publisher.publisher_id = book.publisher_id
GROUP BY book.publisher_id, publisher.publisher_name
HAVING AVG(comment.rating) >= 4.0;

CREATE VIEW FastTrainer AS
SELECT trainer.emp_id AS trainer_id, person.first_name || ' ' || person.middle_name ||' ' || person.last_name AS trainer_name, 
employee.emp_id AS trained_employee_id, certificate.cert_issue_date AS trainer_certificate_issue_date, 
employee.training_completion_date AS employee_training_completion_date 
FROM employee AS trainer
INNER JOIN employee ON trainer.emp_id = employee.trainer_emp_id
INNER JOIN certificate ON certificate.emp_id = trainer.emp_id
INNER JOIN person ON person.id = trainer.emp_id
WHERE trainer.is_trainer IS TRUE AND employee.training_completion_date <= certificate.cert_issue_date + INTERVAL '1 week';

CREATE VIEW PotentialGoldMember AS
WITH MonthlyIssues AS (
    SELECT member_id, DATE_TRUNC('month', date_of_issue) AS issue_month
    FROM borrows
    WHERE date_of_issue >= CURRENT_DATE - INTERVAL '12 months'
), MonthlyCounts AS (
    SELECT member_id, COUNT(DISTINCT issue_month) AS distinct_months
    FROM MonthlyIssues
    GROUP BY member_id
)
SELECT MonthlyCounts.member_id, person.first_name || ' ' || COALESCE(person.middle_name, '') || ' ' || person.last_name AS potential_gold_members,
person_phone.phone_number AS person_phone
FROM MonthlyCounts
INNER JOIN member ON member.member_id = MonthlyCounts.member_id
INNER JOIN card ON card.card_id = member.card_id
INNER JOIN person ON person.id = member.member_id
LEFT JOIN person_phone ON person_phone.person_id = person.id
WHERE MonthlyCounts.distinct_months = 12 AND card.membership_level != 'Gold';