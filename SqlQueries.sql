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