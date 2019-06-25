DROP DATABASE IF EXISTS school;
CREATE DATABASE school CHARSET 'utf8';
USE school;

CREATE TABLE Students(
    Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Num INTEGER NOT NULL,
    ClassNum INTEGER NOT NULL,
    ClassLetter CHAR(1) NOT NULL,
    Birthday DATE,
    EGN CHAR(10),
    EntranceExamResult NUMERIC(3,2)
);

CREATE TABLE Subjects(
    Id INTEGER NOT NULL AUTO_INCREMENT,
    Name VARCHAR(100),
   
    PRIMARY KEY(Id)
);

CREATE TABLE StudentMarks(
    StudentId INTEGER NOT NULL,
    SubjectId INTEGER NOT NULL,
    ExamDate DATETIME NOT NULL,
    Mark NUMERIC(3,2) NOT NULL,
   
    PRIMARY KEY( StudentId, SubjectId, ExamDate ),
    FOREIGN KEY (StudentId) REFERENCES Students(Id),
    FOREIGN KEY (SubjectId) REFERENCES Subjects(Id)
);

CREATE TABLE MarkWords(
    RangeStart NUMERIC(3,2) NOT NULL,
    RangeEnd NUMERIC(3,2) NOT NULL,
    MarkAsWord VARCHAR(15),
   
    PRIMARY KEY(RangeStart, RangeEnd)
);

INSERT INTO Students(Id, Name, Num, ClassNum, ClassLetter, Birthday, EGN) VALUES( 101, 'Зюмбюл Петров', 10, 11, 'а', '1999-02-28', NULL );
INSERT INTO Students(Name, Num, ClassNum, ClassLetter, Birthday, EGN) VALUES( 'Исидор Иванов', 15, 10, 'б', '2000-02-29', '0042294120' );
INSERT INTO Students(Name, Num, ClassNum, ClassLetter, Birthday, EGN) VALUES( 'Панчо Лалов', 20, 10, 'б', '2000-05-01', NULL );
INSERT INTO Students(Name, Num, ClassNum, ClassLetter, Birthday, EGN) VALUES( 'Петраки Ганьов', 20, 10, 'а', '1999-12-25', '9912256301' );
INSERT INTO Students(Name, Num, ClassNum, ClassLetter, Birthday, EGN) VALUES( 'Александър Момчев', 1, 8, 'а', '2002-06-11', NULL );

INSERT INTO Subjects(Id, Name) VALUES( 11, 'Английски език' );
INSERT INTO Subjects(Name) VALUES( 'Литература' );
INSERT INTO Subjects(Name) VALUES( 'Математика' );
INSERT INTO Subjects(Name) VALUES( 'СУБД' );

INSERT INTO StudentMarks VALUES( 101, 11, '2017-03-03', 6 );
INSERT INTO StudentMarks VALUES( 101, 11, '2017-03-31', 5.50 );
INSERT INTO StudentMarks VALUES( 102, 11, '2017-04-28', 5 );
INSERT INTO StudentMarks VALUES( 103, 12, '2017-04-28', 4 );
INSERT INTO StudentMarks VALUES( 104, 13, '2017-03-03', 5 );
INSERT INTO StudentMarks VALUES( 104, 13, '2017-04-07', 6 );
INSERT INTO StudentMarks VALUES( 104, 11, '2017-04-07', 4.50 );

INSERT INTO MarkWords VALUES( 2, 2.50, 'Слаб' );
INSERT INTO MarkWords VALUES( 2.50, 3.50, 'Среден' );
INSERT INTO MarkWords VALUES( 3.50, 4.50, 'Добър' );
INSERT INTO MarkWords VALUES( 4.50, 5.50, 'Мн. добър' );
INSERT INTO MarkWords VALUES( 5.50, 6, 'Отличен' );
#Students sb;
select count(*)
from StudentMarks
where mark =6;
# from i na join mojem da prawwim 6itnti

#select  Subjects.Name,avg(Mark)
#from StudentMarks m;


SELECT sb.Name, AVG(m.Mark)
FROM Subjects sb
LEFT JOIN StudentMarks m ON sb.Id = m.SubjectId
GROUP BY sb.Name;

SELECT st.Name, AVG(m.Mark)
FROM Students st
LEFT JOIN StudentMarks m ON m.StudentId = st.Id
GROUP BY st.Id, st.Num, st.Name
HAVING AVG(m.Mark) >= 5.50;
#LEFT JOIN StudentMarks m ON sm.Mark = m.SubjectId
#group by sm.name;

SELECT sb.Name, m.Mark
FROM Subjects sb, StudentMarks m
WHERE m.Mark=NULL
GROUP BY sb.Name;

SELECT * FROM Students
ORDER BY ClassNum ASC, ClassLetter ASC, Num ASC;

-- SELECT sb.Name, AVG(m.Mark)
-- FROM Subjects sb, StudentMarks m
-- HAVING AVG(m.Mark) < 3
-- ORDER BY AVG(m.Mark) ASC;

-- nz zashto ne baca poslednoto ;(




