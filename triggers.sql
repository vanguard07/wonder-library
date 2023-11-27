-- Create a function that checks the age of the referred person
CREATE OR REPLACE FUNCTION check_person_age()
RETURNS TRIGGER AS $$
BEGIN
  IF (SELECT date_of_birth FROM person WHERE id = NEW.emp_id) > CURRENT_DATE - INTERVAL '18 years' THEN
    RAISE EXCEPTION 'Employee must be at least 18 years old.';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger that calls the function before insert on the employee table
CREATE TRIGGER check_employee_age
BEFORE INSERT ON employee
FOR EACH ROW
EXECUTE FUNCTION check_person_age();

CREATE OR REPLACE FUNCTION check_trainer_constraint()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.emp_type = 'RP' AND NEW.trainer_emp_id IS NULL THEN
        RAISE EXCEPTION 'Receptionists must have a trainer.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_trainer_constraint_trigger
BEFORE INSERT OR UPDATE ON Employee
FOR EACH ROW
EXECUTE FUNCTION check_trainer_constraint();


-- Create a function that checks the membership level of the card
CREATE OR REPLACE FUNCTION check_gold_membership()
RETURNS TRIGGER AS $$
BEGIN
  IF (SELECT membership_level FROM card WHERE card_id = NEW.card_id) <> 'Gold' THEN
    RAISE EXCEPTION 'Only gold members are allowed guests';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger that calls the function before insert on the guest table
CREATE TRIGGER check_guest_membership
BEFORE INSERT ON guest
FOR EACH ROW
EXECUTE FUNCTION check_gold_membership();

-- Create a function that checks the employee type
CREATE OR REPLACE FUNCTION check_receptionist_employee()
RETURNS TRIGGER AS $$
BEGIN
  IF (SELECT emp_type FROM employee WHERE emp_id = NEW.issued_by_emp_id) <> 'RP' THEN
    RAISE EXCEPTION 'Only receptionists are allowed to issue books.';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger that calls the function before insert on the borrows table
CREATE TRIGGER check_borrows_employee_type
BEFORE INSERT ON borrows
FOR EACH ROW
EXECUTE FUNCTION check_receptionist_employee();

-- Create a function that checks the employee type
CREATE OR REPLACE FUNCTION check_catalog_manager_employee()
RETURNS TRIGGER AS $$
BEGIN
  IF (SELECT emp_type FROM employee WHERE emp_id = NEW.employee_id) <> 'CM' THEN
    RAISE EXCEPTION 'Only cataloging managers are allowed to catalog books.';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger that calls the function before insert on the Catalog_Manage table
CREATE TRIGGER check_catalog_manager
BEFORE INSERT ON Catalog_Manage
FOR EACH ROW
EXECUTE FUNCTION check_catalog_manager_employee();

-- Create a function that checks if a trainer has a certificate and cert_issue_date
CREATE OR REPLACE FUNCTION check_trainer_certificate()
RETURNS TRIGGER AS $$
BEGIN
  IF (SELECT is_trainer FROM employee WHERE emp_id = NEW.emp_id ) <> FALSE THEN
    RAISE EXCEPTION 'Only trainers can have certificates assigned';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger that calls the function before insert or update on the employee table
CREATE TRIGGER check_trainer_certificate_trigger
BEFORE INSERT OR UPDATE ON certificate
FOR EACH ROW
EXECUTE FUNCTION check_trainer_certificate();