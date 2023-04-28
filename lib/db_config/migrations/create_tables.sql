USE library;

-- Table 1: Author
CREATE TABLE Author
(
    AuthorID  INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName  VARCHAR(50)
);

-- Table 2: Publisher
CREATE TABLE Publisher
(
    PublisherID INT PRIMARY KEY,
    Name        VARCHAR(100)
);

-- Table 3: Book
CREATE TABLE Book
(
    BookID      INT PRIMARY KEY,
    Title       VARCHAR(255),
    AuthorID    INT,
    PublisherID INT,
    FOREIGN KEY (AuthorID) REFERENCES Author (AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher (PublisherID)
);
