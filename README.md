# Wonder Library
This database project was developed as part of the CS6360 Database Design course taught by Professor Wei Wu during the Fall 2023 semester at The University of Texas at Dallas. The project focuses on creating a relational database for Wonder Library, a library catering to all age groups.

# Project Components

## Person
- A person can be either an Employee or a Member.
- Details recorded include Person ID, Name (First, Middle, Last), Address, Gender, Date of Birth, and Phone number.

## Employee
- Employees must be at least 18 years old.
- Employee ID format is "EXXX" (e.g., E001, E999).
- Employee classes: Library Supervisors, Cataloging Managers, Receptionists.
- Receptionists must be trained by a Trainer, who can be a Library Supervisor or a Cataloging Manager.
- Trainers have a unique certificate number and can train multiple Receptionists.

## Member
- Members are issued library cards.
- Library card details include Card ID, Date of Issue, and Membership Level (Silver or Gold).
- Gold members can bring guests, and guest details are recorded.

## Books
- Book details include Book ID, Title, and Category (Cate. 1, Cate. 2, Cate. 3).
- Each book is assumed to be published by a single publisher.
- Books can have multiple authors, and authors can write multiple books.

## Promotions
- Promotions are associated with library cards.
- Each Promotion has a unique Promotion code and a description.

## Comments
- Members can make comments on books.
- Comments include Comment Time, Rating Score (1 to 5), and Comment Contents.

## Publisher
- Publishers can publish multiple books.
- Publisher details include Publisher ID and Publisher Name.

## Borrowing Records
- Receptionists maintain records of borrowing details.
- Borrowing details include information about the borrowed book, date of issue, and due date of return.
- Details of the person borrowing the book, the receptionist, and payment details are recorded.

# Contributors

Course Instructor: Professor Wei Wu  
Project Team Members:
- Avtans Kumar
- Animesh Maheswari
- Tushar Tank

# Project Status

This project is part of the semester-long coursework and will undergo continuous development and refinement throughout the semester.