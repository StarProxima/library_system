USE library;

-- Inserting data into Author table
INSERT INTO Author (AuthorID, FirstName, LastName)
VALUES (1, 'J.K.', 'Rowling'),
       (2, 'Agatha', 'Christie'),
       (3, 'Stephen', 'King'),
       (4, 'Harper', 'Lee'),
       (5, 'Ernest', 'Hemingway');

-- Inserting data into Publisher table
INSERT INTO Publisher (PublisherID, Name)
VALUES (1, 'Penguin Random House'),
       (2, 'HarperCollins'),
       (3, 'Simon & Schuster'),
       (4, 'Hachette Livre'),
       (5, 'Macmillan Publishers');

-- Inserting data into Book table
INSERT INTO Book (BookID, Title, AuthorID, PublisherID)
VALUES (1, 'Harry Potter and the Philosopher''s Stone', 1, 1),
       (2, 'Murder on the Orient Express', 2, 2),
       (3, 'The Shining', 3, 3),
       (4, 'To Kill a Mockingbird', 4, 4),
       (5, 'The Old Man and the Sea', 5, 5);