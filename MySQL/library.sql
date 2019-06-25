DROP DATABASE IF EXISTS library;
CREATE DATABASE library CHARSET 'utf8';
USE library;

CREATE TABLE AUTHORS (
	Authorname VARCHAR(50) NOT NULL,
    PRIMARY KEY(Authorname)

);


CREATE TABLE BOOKS (
	Isbn CHAR(15),
    Bookname VARCHAR(30) NOT NULL,
    Releaseyear VARCHAR(15) NOT NULL,
	PRIMARY KEY(Isbn)

);

CREATE TABLE BOOKSANDAUTHORS (
	Author VARCHAR(50) NOT NULL,
    Isbnnum CHAR(15),
    FOREIGN KEY(Author) REFERENCES AUTHORS(Authorname),
    FOREIGN KEY(Isbnnum) REFERENCES BOOKS(Isbn)

);


INSERT INTO AUTHORS (Authorname) VALUES ('Stephen King');
INSERT INTO AUTHORS (Authorname) VALUES ('Thomas Harris');
INSERT INTO AUTHORS (Authorname) VALUES ('John Higgins and Alfred Pedroza');
INSERT INTO AUTHORS (Authorname) VALUES ('Victor Hugo');
INSERT INTO AUTHORS (Authorname) VALUES ('William Shakespeare');

INSERT INTO BOOKS (Isbn, Bookname, Releaseyear) VALUES ('1347-629-817', 'It', '1986');
INSERT INTO BOOKS (Isbn, Bookname, Releaseyear) VALUES ('1245-378-591', 'The Silence Of The Lambs', '1981');
INSERT INTO BOOKS (Isbn, Bookname, Releaseyear) VALUES ('4571-826-349', 'Adventures in South America', '1993');
INSERT INTO BOOKS (Isbn, Bookname, Releaseyear) VALUES ('1726-351-492', 'Les Misérables', '1862');
INSERT INTO BOOKS (Isbn, Bookname, Releaseyear) VALUES ('1362-745-266', 'Romeo and Juliet', '1597');

 SELECT b.Isbn FROM BOOKS b
 LEFT JOIN BOOKSANDAUTHORS c
 ON c.Isbnnum = b.Isbn;
 
 SELECT a.Authorname FROM AUTHORS a
 LEFT JOIN BOOKSANDAUTHORS c
 ON c.Author = a.Authorname;

SELECT b.Bookname
FROM BOOKS b
WHERE b.Releaseyear='1986'
GROUP BY b.Bookname;

SELECT b.Bookname, b.Releaseyear, b.Isbn
FROM BOOKS b, AUTHORS a
WHERE a.Authorname='Stephen King' 
OR a.Authorname='Thomas Harris' 
OR a.Authorname='John Higgins and Alfred Pedroza' 
OR a.Authorname='Victor Hugo' 
OR a.Authorname='William Shakespeare'
GROUP BY b.Bookname, b.Releaseyear, b.Isbn;

 SELECT c.Author
 FROM BOOKSANDAUTHORS c
 WHERE c.Isbnnum='1347-629-817'
 GROUP BY c.Author; -- identical to the one below, but doesn't work

-- SELECT a.Authorname
-- FROM AUTHORS a, BOOKS b
-- WHERE b.Isbn='1347-629-817'
-- GROUP BY a.Authorname;

SELECT COUNT(b.Bookname)
FROM BOOKS b, AUTHORS a
WHERE a.Authorname = 'Stephen King';

SELECT b.Bookname, a.Authorname
FROM BOOKS b, AUTHORS a
WHERE b.Releaseyear = '1986' AND a.Authorname = 'Stephen King'
GROUP BY b.Bookname, a.Authorname;

 


