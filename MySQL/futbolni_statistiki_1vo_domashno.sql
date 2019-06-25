DROP DATABASE IF EXISTS PlayerStats;
CREATE DATABASE PlayerStats CHARSET 'utf8';
USE PlayerStats;

CREATE TABLE StatTypes(
	StatCode CHAR(10),
	Name VARCHAR(150) NOT NULL

);

CREATE TABLE Positions(
	PositionCode CHAR(10),
    Name VARCHAR(150) NOT NULL

);

CREATE TABLE Players(
	Id INTEGER NOT NULL,
    Name VARCHAR(150) NOT NULL,
    Num INTEGER NOT NULL,
    PositionCode CHAR(10),
    PRIMARY KEY(Id),
    FOREIGN KEY (PositionCode) REFERENCES Positions(PosiitonCode) 
);

CREATE TABLE Tournaments(
	Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL
);

CREATE TABLE Matches(
	Id INTEGER NOT NULL,
    MatchDate VARCHAR(15) NOT NULL,
    TournamentId INTEGER NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY (TournamentId) REFERENCES Tournaments(Id) 
);

CREATE TABLE MatchStats(
	Id INTEGER NOT NULL,
    MatchId INTEGER NOT NULL,
    PlayerId INTEGER NOT NULL,
    EventMinute INTEGER NOT NULL,
    StatCode CHAR(10),
    PRIMARY KEY(Id),
    FOREIGN KEY (MatchId) REFERENCES Matches(Id),
    FOREIGN KEY (PlayerId) REFERENCES Players(Id),
    FOREIGN KEY (StatCode) REFERENCES StatTypes(StatCode) 


);

INSERT INTO StatTypes(StatCode, Name) VALUES('G', 'Гол');
INSERT INTO StatTypes(StatCode, Name) VALUES('A', 'Асистенция');
INSERT INTO StatTypes(StatCode, Name) VALUES('R', 'Червен картон');
INSERT INTO StatTypes(StatCode, Name) VALUES('Y', 'Жълт картон');
INSERT INTO StatTypes(StatCode, Name) VALUES('OG', 'Автогол');
INSERT INTO StatTypes(StatCode, Name) VALUES('IN', 'Смяна влиза');
INSERT INTO StatTypes(StatCode, Name) VALUES('OUT', 'Смяна излиза');

INSERT INTO Positions(PositionCode, Name) VALUES('GK', 'Вратар');
INSERT INTO Positions(PositionCode, Name) VALUES('RB', 'Десен защитник');
INSERT INTO Positions(PositionCode, Name) VALUES('LB', 'Ляв защитник');
INSERT INTO Positions(PositionCode, Name) VALUES('CB', 'Централен защитник');
INSERT INTO Positions(PositionCode, Name) VALUES('RM', 'Десен полузащитник');
INSERT INTO Positions(PositionCode, Name) VALUES('LM', 'Ляв полузащитник');
INSERT INTO Positions(PositionCode, Name) VALUES('CM', 'Централен полузащитник');
INSERT INTO Positions(PositionCode, Name) VALUES('CF', 'Централен нападател');

INSERT INTO Players(Id, Name, Num, PosiitonCode) VALUES(1, 'Ivaylo Trifonov', 1, 'GK');
INSERT INTO Players(Id, Name, Num, PosiitonCode) VALUES(2, 'Valko Trifonov', 2, 'RB');
INSERT INTO Players(Id, Name, Num, PosiitonCode) VALUES(3, 'Ognyan Yanev', 3, 'CB');
INSERT INTO Players(Id, Name, Num, PosiitonCode) VALUES(4, 'Zahari Dragomirov', 4, 'CB');
INSERT INTO Players(Id, Name, Num, PosiitonCode) VALUES(5, 'Bozhidar Chilikov', 5, 'LB');
INSERT INTO Players(Id, Name, Num, PosiitonCode) VALUES(6, 'Timotei Zahariev', 6, 'CM');
INSERT INTO Players(Id, Name, Num, PosiitonCode) VALUES(7, 'Marin Valentinov', 7, 'CM');
INSERT INTO Players(Id, Name, Num, PosiitonCode) VALUES(8, 'Mitre Cvetkov', 99, 'CF');
INSERT INTO Players(Id, Name, Num, PosiitonCode) VALUES(9, 'Zlatko Genov', 9, 'CF');
INSERT INTO Players(Id, Name, Num, PosiitonCode) VALUES(10, 'Matey Goranov', 10, 'RM');
INSERT INTO Players(Id, Name, Num, PosiitonCode) VALUES(11, 'Sergei Zhivkov', 11, 'LM');


INSERT INTO TOURNAMENTS(Id, Name) VALUES(1, 'Шампионска лига');
INSERT INTO TOURNAMENTS(Id, Name) VALUES(2, 'Първа лига');
INSERT INTO TOURNAMENTS(Id, Name) VALUES(3, 'Купа на България');
INSERT INTO TOURNAMENTS(Id, Name) VALUES(4, 'Суперкупа на България');

INSERT INTO MATCHES(Id, MatchDate, TournamentId) VALUES(1, '2018-04-08', 2);
INSERT INTO MATCHES(Id, MatchDate, TournamentId) VALUES(2, '2018-04-13', 2);
INSERT INTO MATCHES(Id, MatchDate, TournamentId) VALUES(3, '2018-04-21', 2);
INSERT INTO MATCHES(Id, MatchDate, TournamentId) VALUES(4, '2018-04-28', 2);
INSERT INTO MATCHES(Id, MatchDate, TournamentId) VALUES(5, '2018-05-06', 2);
INSERT INTO MATCHES(Id, MatchDate, TournamentId) VALUES(6, '2018-05-11', 2);
INSERT INTO MATCHES(Id, MatchDate, TournamentId) VALUES(7, '2017-09-21', 3);
INSERT INTO MATCHES(Id, MatchDate, TournamentId) VALUES(8, '2017-10-26', 3);


INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(1, 8, 9, 14,'G');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(2, 8, 8, 14, 'A');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(3, 8, 3, 43, 'Y');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(4, 7, 2, 28, 'Y');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(5, 7, 10, 45, 'Y');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(6, 7, 10, 65, 'R');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(7, 1, 10, 23, 'G');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(8, 1, 9, 23, 'A');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(9, 1, 9, 43, 'G');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(10, 2, 4, 33, 'OG');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(11, 2, 9, 68, 'G');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(12, 2, 1, 68, 'A');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(13, 3, 3, 35, 'G');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(14, 3, 4, 35, 'A');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(15, 3, 8, 55, 'G');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(16, 3, 11, 55, 'A');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(17, 4, 3, 9, 'G');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(18, 4, 8, 9, 'G');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(19, 4, 8, 56, 'OG');
INSERT INTO MatchStats(Id, MatchId, PlayerId, EventMinute, StatCode) VALUES(20, 5, 8, 67, 'G');

SELECT pl.Name, pl.Num
FROM Players pl 
WHERE pl.PositionCode='RB' 
AND pl.PositionCode='CB'
AND pl.PositionCode='LB'
GROUP BY pl.Name;

SELECT m.MatchDate, m.TournamentId, t.Name
FROM Matches m, Tournaments.Name
WHERE m.MatchDate='2018-04-08'
AND m.MatchDate='2018-04-13'
AND m.MatchDate='2018-04-21'
AND m.MatchDate='2018-04-28'  
GROUP BY m.MatchDate, Name;

SELECT COUNT(ms.StatCode)
FROM MatchStats ms
WHERE ms.StatCode = 'OG'
GROUP BY ms.StatCode;




















