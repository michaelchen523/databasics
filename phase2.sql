CREATE DATABASE travelreviews;
CREATE TABLE Manager
(
Username VARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL,
Password VARCHAR(255) NOT NULL,
PRIMARY KEY (Username),
UNIQUE (Email)
);

CREATE TABLE Event
(
Name VARCHAR(255) NOT NULL,
Date DATE() NOT NULL,
StartTime TIME() NOT NULL,
Address VARCHAR(255) NOT NULL,
CityName VARCHAR(255) NOT NULL,
CountryName VARCHAR(255) NOT NULL,
EndTime TIME(),
Cost INT NOT NULL,
StudentDiscount TINYINT(1) NOT NULL DEFAULT 0,
Description TEXT NOT NULL,
Category ENUM('concert', 'sports match', 'race', 'festival', 'presentation'),
NUsername VARCHAR(255) NOT NULL,
ReviewableID VARCHAR(255) NOT NULL,

CHECK (StartTime < EndTime),
FOREIGN KEY (Address) REFERENCES Location(Address)
	ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (CityName) REFERENCES City(Name)
	ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (CountryName) REFERENCES Country(Name)
	ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (NUsername) REFERENCES NormalUser(Username)
	ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (ReviewableID) REFERENCES Reviewable(ReviewableID)
	ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT EVENTID PRIMARY KEY (Name, Date, StartTime, Address, CityName, CountryName)
);

CREATE TABLE Reviewable
	(ReviewableID int NOT NULL,
	PRIMARY KEY(ReviewableID));

CREATE TABLE Review
	(Date DATE,
	 Username varchar(15) NOT NULL,
	 Score int,
	 Description varchar(255),
	 ReviewableID int NOT NULL,
	 PRIMARY KEY(Date, Username),
	 FOREIGN KEY(Username REFERENCES NormalUser(Username),
	 FOREIGN KEY(ReviewableID REFERENCES Reviewable(ReviewableID));
		 ON DELETE RESTRICT		ON UPDATE CASCADE

CREATE TABLE CountryLanguage
	(CountryName varchar(25) NOT NULL,
	 LanguageName varchar(25) NOT NULL,
	 PRIMARY KEY(CountryName, LanguageName),
	 FOREIGN KEY(CountryName REFERENCES Country(Name));

CREATE TABLE CityLanguage
	(CountryName varchar(25) NOT NULL,
	 CityName varchar(25) NOT NULL,
	 LanguageName varchar(25) NOT NULL,
	 PRIMARY KEY(CountryName, LanguageName),
	 FOREIGN KEY(CityName REFERENCES City(Name));

CREATE TABLE Country
	(Name VARCAHR(50),
	NUsername VARCAHR(15) NOT NULL,
	Population INT UNSIGNED NOT NULL,

PRIMARY KEY(Name),
FOREIGN KEY(NUsername) REFERENCES NormalUser(Username) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE City
	(Name VARCAHR(50),
	CountryName VARCAHR(50),
	Latitude DOUBLE NOT NULL,
	Longitude DOUBLE NOT NULL,
	NUsername VARCAHR(15) NOT NULL,
	MUsername VARCAHR(15) NOT NULL,
	ReviewableID INTT NOT NULL,
	Capital BOOLEAN NOT NULL,

PRIMARY KEY(Name, CountryName),
FOREIGN KEY(CountryName) REFERENCES Country(Name) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY(NUsername) REFERENCES NormalUser(Username) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY(MUsername) REFERENCES Manager(Username) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY(ReviewableID) REFERENCES Reviewable(ReviewableID) ON DELETE RESTRICT ON UPDATE CASCADE
);
