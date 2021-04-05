create database Axxes;
use Axxes;

CREATE TABLE AUser
(
id int  NOT NULL AUTO_INCREMENT UNIQUE,
role varchar(255) NOT NULL,
ActiveDirectoryGUID varchar(255) NOT NULL,
username varchar(255) NOT NULL,
password varchar(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE Room
(
id int  NOT NULL AUTO_INCREMENT UNIQUE,
active bit NOT NULL,
name varchar(255) NOT NULL,
startDate Datetime NOT NULL,
endDate Datetime NOT NULL,
info varchar(255) NOT NULL,
sprekerId int NOT NULL,

PRIMARY KEY (id),
FOREIGN KEY (sprekerId) REFERENCES AUser(id)
);

CREATE TABLE Messaging
(
id int  NOT NULL AUTO_INCREMENT UNIQUE,
userId int NOT NULL,
messaging varchar(255) NOT NULL,
postedAt date NOT NULL,
roomId int NOT NULL,

PRIMARY KEY (id),
FOREIGN KEY (roomId) REFERENCES Room(id),
FOREIGN KEY (userId) REFERENCES AUser(id)
);

CREATE TABLE Likes
(
userId int NOT NULL,
messageId int NOT NULL,

primary key(userId, messageId),
FOREIGN KEY (messageId) REFERENCES Messaging(id),
FOREIGN KEY (userId) REFERENCES AUser(id)

);


CREATE TABLE RoomLogin
(
id int  NOT NULL AUTO_INCREMENT UNIQUE,
userId int NOT NULL,
roomId int NOT NULL,
startDate timestamp NOT NULL,
endDate timestamp,
feedbackContent varchar(255),
feedbackScore int,

PRIMARY KEY (id),
FOREIGN KEY (userId) REFERENCES AUser(id),
FOREIGN KEY (roomId) REFERENCES Room(id)
);

CREATE TABLE Poll
(
id int  NOT NULL AUTO_INCREMENT UNIQUE,
type varchar(255) NOT NULL,
active bit NOT NULL,
question varchar(255) NOT NULL,
options varchar(255) NOT NULL,
roomId int NOT NULL,

PRIMARY KEY (id),
FOREIGN KEY (roomId) REFERENCES Room(id)
);

CREATE TABLE VoteUser
(
id int  NOT NULL AUTO_INCREMENT UNIQUE,
userId int NOT NULL,
pollId int NOT NULL,
answer varchar(255) NOT NULL,

PRIMARY KEY (id),
FOREIGN KEY (userId) REFERENCES AUser(id),
FOREIGN KEY (pollId) REFERENCES Poll(id)
);
