CREATE TABLE WritingGroup(
  groupName varchar(200) NOT NULL,
  headWriter varchar(200) NOT NULL,
  yearFormed date NOT NULL,
  subject varchar(200) NOT NULL,
  CONSTRAINT groups_pk PRIMARY KEY(groupName)
);

CREATE TABLE Publishers(
  publisherName varchar(200) NOT NULL,
  publisherAddress varchar(500) NOT NULL,
  publisherPhone varchar(200) NOT NULL,
  publisherEmail varchar(200) NOT NULL,
  CONSTRAINT publishers_fk PRIMARY KEY(publisherName)
);

CREATE TABLE Books(
  groupName varchar(200) NOT NULL,
  bookTitle varchar(200) NOT NULL,
  publisherName varchar(200) NOT NULL,
  yearPublished integer NOT NULL,
  numberPages integer NOT NULL,
  CONSTRAINT books_pk PRIMARY KEY(groupName, bookTitle),
  CONSTRAINT books_uk01 UNIQUE(bookTitle, publisherName),
  CONSTRAINT books_groups_fk01 FOREIGN KEY(groupName) REFERENCES WritingGroup(groupName),
  CONSTRAINT books_publishers_fk02 FOREIGN KEY(publisherName) REFERENCES Publishers(publisherName)
);

/*
    Note that Al Gore is the headWriter of two separate book
    clubs, and there are multiple clubs with equiv year formed
    as well as subject.
*/
INSERT INTO WritingGroup (groupName, headWriter, yearFormed, subject)
    VALUES ('Science Writers',         'James Hall',       date(2015),  'Science'),
    ('Scientists of Fiction', 'Aaron Andrews',    date(2011),  'Fiction'),
    ('Naturalists on Paper',          'Roger Adams',      date(2001),  'Nature'),
    ('Myth and Religion',    'Rex Texton',       date(2011),  'Religion'),
    ('LA Philosophy',        'Ryan Shaver',      date(2007),  'Philosophy'),
    ('Communist Writers',  'Joseph Stalin',    date(1924),  'Politics'),
    ('Union of Concerned Scientists','Al Gore',          date(2006),  'Science'),
    ('Politcal USA',         'Al Gore',          date(2000),  'Politics'),
    ('Political Activists',  'John Goodman',     date(1997),  'Politics'),
    ('Ocean and Shore Club', 'Sandy Beach',      date(2008),  'Nature');

/*
    Added some publisherAddress to the same state for testing purposes.
*/
INSERT INTO Publishers (publisherName, publisherAddress, publisherPhone, publisherEmail)
    VALUES ('CenTech Publishing Co.',       '1000 South Lane, Utah',                '562-111-1111',  'contact@centech.com'),
    ('Pearson Pub. Co.',             '2777 Ximeno Ave, California',          '661-312-8899',  'personpub@pearson.com'),
    ('Random House Pub. Co.',        '4523 Cherry Lane, New York',           '585-788-2551',  'random@house.com'),
    ('McGraw-Hill Pub. Co.',         '2000 Avenida Rotunda, Washington',     '445-251-2115',  'mcgraw@hill.com'),
    ('Scholastic Pub. Co.',          '9800 Blueberry Avenue, New York',      '585-455-8900',  'scholastic@books.com'),    
    ('Wiley Pub. Co.',               '27000 Newhall Ave, California',        '661-555-9000',  'wiley@wileybooks.com'),
    ('Kondasha Pub. Co.',            '6100 Main Street, New York',           '585-727-1211',  'kondasha@konpub.com'),    
    ('Houghton Mifflin Pub. Co.',    '4567 Hill Drive, Oregon',              '322-544-6999',  'houghton@mifflin.com'),
    ('Cengage Pub. Co.',             '9000 Swamp Drive, Florida',            '477-963-9663',  'cengage@floridabooks.com'),    
    ('Harper Collins Pub. Co.',      '1234 Snake Road, Texas',               '211-215-5445',  'harper@collins.com'),
    ('Simon Pub. Co.',               '2334 Tree Lane, Pennsylvania',         '544-122-3555',  'simon@simonpub.com');
    
INSERT INTO Books (groupName, bookTitle, publisherName, yearPublished, numberPages)
    VALUES ('Science Writers',  'Guide to the Galaxy',      'CenTech Publishing Co.', 2014,  300),
    ('Science Writers',  'Cosmos',                   'Pearson Pub. Co.',       2011,  450),
    ('Science Writers',  'The Selfish Gene',         'Wiley Pub. Co.',         2005,  600),
    ('Science Writers',  'On the Origin of Species', 'Wiley Pub. Co.',         2009,  740),

    ('Scientists of Fiction',  'Enders Game',         'Scholastic Pub. Co.',  1987,  330),
    ('Scientists of Fiction',  'Neuromancer',         'Cengage Pub. Co.',     1999,  500),
    ('Scientists of Fiction',  '1984',                'Simon Pub. Co.',       1995,  460),
    ('Scientists of Fiction',  'The Forever War',     'Kondasha Pub. Co.',    2001,  430),

    ('Naturalists on Paper',  'The Snow Leopard',          'McGraw-Hill Pub. Co.',    2009,  200),
    ('Naturalists on Paper',  'Silent Spring',             'McGraw-Hill Pub. Co.',    2003,  415),
    ('Naturalists on Paper',  'All About Yosemite',        'Harper Collins Pub. Co.', 2005,  230),
    ('Naturalists on Paper',  'Pilgrim at Tinker Creek',   'Wiley Pub. Co.',          2000,  404),

    ('Myth and Religion',  'American Gods',      'Random House Pub. Co.',        2002,  300),
    ('Myth and Religion',  'Mythology',          'Random House Pub. Co.',        1999,  300),
    ('Myth and Religion',  'The Holy Bible',     'Houghton Mifflin Pub. Co.',    2016,  900),
    ('Myth and Religion',  'Mere Christianity',  'Houghton Mifflin Pub. Co.',    2004,  650),

    ('LA Philosophy',  'Meditations on First Philosophy',    'Wiley Pub. Co.',           2000,  433),
    ('LA Philosophy',  'Platos Republic',                    'CenTech Publishing Co.',   2005,  300),
    ('LA Philosophy',  'Beyond Good and Evil',               'Scholastic Pub. Co.',      2002,  1001),
    ('LA Philosophy',  'Critique of Pure Reason',            'Harper Collins Pub. Co.',  2007,  800),

    ('Communist Writers',  'Das Kapital',                      'Wiley Pub. Co.',       2001,  750),
    ('Communist Writers',  'Critique of Hegels Philosophy',    'Kondasha Pub. Co.',    1987,  490),
    ('Communist Writers',  'The State and Revolution',         'Pearson Pub. Co.',     1990,  740),
    ('Communist Writers',  'Communist Manifesto',                 'Pearson Pub. Co.',             1966,  500),

    ('Union of Concerned Scientists',  'The Lorax',                          'Pearson Pub. Co.',          1997,  34),
    ('Union of Concerned Scientists',  'Problems of the Pacific',            'Wiley Pub. Co.',            2006,  390),
    ('Union of Concerned Scientists',  'Climate Change: A Brief History',    'Scholastic Pub. Co.',      2003,  470),
    ('Union of Concerned Scientists',  'Desert Solitaire',                   'Random House Pub. Co.',    2009,  330),
    ('Union of Concerned Scientists',  'A History of Extinction',            'Houghton Mifflin Pub. Co.',2004,  587),

    ('Politcal USA',  'The Prince',                          'Pearson Pub. Co.',             1977,  405),
    ('Politcal USA',  'The Second Treatise Of Government',   'Wiley Pub. Co.',               1988,  877),
    ('Politcal USA',  'A Theory of Justice',                 'Houghton Mifflin Pub. Co.',    2008,  766),

    ('Political Activists',  'Political Liberalism',     'Kondasha Pub. Co.',            2001,  377),
    ('Political Activists',  'On Libery',                'Pearson Pub. Co.',             1971,  656),

    ('Ocean and Shore Club',  'Moby Dick',                        'Cengage Pub. Co.',        1989,  2000),
    ('Ocean and Shore Club',  'The Edge of the Sea',              'CenTech Publishing Co.',  2005,  233),
    ('Ocean and Shore Club',  'The Sea Around Us',                'Harper Collins Pub. Co.', 2017,  444),
    ('Ocean and Shore Club',  'Under the Sea Wind',               'McGraw-Hill Pub. Co.',    2011,  501),
    ('Ocean and Shore Club',  'Ocean',                            'Houghton Mifflin Pub. Co.',2007, 333);
