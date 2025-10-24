/*USE master;
GO

ALTER DATABASE UNIVERSITÄT SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE UNIVERSITÄT;
GO*/
CREATE DATABASE UNIVERSITÄT
USE UNIVERSITÄT

CREATE TABLE Studenten (
    SchülerID INT IDENTITY(1,1) PRIMARY KEY,
    Matrikelnummer VARCHAR(255) UNIQUE NOT NULL,
    Vorname VARCHAR(255) NOT NULL,
    Nachname VARCHAR(255) NOT NULL,
    Eintrittsdatum DATE NOT NULL,
    Wohnort VARCHAR(255)
);

CREATE TABLE Professoren (
    ProfID INT IDENTITY(1,1) PRIMARY KEY,
    Vorname VARCHAR(255) NOT NULL,
    Nachname VARCHAR(255) NOT NULL,
    Geburtsdatum DATE NOT NULL,
    Raum INT
);

CREATE TABLE Assistenten (
    AssistantID INT IDENTITY(1,1) PRIMARY KEY,
    Vorname VARCHAR(255) NOT NULL,
    Nachname VARCHAR(255) NOT NULL,
    Geburtsdatum DATE NOT NULL,
    ProfessorenProfID INT,
    FOREIGN KEY (ProfessorenProfID) REFERENCES Professoren(ProfID)
);

CREATE TABLE Vorlesungen (
    VorlesungID INT IDENTITY(1,1) PRIMARY KEY,
    Beschreibung VARCHAR(255),
    ProfessorenProfID INT,
    FOREIGN KEY (ProfessorenProfID) REFERENCES Professoren(ProfID)
);

CREATE TABLE Studenten_Besucht_Vorlesungen (
    StudentenSchülerID INT,
    VorlesungenVorlesungID INT,
    PRIMARY KEY (StudentenSchülerID, VorlesungenVorlesungID),
    FOREIGN KEY (StudentenSchülerID) REFERENCES Studenten(SchülerID),
    FOREIGN KEY (VorlesungenVorlesungID) REFERENCES Vorlesungen(VorlesungID)
);

CREATE TABLE Vorausgesetzte_Vorlesungen (
    VorlesungenVorlesungID INT,
    VorlesungenVorlesungID2 INT,
    PRIMARY KEY (VorlesungenVorlesungID, VorlesungenVorlesungID2),
    FOREIGN KEY (VorlesungenVorlesungID) REFERENCES Vorlesungen(VorlesungID),
    FOREIGN KEY (VorlesungenVorlesungID2) REFERENCES Vorlesungen(VorlesungID)
);

CREATE TABLE Prüfungen (
    PrüfungsID INT PRIMARY KEY
);

CREATE TABLE Studenten_Prüfungen (
    Datum DATETIME, 
    Note DECIMAL(2,1),
    StudentenSchülerID INT,
    PrüfungenPrüfungsID INT,
    ProfessorenProfID INT,
    PRIMARY KEY (StudentenSchülerID, PrüfungenPrüfungsID),
    FOREIGN KEY (StudentenSchülerID) REFERENCES Studenten(SchülerID),
    FOREIGN KEY (PrüfungenPrüfungsID) REFERENCES Prüfungen(PrüfungsID),
    FOREIGN KEY (ProfessorenProfID) REFERENCES Professoren(ProfID)
);

INSERT INTO Professoren(Vorname, Nachname, Geburtsdatum, Raum)
VALUES('Albert', 'Einstein', '1879-03-14', 14),
      ('Marie', 'Curie', '1867-11-07', 12),
      ('Peter','Von Matt', '1937-05-20', 8),
      ('Nikola', 'Tesla', '1856-07-10', 13),
      ('Wilhelm Conrad', 'Röntgen', '1845-03-27', 10),
      ('Jean-Paul', 'Sartre', '1905-06-21', 1),
      ('Jacobus', 'Van`t Hoff', '1852-08-30', 3);

SELECT * FROM Professoren

INSERT INTO Assistenten(Vorname, Nachname, Geburtsdatum, ProfessorenProfID)
VALUES('Lionel','Messi','1987-06-24', NULL),
('Xherdan','Shaqiri','1991-10-10', 4),
('Sami','Khedira','1987-04-04', 3),
('Cristiano','Ronaldo','1985-02-05', 3),
('Wayne','Rooney','1985-10-24', NULL),
('Arjen','Robben','1984-01-23', 7),
('Andrea','Pirlo','1979-05-19', 1),
('Robert','Lewandowski','1988-08-21', 3),
('Luis','Suarez','1987-01-24', 5),
('Alexis','Sanchez','1988-12-19', 2);

SELECT * FROM Assistenten

INSERT INTO Studenten (Matrikelnummer, Vorname, Nachname, Eintrittsdatum, Wohnort)
VALUES('09-4845-0','Eliane','Burri','2019-10-01','3005 Bern'),
('12-5776-4','Guido','Duss','2019-10-01','4500 Solothurn'),
('09-7270-8','Gertrud','Zollinger','2019-10-01','3600 Thun'),
('08-5694-8','Giorgio','Antonelli','2018-10-01','6204 Sempach'),
('13-3963-7','Miguel','Sanchez','2019-10-01', NULL),
('09-6537-7','Zoran','Stefanovski','2019-10-01','3000 Bern'),
('10-4336-3','Luis','Prieto','2019-10-01','4000 Basel'),
('13-4372-1','Martin','Isler','2019-10-01', NULL),
('09-1079-4','Paolo','Di Lavello','2019-10-01','5400 Baden'),
('10-5068-5','Rolf','Meier','2019-10-01','5430 Wettingen'),
('09-9370-0','Marco','Maggi','2019-10-01','8918 Unterlunkhofen'),
('09-0523-5','Heike','Kurmann','2019-10-01','6280 Hochdorf'),
('09-9376-6','Lelzim','Krasniqi','2019-10-01','2905 Courtedoux'),
('14-0556-8','Jean-Paul','Léchenne','2019-10-01','4500 Solothurn'),
('09-0665-1','Roger','Détraz','2017-10-01','3215 Lurtigen'),
('11-8456-6','Hans','Dubach','2018-10-01','3000 Bern'),
('10-3201-8','Yvonne','Keller','2019-10-01', NULL),
('12-0948-3','Priska','Weber','2019-10-01','4125 Riehen'),
('13-3225-2','Heidi','Dubuis','2019-10-01','6213 Knutwil'),
('13-5660-2','Slobodan','Stojanovic','2019-10-01','4132 Muttenz'),
('07-0633-6','Bruno','Zobrist','2018-10-01','5242 Birr'),
('10-1471-6','Slobodanka','Babaja','2019-10-01','4600 Olten'),
('10-2466-6','Roger','Gugler','2018-10-01','3400 Burgdorf'),
('13-3704-2','Marian','Genkinger','2019-10-01', NULL),
('12-8867-9','Michele','Dell''Amore','2019-10-01','4900 Langenthal');

SELECT * FROM Studenten

INSERT INTO Vorlesungen(Beschreibung, ProfessorenProfID)
VALUES
('Ethik', 3),
('Elektrotechnik', 4),
('Sprachtheorie', 3),
('Radiologie', 5),
('Allgemeine Relativitätstheorie', 1),
('Quantenphysik', 1),
('Kinetik', 7),
('Literaturgeschichte', 3),
('Astrophysik', 1),
('Biochemie', 7),
('Physikalische Chemie', 2);

SELECT * FROM Vorlesungen

INSERT INTO Studenten_Besucht_Vorlesungen(StudentenSchülerID, VorlesungenVorlesungID)
VALUES
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='07-0633-6'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Physikalische Chemie')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='09-0665-1'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Kinetik')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='09-1079-4'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Biochemie')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='09-4845-0'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Elektrotechnik')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='09-4845-0'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Radiologie')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='09-7270-8'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Biochemie')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='09-9370-0'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Literaturgeschichte')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='10-3201-8'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Kinetik')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='08-5694-8'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Literaturgeschichte')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='12-5776-4'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Elektrotechnik')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='12-8867-9'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Ethik')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-3704-2'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Ethik')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-3704-2'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Literaturgeschichte')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-3704-2'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Sprachtheorie')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-3963-7'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Sprachtheorie')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-3963-7'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Ethik')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-3963-7'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Literaturgeschichte')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-4372-1'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Kinetik')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-5660-2'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Elektrotechnik')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-5660-2'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Allgemeine Relativitätstheorie')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-5660-2'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Kinetik')),
((SELECT SchülerID FROM Studenten WHERE Matrikelnummer='14-0556-8'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Allgemeine Relativitätstheorie'));

SELECT * FROM Studenten_Besucht_Vorlesungen

INSERT INTO Vorausgesetzte_Vorlesungen(VorlesungenVorlesungID, VorlesungenVorlesungID2)
VALUES
((SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Radiologie'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Elektrotechnik')),
((SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Quantenphysik'), (SELECT VorlesungID FROM Vorlesungen WHERE Beschreibung='Radiologie'));

SELECT * FROM Vorausgesetzte_Vorlesungen

INSERT INTO Prüfungen (PrüfungsID) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);

INSERT INTO Studenten_Prüfungen (Datum, Note, StudentenSchülerID, PrüfungenPrüfungsID, ProfessorenProfID) VALUES
(NULL,    NULL, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='12-8867-9'),  1, (SELECT ProfID FROM Professoren WHERE Vorname='Jean-Paul' AND Nachname='Sartre')),
(NULL,    NULL, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-5660-2'),  2, (SELECT ProfID FROM Professoren WHERE Vorname='Jacobus' AND Nachname LIKE '%Hoff%')),
('2020-10-25 00:00:00', 6.0, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='09-4845-0'),  3, (SELECT ProfID FROM Professoren WHERE Vorname='Nikola' AND Nachname='Tesla')),
(NULL,    NULL, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='09-4845-0'),  4, (SELECT ProfID FROM Professoren WHERE Vorname='Marie' AND Nachname='Curie')),
('2020-03-03 15:30:00', 4.0, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='09-9370-0'),  5, (SELECT ProfID FROM Professoren WHERE Vorname='Peter' AND Nachname='Von Matt')),
('2020-05-28 10:00:00', 5.5, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='09-0665-1'),  6, (SELECT ProfID FROM Professoren WHERE Vorname='Jacobus' AND Nachname LIKE '%Hoff%')),
('2020-05-30 10:00:00', 2.5, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='10-3201-8'),  7, (SELECT ProfID FROM Professoren WHERE Vorname='Jacobus' AND Nachname LIKE '%Hoff%')),
(NULL,    NULL, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='08-5694-8'),  8, (SELECT ProfID FROM Professoren WHERE Vorname='Peter' AND Nachname='Von Matt')),
('2021-05-27 09:00:00', 3.5, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-3963-7'),  9, (SELECT ProfID FROM Professoren WHERE Vorname='Peter' AND Nachname='Von Matt')),
(NULL,    NULL, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-3963-7'), 10, (SELECT ProfID FROM Professoren WHERE Vorname='Peter' AND Nachname='Von Matt')),
('2021-05-27 08:30:00', 5.0, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-3704-2'), 11, (SELECT ProfID FROM Professoren WHERE Vorname='Peter' AND Nachname='Von Matt')),
('2020-03-10 10:00:00', 4.5, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='13-3704-2'), 12, (SELECT ProfID FROM Professoren WHERE Vorname='Peter' AND Nachname='Von Matt')),
('2021-05-26 10:00:00', 5.5, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='12-5776-4'), 13, (SELECT ProfID FROM Professoren WHERE Vorname='Nikola' AND Nachname='Tesla')),
(NULL,    NULL, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='14-0556-8'), 14, (SELECT ProfID FROM Professoren WHERE Vorname='Albert' AND Nachname='Einstein')),
('2020-05-25 08:30:00', 4.5, (SELECT SchülerID FROM Studenten WHERE Matrikelnummer='09-7270-8'), 15, (SELECT ProfID FROM Professoren WHERE Vorname='Wilhelm Conrad' AND Nachname='Röntgen'));

SELECT * FROM Studenten_Prüfungen

SELECT Raum FROM Professoren WHERE Vorname = 'Peter' 

SELECT SchülerID, Vorname, Nachname, Eintrittsdatum From Studenten Where Eintrittsdatum <= '1.1.2019'

SELECT Vorname, Nachname FROM Assistenten WHERE ProfessorenProfID IS NULL

SELECT Vorname, Nachname FROM Assistenten WHERE Vorname LIKE '_r%'

SELECT Geburtsdatum From Assistenten ORDER BY Geburtsdatum ASC

SELECT * FROM Studenten WHERE Matrikelnummer LIKE '13-%'

SELECT Vorname, Nachname FROM Studenten WHERE Vorname LIKE '%a%' ORDER BY Nachname DESC

SELECT * FROM Studenten_Prüfungen WHERE Note IS NOT NULL

SELECT StudentenSchülerID FROM Studenten_Besucht_Vorlesungen WHERE VorlesungenVorlesungID = 7 

SELECT Vorname, Nachname FROM Studenten WHERE SchülerID IN 
(SELECT StudentenSchülerID FROM Studenten_Besucht_Vorlesungen GROUP BY StudentenSchülerID HAVING COUNT(*) >= 3)

SELECT PrüfungenPrüfungsID FROM Studenten_Prüfungen WHERE ProfessorenProfID IN 
(SELECT ProfID FROM Professoren WHERE Vorname = 'Jacobus')

SELECT Note FROM Studenten_Prüfungen WHERE Note = '5.5'
