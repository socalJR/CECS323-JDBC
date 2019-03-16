-- List all writing groups
SELECT groupName FROM WritingGroups;

-- List all the data for a group specified by the user
SELECT * FROM WritingGroups
WHERE groupName = 'groupName';

-- List all publishers
SELECT publisherName FROM Publishers;

-- List all the data for a publisher specified by the user
SELECT * FROM Publishers
WHERE publisherName = 'publisherName';

-- List all book titles
SELECT bookTitle FROM Books;

-- List all the data for a single book specified by the user
SELECT * FROM Books
WHERE bookTitle = 'bookTitle';

-- Insert a new book
INSERT INTO Books (GroupName, BookTitle, PublisherName, YearPublished, NumberPages)
Value('groupName', 'bookTitle', 'publisherName', 'yearPublished', 'numberPages');

-- Insert a new publisher and update all book published by one publisher to be published by the new pubisher.
INSERT INTO Publisher (PublisherName, PublisherAddress, PublisherPhone, PublisherEmail)
Value('publisherName', 'publicAddress', 'publisherAddress', 'publisherPhone', 'publisherEmail');
UPDATE Books SET publisherName = 'newPublisher'
WHERE publisherName = 'oldPublisher';
DELETE FROM Publishers
WHERE publisherName = 'oldPublisher';

-- Remove a single book specified by the user
DELETE FROM Books
WHERE bookTitle = 'bookTitle'; 
