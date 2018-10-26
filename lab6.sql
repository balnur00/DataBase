CREATE DATABASE lab6;

/* Delete the tables if they already exist */
drop table if exists Movie cascade ;
drop table if exists Reviewer cascade ;
drop table if exists Rating cascade ;

/* Create the schema for our tables */
create table Movie(mID int, title text, year int, director text);
create table Reviewer(rID int, name text);
create table Rating(rID int, mID int, stars int, ratingDate date);

/* Populate the tables with our data */
insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');


--TASK 1
ALTER TABLE Movie ADD CONSTRAINT movie_PK PRIMARY KEY(mID); --1

ALTER TABLE Movie ADD CONSTRAINT unique_Movie UNIQUE(title, year); --2

ALTER TABLE Reviewer ADD CONSTRAINT reviewer_PK PRIMARY KEY(rID); --3

ALTER TABLE Rating ADD CONSTRAINT unique_Rating UNIQUE(rID, mID, ratingDate); --4

ALTER TABLE Reviewer ALTER COLUMN name SET NOT NULL; --5

ALTER TABLE Rating ALTER COLUMN stars SET NOT NULL; --6

ALTER TABLE Movie ADD CONSTRAINT movie_Year_Checker
CHECK(year > 1900); --7

ALTER TABLE Rating ADD CONSTRAINT rating_Star_Checher
CHECK(stars between 1 and 5); --8

ALTER TABLE Rating ADD CONSTRAINT ratind_Date_Checker
CHECK(ratingDate >= TO_DATE('2000-01-01', 'yyyy-mm-dd')); --9

ALTER TABLE Movie ADD CONSTRAINT movie_Checker
CHECK((director='Steven Spielberg' AND year<1990) OR (director='James Cameron' AND year>1990) or (director not in ('Steven Spielberg', 'James Cameron'))); --10


--TASK 2
SELECT * FROM Movie;
SELECT * FROM Reviewer;
SELECT * FROM Rating;


--TASK 3
UPDATE Movie set mID= mID + 1; --11

insert INTO Movie VALUES (109, 'Titanic', 1997, 'JC'); --12

insert into Reviewer values (201, 'Ted Codd'); --13

update Rating set rID = 205, mID = 104; --14

insert into Reviewer values (209, null); --15

update Rating set stars = null where rID = 208; --16

update Movie set year = year - 40; --17

update Rating set stars = stars + 1; --18

insert into Rating values (201, 101, 1, '1999-01-01'); --19

insert into Movie values (109, 'Jurassic Park', 1993, 'Steven Spielberg'); --20

update Movie set year = year-10 where title = 'Titanic'; --21


insert into Movie values (109, 'Titanic', 2001, null); --22

update Rating set mID = 109; --23

update Movie set year = 1901 where director <> 'James Cameron'; --24

update Rating set stars = stars - 1; --25


--TASK 4
ALTER TABLE Rating ADD CONSTRAINT rating_FK foreign KEY(rID) references Reviewer on update CASCADE on delete set NULL; --26

ALTER TABLE Rating ADD CONSTRAINT rating_FK2 foreign KEY(mID) references Movie on delete CASCADE;  --26

--TASK 5
SELECT * FROM Movie;
SELECT * FROM Reviewer;
SELECT * FROM Rating;


--TASK 6
insert into Rating values (209, 109, 3, '2001-01-01'); --27

update Rating set rID = 209 where rID = 208; --28

update Rating set mID = mID + 1; --29

update Movie set mID = 109 where mID = 108; --30

update Movie set mID = 109 where mID = 102; --31

update Reviewer set rID = rID + 10; --32

delete from Reviewer where rID > 215; --33

delete from Movie where mID < 105; --34

SELECT sum(rID) FROM Rating WHERE rID IS NOT NULL; --35a

SELECT count(rID) FROM Rating WHERE rID IS NULL; --35b