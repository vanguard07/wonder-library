-- Insert 10 records into the 'person' table
INSERT INTO person (id, first_name, middle_name, last_name, gender, date_of_birth, address) VALUES
('E001', 'Jon', 'Snow', 'Doe', 'Male', '1990-07-15', 'Winterfell, Westeros'),
('E002', 'Daenerys', 'Targaryen', 'Stormborn', 'Female', '1986-05-26', 'Dragonstone, Westeros'),
('E003', 'Tyrion', NULL, 'Lannister', 'Male', '1980-11-11', 'Casterly Rock, Westeros'),
('E004', 'Arya', NULL, 'Stark', 'Female', '1996-04-03', 'Winterfell, Westeros'),
('E005', 'Cersei', NULL, 'Lannister', 'Female', '1975-09-05', 'Kings Landing, Westeros'),
('E006', 'Sansa', NULL, 'Stark', 'Female', '1992-03-05', 'Winterfell, Westeros'),
('E007', 'Samwell', 'Tarly', 'Tarly', 'Male', '1993-11-15', 'Horn Hill, Westeros'),
('M001', 'Walter', 'Hartwell', 'White', 'Male', '1959-09-07', 'Albuquerque, New Mexico'),
('M002', 'Jesse', 'Bruce', 'Pinkman', 'Male', '1984-09-24', 'Albuquerque, New Mexico'),
('M003', 'Saul', NULL, 'Goodman', 'Male', '1962-03-12', 'Albuquerque, New Mexico'),
('M004', 'Skyler', 'Anne', 'White', 'Female', '1970-08-11', 'Albuquerque, New Mexico'),
('M005', 'Hank', NULL, 'Schrader', 'Male', '1967-04-04', 'Albuquerque, New Mexico'),
('M006', 'Eleven', NULL, 'Ives', 'Female', '2006-12-01', 'Hawkins, Indiana'),
('M007', 'Dustin', NULL, 'Henderson', 'Male', '2003-02-28', 'Hawkins, Indiana'),
('M008', 'Will', NULL, 'Byers', 'Male', '2005-03-22', 'Hawkins, Indiana'),
('M009', 'Maxine', 'Mayfield', 'May', 'Female', '2002-07-04', 'Hawkins, Indiana'),
('M010', 'Mike', NULL, 'Wheeler', 'Male', '2004-01-15', 'Hawkins, Indiana');

-- Insert into Card table
INSERT INTO card (card_id, date_of_issue, membership_level)
VALUES
(1, '2012-01-01', 'Silver'),
(2, '2020-02-15', 'Gold'),
(3, '2023-03-20', 'Silver'),
(4, '2018-04-10', 'Gold'),
(5, '2019-05-05', 'Silver'),
(6, '2016-06-30', 'Gold'),
(7, '2019-07-18', 'Silver'),
(8, '2020-08-22', 'Gold'),
(9, '2023-09-14', 'Silver'),
(10, '2023-11-25', 'Gold'),
(11, '2021-11-25', 'Silver'),
(12, '2023-02-09', 'Gold'),
(13, '2023-02-14', 'Silver');

-- Insert into Member table
INSERT INTO member (member_id, card_id)
VALUES
('M001', 1),
('M002', 2),
('M003', 3),
('M004', 4),
('M005', 5),
('M006', 6),
('M007', 7),
('M008', 8),
('M009', 9),
('M010', 10),
('E001', 11),
('E002', 12),
('E003', 13);

-- Insert into Employee table
INSERT INTO employee (emp_id, emp_type, start_date, is_trainer, trainer_emp_id, training_completion_date)
VALUES
('E001', 'LS', '2021-01-15', true, NULL, NULL),
('E002', 'CM', '2023-02-28', false, NULL, NULL),
('E003', 'RP', '2022-10-22', false, 'E001', '2022-10-24'),
('E004', 'LS', '2023-11-20', false, NULL, NULL),
('E005', 'CM', '2022-05-05', true, NULL, NULL),
('E006', 'RP', '2023-03-22', false, 'E005', '2023-03-28'),
('E007', 'RP', '2023-10-25', false, 'E005', '2023-03-30');

INSERT INTO certificate (certificate_number, cert_issue_date, emp_id)
VALUES
('Cert001', '2022-10-18', 'E001'),
('Cert002', '2022-12-19', 'E005');

-- Insert 3 records into the 'category' table
INSERT INTO category (category_id, description)
VALUES
('Category1', 'Adventure-Mystery'),
('Category2', 'Non-Fiction'),
('Category3', 'Fantasy');

-- Insert 10 records into the 'publisher' table
INSERT INTO publisher (publisher_name)
VALUES
('Penguin Random House'),
('HarperCollins'),
('Simon & Schuster'),
('Macmillan Publishers'),
('Hachette Livre'),
('Wiley'),
('Oxford University Press'),
('Scholastic Corporation'),
('Random House'),
('Harvard University Press');

-- Insert into Book table
INSERT INTO book (title, publisher_id, category_id)
VALUES
('The Lost City', 1, 'Category1'),
('Into the Wild', 2, 'Category2'),
('The Hobbit', 3, 'Category3'),
('The Da Vinci Code', 4, 'Category1'),
('Sapiens: A Brief History of Humankind', 5, 'Category2'),
('Harry Potter and the Philosopher''s Stone', 6, 'Category3'),
('The Adventures of Sherlock Holmes', 7, 'Category1'),
('Educated', 8, 'Category2'),
('The Lord of the Rings', 9, 'Category3'),
('Angels & Demons', 10, 'Category1'),
('Cosmos', 1, 'Category2'),
('The Chronicles of Narnia', 2, 'Category3'),
('Murder on the Orient Express', 3, 'Category1'),
('Becoming', 4, 'Category2'),
('Alice''s Adventures in Wonderland', 5, 'Category3'),
('The Girl with the Dragon Tattoo', 6, 'Category1'),
('The Power of Habit', 7, 'Category2'),
('A Game of Thrones', 8, 'Category3'),
('The Catcher in the Rye', 9, 'Category1'),
('To Kill a Mockingbird', 10, 'Category2');

-- Insert into the 'author' table
INSERT INTO author (author_name)
VALUES
('Douglas Preston'),
('Lincoln Child'),  
('Jon Krakauer'),    
('J.R.R. Tolkien'),  
('Dan Brown'),       
('Yuval Noah Harari'),
('J.K. Rowling'),     
('Arthur Conan Doyle'),
('Tara Westover'),    
('J.R.R. Tolkien'),   
('Dan Brown'),        
('Carl Sagan'),       
('C.S. Lewis'),       
('Agatha Christie'),  
('Michelle Obama'),   
('Lewis Carroll'),    
('Stieg Larsson'),    
('Charles Duhigg'),   
('George R.R. Martin'),
('J.D. Salinger'),    
('Harper Lee');  

-- Assign authors to books
INSERT INTO book_author (book_id, author_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 4),
(10, 5),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- Insert into Person_Phone table
INSERT INTO person_phone (person_id, phone_number)
VALUES
('E001', 1234567890),
('E001', 9876543210),
('E002', 1112233444),
('E002', 5556667777),
('E003', 9998887777),
('E004', 3334445555),
('E005', 7778889999),
('E006', 7771239999),
('E007', 4351349999),
('M001', 1111111111),
('M001', 2222222222),
('M002', 3333333333),
('M002', 4444444444),
('M003', 5555555555),
('M004', 6666666666),
('M005', 7777777777),
('M006', 8888888888),
('M007', 9999999999),
('M008', 1231231234),
('M009', 9876543210),
('M010', 8765432109);

INSERT INTO payment (amount, payment_time, payment_method)
VALUES
(25.00, '2023-01-10 12:30:00', 'Cash'),
(18.50, '2023-02-05 15:45:00', 'Cash'),
(30.20, '2023-03-12 10:20:00', 'Cash'),
(22.75, '2023-04-20 09:15:00', 'Cash'),
(28.90, '2023-05-25 14:00:00', 'Cash'),
(35.60, '2023-06-30 11:45:00', 'Cash'),
(40.25, '2023-07-15 13:20:00', 'Cash'),
(15.80, '2023-08-22 16:10:00', 'Cash'),
(23.45, '2023-09-18 09:30:00', 'Cash'),
(19.75, '2023-10-27 10:55:00', 'Cash'),
(30.50, '2023-01-15 14:15:00', 'Debit'),
(15.25, '2023-02-20 11:30:00', 'Debit'),
(25.75, '2023-03-25 16:45:00', 'Debit'),
(18.90, '2023-04-30 10:30:00', 'Debit'),
(22.40, '2023-05-10 09:20:00', 'Debit'),
(28.75, '2023-06-05 12:40:00', 'Debit'),
(32.60, '2023-07-18 15:55:00', 'Debit'),
(20.30, '2023-08-23 08:25:00', 'Debit'),
(26.90, '2023-09-28 14:15:00', 'Debit'),
(14.50, '2023-10-10 11:05:00', 'Debit'),
(40.00, '2023-01-28 13:40:00', 'Credit'),
(35.20, '2023-02-12 10:00:00', 'Credit'),
(29.75, '2023-03-20 11:20:00', 'Credit'),
(19.90, '2023-04-15 09:35:00', 'Credit'),
(27.45, '2023-05-03 14:50:00', 'Credit'),
(22.80, '2023-06-18 08:45:00', 'Credit'),
(31.60, '2023-07-02 15:30:00', 'Credit'),
(25.30, '2023-08-05 16:10:00', 'Credit'),
(18.75, '2023-09-10 13:00:00', 'Credit'),
(21.40, '2023-10-15 10:45:00', 'Credit'),
(12.40, '2023-11-15 19:45:00', 'Credit'),
(25.99, '2023-11-10 15:30:00', 'Debit'),
(15.50, '2023-11-12 12:45:00', 'Cash'),
(30.75, '2023-11-15 09:15:00', 'Credit'),
(12.99, '2023-11-18 17:00:00', 'Cash'),
(50.25, '2023-11-20 14:20:00', 'Debit'),
(42.50, '2023-11-25 10:00:00', 'Credit'),
(43.50, '2022-11-25 10:00:00', 'Debit'),
(21.40, '2022-12-02 10:45:00', 'Credit'),
(25.75, '2023-01-05 16:45:00', 'Debit'),
(18.90, '2023-02-10 10:30:00', 'Debit'),
(22.40, '2023-03-15 09:20:00', 'Debit'),
(35.60, '2023-04-20 11:45:00', 'Cash'),
(40.25, '2023-05-25 13:20:00', 'Cash'),
(15.80, '2023-06-05 16:10:00', 'Cash'),
(29.75, '2023-07-10 11:20:00', 'Credit'),
(19.90, '2023-08-15 09:35:00', 'Credit'),
(27.45, '2023-09-20 14:50:00', 'Credit'),
(28.90, '2023-10-25 14:00:00', 'Cash'),
(28.90, '2023-11-05 14:00:00', 'Cash'),
(19.90, '2023-12-01 09:35:00', 'Credit');

-- Insert into Promotion table
INSERT INTO promotion (promotion_code, description)
VALUES
('PROMO001', '10% off on Fiction Books'),
('PROMO002', 'Buy 2, Get 1 Free on Mystery Books'),
('PROMO003', 'Free Membership Upgrade to Gold for a Month'),
('PROMO004', '20% Cashback on Non-Fiction Books'),
('PROMO005', 'Special Discount for Fantasy Book Lovers');

INSERT INTO card_promo (card_id, promotion_code)
VALUES
(1, 'PROMO001'),
(2, 'PROMO002'),
(3, 'PROMO003'),
(4, 'PROMO004'),
(5, 'PROMO005'),
(6, 'PROMO001'),
(7, 'PROMO003'),
(8, 'PROMO002'),
(9, 'PROMO004'),
(10, 'PROMO005'),
(11, 'PROMO001'),
(12, 'PROMO002'),
(13, 'PROMO003');

INSERT INTO guest (card_id, guest_name, guest_address, guest_contact_info)
VALUES
(2, 'Jim Halpert', '123 Scranton St, Scranton, PA', '555-1234'),
(4, 'Pam Beesly', '456 Dunder Mifflin Pkwy, Scranton, PA', '555-5678'),
(6, 'Michael Scott', '789 Dundie Dr, Scranton, PA', '555-9876'),
(8, 'Dwight Schrute', '101 Beet Farm Ln, Schrute Farms, PA', '555-4321'),
(10, 'Stanley Hudson', '202 Pretzel St, Scranton, PA', '555-8765'),
(12, 'Kelly Kapoor', '303 Fashion Ave, Scranton, PA', '555-2345'),
(2, 'Angela Martin', '404 Cat St, Scranton, PA', '555-6789'),
(4, 'Kevin Malone', '505 Chili Ln, Scranton, PA', '555-5432'),
(6, 'Oscar Martinez', '606 Accounting Blvd, Scranton, PA', '555-8765'),
(8, 'Phyllis Vance', '707 Floral Dr, Scranton, PA', '555-1234'),
(10, 'Ryan Howard', '808 Temp Ln, Scranton, PA', '555-9876'),
(12, 'Meredith Palmer', '909 Booze St, Scranton, PA', '555-2345'),
(10, 'Creed Bratton', '999 Unknown Ave, Scranton, PA', '555-8765'),
(12, 'Andy Bernard', '111 Cornell Dr, Scranton, PA', '555-4321'),
(10, 'Holly Flax', '222 Nashua St, Nashua, NH', '555-5678');

INSERT INTO borrows (member_id, book_id, payment_id, issued_by_emp_id, date_of_issue, due_date_of_return)
VALUES 
('M010', 10, 10, 'E007', '2023-10-27', '2023-11-27'),
('M010', 11, 11, 'E003', '2023-01-15', '2023-02-15'),
('M003', 12, 12, 'E003', '2023-02-20', '2023-03-20'),
('M008', 13, 13, 'E006', '2023-03-25', '2023-04-25'),
('M007', 14, 14, 'E006', '2023-04-30', '2023-05-30'),
('M006', 15, 15, 'E006', '2023-05-10', '2023-06-10'),
('M005', 16, 16, 'E003', '2023-06-05', '2023-07-05'),
('M004', 17, 17, 'E003', '2023-07-18', '2023-08-18'),
('E001', 18, 18, 'E006', '2023-08-23', '2023-09-23'),
('E001', 19, 19, 'E006', '2023-09-28', '2023-10-28'),
('E001', 20, 20, 'E003', '2023-10-10', '2023-11-10'),
('M004', 1, 21, 'E003', '2023-01-28', '2023-02-28'),
('M007', 2, 22, 'E003', '2023-02-12', '2023-03-12'),
('E003', 3, 23, 'E003', '2023-03-20', '2023-04-20'),
('E002', 4, 24, 'E006', '2023-04-15', '2023-05-15'),
('M005', 5, 25, 'E006', '2023-05-03', '2023-06-03'),
('M006', 6, 26, 'E006', '2023-06-18', '2023-07-18'),
('M007', 7, 27, 'E003', '2023-07-02', '2023-08-02'),
('M008', 8, 28, 'E003', '2023-08-05', '2023-09-05'),
('M001', 9, 29, 'E006', '2023-09-10', '2023-10-10'),
('M009', 10, 30, 'E003', '2023-10-15', '2023-11-15'),
('E002', 11, 31, 'E006', '2023-11-15', '2023-12-15'),
('M008', 3, 32, 'E003', '2023-11-10', '2023-12-10'),
('M008', 5, 33, 'E006', '2023-11-12', '2023-12-12'),
('M008', 7, 34, 'E003', '2023-11-15', '2023-12-15'),
('M008', 9, 35, 'E006', '2023-11-18', '2023-12-18'),
('M008', 10, 36, 'E003', '2023-11-20', '2023-12-20'),
('M008', 3, 37, 'E007', '2023-11-25', '2023-12-25'),
('M007', 10, 38, 'E003', '2022-11-25', '2022-12-25'),
('M007', 3, 39, 'E003', '2022-12-02', '2023-01-02'),
('M007', 1, 40, 'E003', '2023-01-05', '2023-02-05'),
('M007', 2, 41, 'E003', '2023-02-10', '2023-03-10'),
('M007', 3, 42, 'E003', '2023-03-15', '2023-04-15'),
('M007', 4, 43, 'E003', '2023-04-20', '2023-05-20'),
('M007', 5, 44, 'E003', '2023-05-25', '2023-06-25'),
('M007', 6, 45, 'E003', '2023-06-05', '2023-07-05'),
('M007', 7, 46, 'E003', '2023-07-10', '2023-08-10'),
('M007', 8, 47, 'E003', '2023-08-15', '2023-09-15'),
('M007', 9, 48, 'E003', '2023-09-20', '2023-10-20'),
('M007', 10, 49, 'E003', '2023-10-25', '2023-11-25'),
('M007', 11, 50, 'E003', '2023-11-05', '2023-12-05'),
('M007', 12, 51, 'E003', '2023-12-10', '2024-01-10');


-- INSERT INTO borrows (member_id, book_id, payment_id, issued_by_emp_id, date_of_issue, due_date_of_return)
-- VALUES
-- ('M006', 11, 15, 'E006', '2022-05-10', '2023-06-10'),
-- ('M006', 2, 26, 'E006', '2022-06-18', '2023-07-18'),
-- ('M008', 3, 33, 'E006', '2022-11-12', '2023-12-12'),
-- ('M008', 5, 34, 'E003', '2022-11-15', '2023-12-15'),
-- ('M008', 7, 35, 'E006', '2022-11-18', '2023-12-18'),
-- ('M008', 2, 37, 'E007', '2022-11-25', '2023-12-25');

INSERT INTO comment (content, timestamp, rating)
VALUES
('Great read!', '2023-01-16 10:30:00', 4),
('Interesting plot twists!', '2023-02-20 12:15:00', 5),
('Couldn''t put it down!', '2023-03-25 14:45:00', 5),
('Liked the character development.', '2023-04-30 11:30:00', 4),
('The ending was a surprise!', '2023-05-28 09:45:00', 4),
('Well-written and engaging.', '2023-07-05 13:00:00', 5),
('Not my favorite genre, but enjoyed it.', '2023-07-18 15:30:00', 3),
('Would recommend to others.', '2023-08-23 08:45:00', 5),
('Too predictable.', '2023-09-28 14:15:00', 2),
('The author''s best work!', '2023-10-29 11:05:00', 5),
('Meh, didn''t leave a lasting impression.', '2023-08-28 13:40:00', 3),
('Thought-provoking.', '2023-04-22 10:00:00', 4),
('Must-read for fans of the genre.', '2023-03-21 11:20:00', 5),
('Couldn''t connect with the characters.', '2023-07-15 09:35:00', 2),
('Disappointing ending.', '2023-11-23 14:50:00', 2);

INSERT INTO person_comments (comment_id, person_id, book_id)
VALUES
(1, 'M001', 1),
(2, 'M002', 2),
(3, 'M003', 3),
(4, 'M004', 4),
(5, 'M005', 5),
(6, 'M006', 6),
(7, 'M007', 7),
(8, 'M008', 8),
(9, 'M009', 9),
(10, 'M010', 10),
(11, 'E001', 18),
(12, 'E002', 4),
(13, 'E003', 3),
(14, 'M006', 6),
(15, 'M009', 10);

-- Insert into Catalog_Manage table
INSERT INTO catalog_manage (category_id, employee_id, date)
VALUES
('Category1', 'E002', '2023-03-01'),
('Category2', 'E005', '2023-04-01'),
('Category3', 'E002', '2023-05-01'),
('Category1', 'E002', '2023-06-06'),
('Category2', 'E005', '2023-07-06'),
('Category3', 'E005', '2023-08-06'),
('Category1', 'E005', '2023-11-11'),
('Category2', 'E005', '2023-11-20'),
('Category3', 'E005', '2023-11-29'),
('Category1', 'E002', '2023-09-06'); 