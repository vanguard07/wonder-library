-- Insert 10 records into the 'person' table
INSERT INTO person (id, first_name, middle_name, last_name, gender, date_of_birth, address)
VALUES
('E001', 'John', 'A', 'Doe', 'Male', '1990-01-01', '123 Main St'),
('E002', 'Jane', 'B', 'Smith', 'Female', '1985-05-15', '456 Oak St'),
('E003', 'Alice', 'C', 'Johnson', 'Female', '1992-08-20', '789 Pine St'),
('E004', 'Bob', 'D', 'Williams', 'Male', '1988-03-10', '101 Cedar St'),
('E005', 'Charlie', 'E', 'Brown', 'Male', '1995-12-05', '202 Maple St'),
('E006', 'Amanda', 'A', 'Wilson', 'Female', '1994-08-08', '56789 Maple St'),
('M001', 'Emma', 'F', 'Miller', 'Female', '1983-06-18', '303 Birch St'),
('M002', 'David', 'G', 'Taylor', 'Male', '1997-09-25', '404 Walnut St'),
('M003', 'Eva', 'H', 'Clark', 'Female', '1982-02-28', '505 Oak St'),
('M004', 'Frank', 'I', 'Moore', 'Male', '1993-11-15', '606 Elm St'),
('M005', 'Grace', 'J', 'Anderson', 'Female', '1980-07-08', '707 Pine St');

-- Insert 5 records into the 'card' table
INSERT INTO card (card_id, date_of_issue, membership_level)
VALUES
(1, '2022-01-01', 'Silver'),
(2, '2022-02-15', 'Gold'),
(3, '2022-03-20', 'Silver'),
(4, '2022-04-10', 'Gold'),
(5, '2022-05-05', 'Silver');

-- Insert 5 records into the 'member' table
INSERT INTO member (member_id, card_id)
VALUES
('M001', 1),
('M002', 2),
('M003', 3),
('M004', 4),
('M005', 5);

-- Insert 10 records into the 'employee' table
INSERT INTO employee (emp_id, emp_type, start_date, certificate_number, cert_issue_date, is_trainer, trainer_emp_id)
VALUES
('E001', 'LS', '2010-05-01', NULL, NULL, false, NULL),
('E002', 'CM', '2015-08-15', 'CM_CERT002', '2015-12-15', true, NULL),
('E003', 'RP', '2018-03-20', NULL, NULL, false, 'E002'),
('E004', 'LS', '2013-11-10', 'LS_CERT004', '2014-06-10', true, NULL),
('E005', 'CM', '2016-06-25', NULL, NULL, false, NULL),
('E006', 'RP', '2019-09-12', NULL, NULL, false, 'E004');

-- Insert 3 records into the 'category' table
INSERT INTO category (category_id, description)
VALUES
('Category1', 'Adventure-Mystery'),
('Category2', 'Non-Fiction'),
('Category3', 'Fantasy');

-- Insert 10 records into the 'publisher' table
INSERT INTO publisher (publisher_name)
VALUES
('Publisher A'),
('Publisher B'),
('Publisher C'),
('Publisher D'),
('Publisher E'),
('Publisher F'),
('Publisher G'),
('Publisher H'),
('Publisher I'),
('Publisher J');

-- Insert 10 records into the 'book' table
INSERT INTO book (title, publisher_id, category_id)
VALUES
('Book 1', 1, 'Category1'),
('Book 2', 2, 'Category2'),
('Book 3', 3, 'Category3'),
('Book 4', 3, 'Category1'),
('Book 5', 4, 'Category2'),
('Book 6', 5, 'Category3'),
('Book 7', 1, 'Category1'),
('Book 8', 5, 'Category2'),
('Book 9', 2, 'Category3'),
('Book 10', 4, 'Category2');

-- Insert 10 records into the 'author' table
INSERT INTO author (author_name)
VALUES
('Author X'),
('Author Y'),
('Author Z'),
('Author W'),
('Author V'),
('Author U'),
('Author T'),
('Author S'),
('Author R'),
('Author Q');

-- Assign authors to books
INSERT INTO book_author (book_id, author_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 7),
(5, 8),
(6, 9),
(6, 10),
(7, 1),
(8, 2),
(8, 9),
(9, 5),
(10, 2),
(10, 4),
(10, 6),
(10, 8);

-- Store phone number for each person
INSERT INTO person_phone (person_id, phone_number)
VALUES
('E001', 1234567890),
('E001', 9876543210),
('E002', 1112223333),
('E003', 4445556666),
('E003', 7778889999),
('E003', 1231231234),
('E004', 5555555555),
('E005', 9998887777),
('E005', 6666666666),
('E006', 3333333333),
('M001', 2222222222),
('M002', 8888888888),
('M002', 4444444444),
('M003', 7777777777),
('M004', 1239874560),
('M005', 4567890123),
('M005', 7890123456);

-- Insert 30 entries into 'payment' table.
INSERT INTO payment (amount, payment_time, payment_method)
VALUES
(50.00, '2023-01-01 08:00:00', 'Cash'),
(75.50, '2023-01-02 12:30:00', 'Debit'),
(100.00, '2023-01-03 15:45:00', 'Credit'),
(25.75, '2023-01-04 10:20:00', 'Cash'),
(60.25, '2023-01-05 18:00:00', 'Debit'),
(90.50, '2023-01-06 09:30:00', 'Credit'),
(40.00, '2023-01-07 14:15:00', 'Cash'),
(85.75, '2023-01-08 11:45:00', 'Debit'),
(120.00, '2023-01-09 16:30:00', 'Credit'),
(15.25, '2023-01-10 13:00:00', 'Cash'),
(70.50, '2023-01-11 17:20:00', 'Debit'),
(110.75, '2023-01-12 10:45:00', 'Credit'),
(45.00, '2023-01-13 14:00:00', 'Cash'),
(80.25, '2023-01-14 09:15:00', 'Debit'),
(95.50, '2023-01-15 12:40:00', 'Credit'),
(20.00, '2023-01-16 16:00:00', 'Cash'),
(55.75, '2023-01-17 11:30:00', 'Debit'),
(130.50, '2023-01-18 15:55:00', 'Credit'),
(35.25, '2023-01-19 13:10:00', 'Cash'),
(65.00, '2023-01-20 18:10:00', 'Debit'),
(105.75, '2023-01-21 10:00:00', 'Credit'),
(50.00, '2023-01-22 14:30:00', 'Cash'),
(75.50, '2023-01-23 09:45:00', 'Debit'),
(100.00, '2023-01-24 12:15:00', 'Credit'),
(25.75, '2023-01-25 17:00:00', 'Cash'),
(60.25, '2023-01-26 11:20:00', 'Debit'),
(90.50, '2023-01-27 14:45:00', 'Credit'),
(40.00, '2023-01-28 10:30:00', 'Cash'),
(85.75, '2023-01-29 13:50:00', 'Debit'),
(120.00, '2023-01-30 16:25:00', 'Credit');

-- Insert entries into the 'promotion' table
INSERT INTO promotion (promotion_code, description)
VALUES
('PROMO001', '20% Discount on Books'),
('PROMO002', 'Free Membership Upgrade'),
('PROMO003', 'Buy One Get One Free'),
('PROMO004', '50% Off on Second Purchase'),
('PROMO005', 'Exclusive Access to Events');

-- Insert entries into the 'card_promo' table, linking promotions to cards
INSERT INTO card_promo (card_id, promotion_code)
VALUES
(1, 'PROMO001'), -- Card 1, Promotion 1
(1, 'PROMO002'), -- Card 1, Promotion 2
(2, 'PROMO003'), -- Card 2, Promotion 3
(3, 'PROMO004'), -- Card 3, Promotion 4
(3, 'PROMO005'); -- Card 3, Promotion 5

-- Insert entries into 'guest' table
INSERT INTO guest (card_id, guest_name, guest_address, guest_contact_info)
VALUES
(2, 'John Smith', '123 Main Street, Cityville', '555-1234'),
(4, 'Alice Johnson', '456 Oak Avenue, Townburg', '555-5678'),
(2, 'David Lee', '789 Pine Road, Villagetown', '555-9876'),
(4, 'Emily Davis', '321 Elm Lane, Hamlet City', '555-4321'),
(2, 'Michael Brown', '555 Cedar Court, Metropolis', '555-8765'),
(4, 'Sophia White', '987 Birch Street, Suburbia', '555-3456'),
(2, 'Christopher Clark', '654 Maple Drive, Countryside', '555-2109'),
(4, 'Olivia Hall', '876 Willow Avenue, Uptown', '555-6789'),
(2, 'Daniel Turner', '234 Cherry Lane, Downtown', '555-7890'),
(4, 'Emma Taylor', '789 Sycamore Circle, Riverside', '555-1230');

-- Insert entries into 'borrows' table
INSERT INTO borrows (member_id, book_id, payment_id, issued_by_emp_id, date_of_issue, due_date_of_return)
VALUES
('M001', 1, 1, 'E003', '2023-01-01', '2023-01-15'),
('M002', 2, 2, 'E006', '2023-02-01', '2023-02-15'),
('M003', 3, 3, 'E003', '2023-03-01', '2023-03-15'),
('M004', 4, 4, 'E006', '2023-04-01', '2023-04-15'),
('M005', 5, 5, 'E003', '2023-05-01', '2023-05-15'),
('M005', 6, 6, 'E006', '2023-06-01', '2023-06-15'),
('M001', 7, 7, 'E003', '2023-07-01', '2023-07-15'),
('M002', 8, 8, 'E006', '2023-08-01', '2023-08-15'),
('M003', 9, 9, 'E003', '2023-09-01', '2023-09-15'),
('M004', 10, 10, 'E006', '2023-10-01', '2023-10-15'),
('M005', 1, 11, 'E003', '2023-02-01', '2023-02-15'),
('M004', 2, 12, 'E006', '2023-03-01', '2023-03-15'),
('M001', 3, 13, 'E003', '2023-04-01', '2023-04-15'),
('M002', 4, 14, 'E006', '2023-05-01', '2023-05-15'),
('M003', 5, 15, 'E003', '2023-06-01', '2023-06-15'),
('M004', 6, 16, 'E006', '2023-07-01', '2023-07-15'),
('M005', 7, 17, 'E003', '2023-08-01', '2023-08-15'),
('M003', 8, 18, 'E006', '2023-09-01', '2023-09-15'),
('M001', 9, 19, 'E003', '2023-10-01', '2023-10-15'),
('M002', 10, 20, 'E006', '2023-11-01', '2023-11-15'),
('M003', 1, 21, 'E003', '2023-03-01', '2023-03-15'),
('M004', 2, 22, 'E006', '2023-04-01', '2023-04-15'),
('M005', 3, 23, 'E003', '2023-05-01', '2023-05-15'),
('M002', 4, 24, 'E006', '2023-06-01', '2023-06-15'),
('M001', 5, 25, 'E003', '2023-07-01', '2023-07-15'),
('M002', 6, 26, 'E006', '2023-08-01', '2023-08-15'),
('M003', 7, 27, 'E003', '2023-09-01', '2023-09-15'),
('M004', 8, 28, 'E006', '2023-10-01', '2023-10-15'),
('M005', 9, 29, 'E003', '2023-11-01', '2023-11-15'),
('M001', 10, 30, 'E006', '2023-12-01', '2023-12-15');

-- Insert entries into 'person_comment' table
INSERT INTO person_comments (comment_id, person_id, book_id)
VALUES
(1, 'M001', 1),  -- Comment by person M001 on book 1
(2, 'M002', 2),  -- Comment by person M002 on book 2
(3, 'M003', 3),  -- Comment by person M003 on book 3
(4, 'M004', 4),  -- Comment by person M004 on book 4
(5, 'M005', 5),  -- Comment by person M005 on book 5
(6, 'M005', 6),  -- Comment by person M006 on book 6
(7, 'M001', 7),  -- Comment by person M001 on book 7
(8, 'M002', 8),  -- Comment by person M002 on book 8
(9, 'M003', 9),  -- Comment by person M003 on book 9
(10, 'M004', 10), -- Comment by person M004 on book 10
(11, 'M005', 1),  -- Comment by person M005 on book 1
(12, 'M004', 2),  -- Comment by person M006 on book 2
(13, 'M001', 3),  -- Comment by person M001 on book 3
(14, 'M002', 4),  -- Comment by person M002 on book 4
(15, 'M003', 5);

-- Insert 15 records into 'comment' table
INSERT INTO comment (content, timestamp, rating)
VALUES
('Great book! Highly recommended.', '2023-01-05 10:30:00', 5),
('Interesting plot, but slow start.', '2023-02-10 14:45:00', 4),
('Couldn''t put it down! Amazing.', '2023-03-15 18:20:00', 5),
('Disappointed with the ending.', '2023-04-20 22:05:00', 2),
('Well-written and thought-provoking.', '2023-05-25 08:15:00', 4),
('A classic that everyone should read.', '2023-06-30 12:00:00', 5),
('Enjoyed the characters and dialogue.', '2023-07-05 16:30:00', 4),
('Too many plot twists, got confusing.', '2023-08-10 20:45:00', 3),
('Beautifully written, but a bit slow.', '2023-09-15 09:10:00', 4),
('Captivating from start to finish.', '2023-10-20 13:35:00', 5),
('Interesting perspective on the topic.', '2023-11-25 17:50:00', 4),
('The ending left me wanting more.', '2024-01-02 21:15:00', 3),
('Thrilling plot with unexpected twists.', '2024-02-07 08:45:00', 5),
('Character development was lacking.', '2024-03-13 12:10:00', 2),
('Couldn''t connect with the protagonist.', '2024-04-18 16:25:00', 3);

-- Insert 10 entries into 'catalog_manage' table
INSERT INTO catalog_manage (category_id, employee_id, date)
VALUES
('Category1', 'E002', '2023-01-10'),
('Category2', 'E005', '2023-02-15'),
('Category3', 'E002', '2023-03-20'),
('Category1', 'E005', '2023-04-25'),
('Category2', 'E002', '2023-05-30'),
('Category3', 'E005', '2023-06-05'),
('Category1', 'E002', '2023-07-10'),
('Category2', 'E005', '2023-08-15'),
('Category3', 'E002', '2023-09-20'),
('Category1', 'E005', '2023-10-25');