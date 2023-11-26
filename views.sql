CREATE VIEW TopGoldMember AS
SELECT p.first_name, p.last_name, c.date_of_issue
FROM member m
JOIN card c ON m.card_id = c.card_id
JOIN borrows b ON m.member_id = b.member_id
JOIN person p ON m.member_id = p.id
WHERE c.membership_level = 'Gold'
  AND date_trunc('month', b.date_of_issue) = date_trunc('month', CURRENT_DATE - INTERVAL '1 month')
GROUP BY p.first_name, p.last_name, c.date_of_issue
HAVING COUNT(b.book_id) > 5;


CREATE VIEW PopularBooks AS
SELECT b.book_id, b.title, COUNT(borrows.book_id) AS borrow_count
FROM borrows
JOIN book b ON borrows.book_id = b.book_id
WHERE borrows.date_of_issue >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY b.book_id, b.title
ORDER BY borrow_count DESC
LIMIT 1;

CREATE VIEW BestRatingPublisher AS
SELECT p.publisher_name
FROM publisher p
JOIN book b ON p.publisher_id = b.publisher_id
JOIN person_comments pc ON b.book_id = pc.book_id
JOIN comment c ON pc.comment_id = c.comment_id
GROUP BY p.publisher_name
HAVING MIN(c.rating) >= 4.0;

CREATE VIEW PotentialGoldMember AS
SELECT p.first_name, p.last_name, pp.phone_number, m.member_id
FROM person p
JOIN member m ON p.id = m.member_id
JOIN person_phone pp ON p.id = pp.person_id
WHERE m.card_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1
    FROM borrows b
    WHERE m.member_id = b.member_id
      AND date_trunc('month', b.date_of_issue) != date_trunc('month', CURRENT_DATE)
  );

CREATE VIEW FastTrainer AS
SELECT e.emp_id, e.emp_type, e.start_date, e.certificate_number, e.cert_issue_date, e.is_trainer, e.trainer_emp_id
FROM employee e
JOIN employee trainer ON e.trainer_emp_id = trainer.emp_id
JOIN borrows b ON e.emp_id = b.issued_by_emp_id
WHERE e.is_trainer = true
  AND b.date_of_issue <= e.cert_issue_date + INTERVAL '1 week';
