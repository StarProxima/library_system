USE library;

-- Table 1: Author
CREATE TABLE Author
(
    AuthorID   INT PRIMARY KEY AUTO_INCREMENT,
    FirstName  VARCHAR(50) NOT NULL,
    LastName   VARCHAR(50) NOT NULL,
    FatherName VARCHAR(50)
);
-- Table 2: Publisher
CREATE TABLE Publisher
(
    PublisherID INT PRIMARY KEY AUTO_INCREMENT,
    Name        VARCHAR(100) NOT NULL,
    Email       VARCHAR(255)
);
-- Table 3: Book
CREATE TABLE Book
(
    BookID      INT PRIMARY KEY AUTO_INCREMENT,
    Title       VARCHAR(255) NOT NULL,
    AuthorID    INT NOT NULL,
    PublisherID INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Author (AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher (PublisherID)
);
