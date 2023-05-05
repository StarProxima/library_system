USE library;

-- Add test data to Author table
INSERT INTO Author (FirstName, LastName)
VALUES
       ('John', 'Doe'),
       ('Jane', 'Doe'),
       ('Mark', 'Smith'),
       ('Emily', 'Jones'),
       ('David', 'Lee'),
       ('Sarah', 'Kim'),
       ('Michael', 'Brown'),
       ('Jennifer', 'Davis'),
       ('William', 'Wilson'),
       ('Olivia', 'Taylor'),
       ('Daniel', 'Clark'),
       ('Sophia', 'Anderson'),
       ('Matthew', 'Thomas'),
       ('Isabella', 'Harris'),
       ('Luke', 'Martin'),
       ('Ava', 'White'),
       ('Christopher', 'Jackson'),
       ('Mia', 'Nelson'),
       ('Andrew', 'Johnson'),
       ('Ella', 'Robinson'),
       ('Joshua', 'Wright'),
       ('Grace', 'Thompson'),
       ('Nicholas', 'Parker'),
       ('Chloe', 'Evans'),
       ('Ryan', 'Edwards'),
       ('Victoria', 'Collins'),
       ('Tyler', 'Green'),
       ('Natalie', 'Baker'),
       ('Brandon', 'Allen'),
       ('Lily', 'King');
-- Add test data to Publisher table
INSERT INTO Publisher (Name)
VALUES
       ('Penguin Random House'),
       ('HarperCollins'),
       ('Simon & Schuster'),
       ('Macmillan Publishers'),
       ('Hachette Livre');
-- Add test data to Book table
INSERT INTO Book (Title, AuthorID, PublisherID)
VALUES
       ('The Great Gatsby', 1, 1),
       ('To Kill a Mockingbird', 2, 2),
       ('1984', 3, 3),
       ('Pride and Prejudice', 4, 4),
       ('The Catcher in the Rye', 5, 5);