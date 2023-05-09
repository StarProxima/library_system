USE library;

-- Insert 30 authors
INSERT INTO Author (FirstName, LastName, FatherName)
VALUES
       ('John', 'Doe', 'Paul'),
       ('Jane', 'Doe', NULL),
       ('Robert', 'Johnson', 'Michael'),
       ('Emily', 'Smith', NULL),
       ('David', 'Lee', 'William'),
       ('Sarah', 'Taylor', NULL),
       ('Thomas', 'Brown', NULL),
       ('Elizabeth', 'Wilson', 'Jennifer'),
       ('Richard', 'Anderson', 'Matthew'),
       ('Karen', 'Martin', NULL),
       ('William', 'Thompson', NULL),
       ('Nancy', 'Garcia', NULL),
       ('Michael', 'Davis', 'Anthony'),
       ('Mary', 'Miller', NULL),
       ('Christopher', 'Jackson', NULL),
       ('Jessica', 'Perez', 'Marie'),
       ('Brian', 'Moore', NULL),
       ('Megan', 'Allen', NULL),
       ('Anthony', 'Young', NULL),
       ('Laura', 'Harris', 'Christine'),
       ('Kevin', 'King', NULL),
       ('Stephanie', 'Scott', NULL),
       ('Jason', 'Turner', 'Eric'),
       ('Melissa', 'Walker', NULL),
       ('Mark', 'Collins', NULL),
       ('Tiffany', 'Nelson', NULL),
       ('Eric', 'Gonzalez', NULL),
       ('Amy', 'Carter', 'Jennifer'),
       ('Matthew', 'Baker', NULL),
       ('Samantha', 'Edwards', NULL);

-- Insert 10 publishers
INSERT INTO Publisher (Name, Email)
VALUES
       ('Penguin Random House', 'info@penguinrandomhouse.com'),
       ('HarperCollins Publishers', NULL),
       ('Hachette Book Group', NULL),
       ('Macmillan Publishers', 'info@macmillan.com'),
       ('Simon & Schuster', 'info@simonandschuster.com'),
       ('Oxford University Press', NULL),
       ('Cambridge University Press', 'info@cambridge.org'),
       ('Pearson Education', NULL),
       ('Wiley', 'info@wiley.com'),
       ('Bloomsbury Publishing', 'info@bloomsbury.com');
