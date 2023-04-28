USE library;

-- Inserting data into Author table
INSERT INTO Author (AuthorID, FirstName, LastName)
VALUES (1, 'J.K.', 'Rowling'),
       (2, 'Agatha', 'Christie'),
       (3, 'Stephen', 'King'),
       (4, 'Harper', 'Lee'),
       (5, 'Ernest', 'Hemingway'),
       (6, 'George R.R.', 'Martin'),
       (7, 'J.R.R.', 'Tolkien'),
       (8, 'Dan', 'Brown'),
       (9, 'Paulo', 'Coelho'),
       (10, 'Johanna', 'Spyri'),
       (11, 'Jules', 'Verne'),
       (12, 'Mark', 'Twain'),
       (13, 'Arthur Conan', 'Doyle'),
       (14, 'William', 'Shakespeare'),
       (15, 'Jane', 'Austen'),
       (16, 'Charles', 'Dickens'),
       (17, 'Fyodor', 'Dostoyevsky'),
       (18, 'Leo', 'Tolstoy'),
       (19, 'Oscar', 'Wilde'),
       (20, 'Victor', 'Hugo'),
       (21, 'Herman', 'Melville'),
       (22, 'Emily', 'Bronte'),
       (23, 'Charlotte', 'Bronte'),
       (24, 'Anne', 'Bronte'),
       (25, 'George', 'Orwell'),
       (26, 'Aldous', 'Huxley'),
       (27, 'Kurt', 'Vonnegut'),
       (28, 'Ray', 'Bradbury'),
       (29, 'Ayn', 'Rand'),
       (30, 'George', 'Orwell'),
       (31, 'Aldous', 'Huxley'),
       (32, 'Kurt', 'Vonnegut'),
       (33, 'Ray', 'Bradbury'),
       (34, 'Ayn', 'Rand'),
       (35, 'George', 'Orwell'),
       (36, 'Aldous', 'Huxley'),
       (37, 'Kurt', 'Vonnegut'),
       (38, 'Ray', 'Bradbury'),
       (39, 'Ayn', 'Rand'),
       (40, 'George', 'Orwell'),
       (41, 'Aldous', 'Huxley'),
       (42, 'Kurt', 'Vonnegut'),
       (43, 'Ray', 'Bradbury'),
       (44, 'Ayn', 'Rand'),
       (45, 'George', 'Orwell'),
       (46, 'Aldous', 'Huxley'),
       (47, 'Kurt', 'Vonnegut'),
       (48, 'Ray', 'Bradbury'),
       (49, 'Ayn', 'Rand'),
       (50, 'George', 'Orwell'),
       (51, 'Aldous', 'Huxley');


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