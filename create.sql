-- Person
CREATE TABLE IF NOT EXISTS person (
  id VARCHAR(4) PRIMARY KEY CHECK (id ~ '^E[0-9]{3}$|^M[0-9]{3}$'),
  first_name VARCHAR(255) NOT NULL,
  middle_name VARCHAR(255),
  last_name VARCHAR(255) NOT NULL,
  gender VARCHAR(10) NOT NULL,
  date_of_birth DATE NOT NULL,
  address VARCHAR(255) NOT NULL
);

-- Card
CREATE TABLE IF NOT EXISTS card (
  card_id INT PRIMARY KEY,
  date_of_issue DATE NOT NULL,
  membership_level VARCHAR(10) NOT NULL CHECK (membership_level IN ('Silver', 'Gold'))
);

-- Employee
CREATE TABLE IF NOT EXISTS employee (
  emp_id VARCHAR(4) PRIMARY KEY,
  emp_type VARCHAR(2) NOT NULL,
  start_date DATE NOT NULL,
  is_trainer BOOLEAN DEFAULT false,
  trainer_emp_id VARCHAR(4) REFERENCES employee(emp_id),
  CHECK (emp_type IN ('LS', 'CM', 'RP')),
  CHECK (emp_id ~ '^E[0-9]{3}$'),
  CHECK (start_date <= CURRENT_DATE),
  FOREIGN KEY (emp_id) REFERENCES person(id)
);

-- Member
CREATE TABLE IF NOT EXISTS member (
  member_id VARCHAR(4) PRIMARY KEY,
  card_id INT,
  emp_id VARCHAR(4),
  CHECK (member_id ~ '^M[0-9]{3}$'),
  FOREIGN KEY (card_id) REFERENCES card(card_id),
  FOREIGN KEY (member_id) REFERENCES person(id),
  FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

-- Certificate
CREATE TABLE IF NOT EXISTS certificate (
  certificate_number VARCHAR(255),
  cert_issue_date DATE,
  emp_id VARCHAR (4),
  PRIMARY KEY (certificate_number),
  FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

-- Promotion
CREATE TABLE IF NOT EXISTS promotion (
  promotion_code VARCHAR(255) PRIMARY KEY,
  description VARCHAR(255) NOT NULL
);

-- Payment
CREATE TABLE IF NOT EXISTS payment (
  payment_id SERIAL PRIMARY KEY,
  amount DECIMAL(10,2) NOT NULL,
  payment_time TIMESTAMP NOT NULL,
  payment_method VARCHAR(10) NOT NULL CHECK (payment_method IN ('Cash', 'Debit', 'Credit'))
);

-- Publisher
CREATE TABLE IF NOT EXISTS publisher (
  publisher_id SERIAL PRIMARY KEY,
  publisher_name VARCHAR(255) NOT NULL
);

-- Author
CREATE TABLE IF NOT EXISTS author (
  author_id SERIAL PRIMARY KEY,
  author_name VARCHAR(255) NOT NULL
);

-- Category
CREATE TABLE IF NOT EXISTS category (
  category_id VARCHAR(9) PRIMARY KEY,
  description VARCHAR(255) NOT NULL
  CHECK (category_id IN ('Category1', 'Category2', 'Category3')),
);

-- Book
CREATE TABLE IF NOT EXISTS book (
  book_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  publisher_id INT NOT NULL REFERENCES publisher(publisher_id),
  category_id VARCHAR(9) NOT NULL REFERENCES category(category_id)
);

-- Comment
CREATE TABLE IF NOT EXISTS comment (
  comment_id SERIAL PRIMARY KEY,
  content VARCHAR(255) NOT NULL,
  timestamp TIMESTAMP NOT NULL,
  rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5)
);

-- Guest
CREATE TABLE IF NOT EXISTS guest (
  card_id INT NOT NULL REFERENCES card(card_id),
  guest_id SERIAL,
  guest_name VARCHAR(255) NOT NULL,
  guest_address VARCHAR(255) NOT NULL,
  guest_contact_info VARCHAR(255) NOT NULL,
  PRIMARY KEY (card_id, guest_id),
  FOREIGN KEY (card_id) REFERENCES card(card_id)
);

-- Card Promo
CREATE TABLE IF NOT EXISTS card_promo (
  card_id INT,
  promotion_code VARCHAR(255),
  PRIMARY KEY (card_id, promotion_code),
  FOREIGN KEY (card_id) REFERENCES card(card_id),
  FOREIGN KEY (promotion_code) REFERENCES promotion(promotion_code)
);

-- Person_Comments
CREATE TABLE IF NOT EXISTS person_comments (
  comment_id INT,
  person_id VARCHAR(4),
  book_id INT,
  PRIMARY KEY (comment_id, person_id, book_id),
  FOREIGN KEY (comment_id) REFERENCES comment(comment_id),
  FOREIGN KEY (person_id) REFERENCES person(id),
  FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Borrows
CREATE TABLE IF NOT EXISTS borrows (
  member_id VARCHAR(4),
  book_id INT,
  payment_id INT,
  issued_by_emp_id VARCHAR(4),
  date_of_issue DATE,
  due_date_of_return DATE,
  PRIMARY KEY (member_id, book_id, payment_id, issued_by_emp_id),
  FOREIGN KEY (member_id) REFERENCES member(member_id),
  FOREIGN KEY (book_id) REFERENCES book(book_id),
  FOREIGN KEY (payment_id) REFERENCES payment(payment_id),
  FOREIGN KEY (issued_by_emp_id) REFERENCES employee(emp_id)
);

-- Person_Phone
CREATE TABLE IF NOT EXISTS person_phone (
  person_id VARCHAR(4),
  phone_number NUMERIC(10, 0) NOT NULL,
  PRIMARY KEY (person_id, phone_number),
  FOREIGN KEY (person_id) REFERENCES person(id)
);

-- Book_Author
CREATE TABLE IF NOT EXISTS book_author (
  book_id INT,
  author_id INT,
  PRIMARY KEY (book_id, author_id),
  FOREIGN KEY (book_id) REFERENCES book(book_id),
  FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Catalog_Manage
CREATE TABLE IF NOT EXISTS catalog_manage (
  category_id VARCHAR(9),
  employee_id VARCHAR(4),
  date DATE,
  PRIMARY KEY (category_id, employee_id, date),
  FOREIGN KEY (category_id) REFERENCES category(category_id),
  FOREIGN KEY (employee_id) REFERENCES employee(emp_id)
);
