/*Challenge 6 (Adding Constraints)
actors.sql*/
CREATE TABLE Actors (
  name varchar(50) NOT NULL UNIQUE,
  country varchar(50)
);

/*Challenge 8 (PK Constraint)
actors.sql*/
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  country varchar(50)
);

/*Challenge 9 (FK Constraint)
actors.sql*/
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  country_id int REFERENCES countries
);


/*Challenge 10 (FK Table Constraint)
actors.sql*/
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  country_id int,
   FOREIGN KEY (country_id) REFERENCES Countries
);