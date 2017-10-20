/*Challenge 1 (Counting Actors)
query.sql*/
Select count(*)
From Actors
Where country = 'USA';


/*Challenge 2 (Adding Numeric Values)
query.sql*/
Select sum(salary)
From Actors;

/*Challenge 3 (Average Salary)
query.sql*/
Select avg(salary)
From Actors
Where country = 'USA';


/*Challenge 4 (Actor Pay Rates)
query.sql*/
Select max(salary), min(salary)
From Actors;

/*Challenge 5 (Filtering Aggregates)
query.sql*/
Select country, sum(salary)
From Actors
Where role = "supporting"
Group By country
Having count(*) > 1;

/*Challenge 11 (Dropping Tables With FK)
query.sql*/
DROP TABLE Actors;
DROP TABLE Countries;

/*Challenge 12 (Check Constraints)
query.sql*/
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  salary int CHECK (salary >= 500),
  bonus int CHECK (bonus < salary),
  country_id int REFERENCES Countries(id)
);

/*Challenge 14 (Insert a Join Row)
query.sql*/
INSERT INTO Actors_Movies (actor_id, movie_id)
  VALUES (2, 5);
  

/*Challenge 17 (Two Inner Joins)

query.sql*/
SELECT Actors.name, Movies.title FROM Actors
INNER JOIN Actors_Movies
ON Actors.id = Actors_Movies.actor_id
INNER JOIN Movies
ON Actors_Movies.movie_id = Movies.id
ORDER BY Movies.title;

/*schema.sql*/
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL
);

CREATE TABLE Movies (
  id int PRIMARY KEY,
  title varchar(50) NOT NULL
);

CREATE TABLE Actors_Movies (
  actor_id int REFERENCES Actors,
  movie_id int REFERENCES Movies
);

INSERT INTO Actors (id, name) VALUES
  (1, 'Vivien Leigh'),
  (2, 'Clark Gable'),
  (3, 'Olivia de Havilland');

INSERT INTO Movies (id, title) VALUES
  (1, 'Don Juan'),
  (2, 'The Lost World'),
  (3, 'Peter Pan'),
  (4, 'Robin Hood');

INSERT INTO Actors_Movies (actor_id, movie_id) VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 2),
  (3, 4);


/*Challenge 18 (Column and Table Aliases)
query.sql*/
SELECT m.title "Movie Title", r.id "Theatre Number", r.seats
FROM Movies m
INNER JOIN Rooms r
ON m.id = r.movie_id
WHERE r.seats > 75
ORDER BY r.seats desc;


/*Challenge 18 (Column and Table Aliases)
schema.sql*/
CREATE TABLE Movies (
  id int PRIMARY KEY,
  title varchar(50) NOT NULL
);

INSERT INTO Movies (id, title) VALUES
  (1, 'Don Juan'),
  (2, 'The Lost World'),
  (3, 'Peter Pan'),
  (4, 'Robin Hood');

CREATE TABLE Rooms (
  id INT PRIMARY KEY,
  seats int,
  movie_id int,
  FOREIGN KEY (movie_id) REFERENCES Movies
);

INSERT INTO Rooms (id, seats, movie_id) VALUES
  (1, 50, 2),
  (2, 100, 1),
  (3, 100, NULL),
  (4, 150, 3);
  
/*Challenge 19 (Three Table Aliases)
query.sql*/
SELECT a.name, m.title FROM Actors a
INNER JOIN Actors_Movies am
ON a.id = am.actor_id
INNER JOIN Movies m
ON am.movie_id = m.id
ORDER BY m.title;

/*Challenge 19 (Three Table Aliases)
schema.sql*/
CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL
);

CREATE TABLE Movies (
  id int PRIMARY KEY,
  title varchar(50) NOT NULL
);

CREATE TABLE Actors_Movies (
  actor_id int REFERENCES Actors,
  movie_id int REFERENCES Movies
);

INSERT INTO Actors (id, name) VALUES
  (1, 'Vivien Leigh'),
  (2, 'Clark Gable'),
  (3, 'Olivia de Havilland');

INSERT INTO Movies (id, title) VALUES
  (1, 'Don Juan'),
  (2, 'The Lost World'),
  (3, 'Peter Pan'),
  (4, 'Robin Hood');

INSERT INTO Actors_Movies (actor_id, movie_id) VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 2),
  (3, 4);


/*Challenge 20 (Your First Outer Join)
query.sql*/
SELECT m.title, r.id "Theatre Number"
FROM Movies m
LEFT OUTER JOIN Rooms r
ON m.id = r.movie_id;

/*Challenge 20 (Your First Outer Join)
schema.sql*/
CREATE TABLE Movies (
  id int PRIMARY KEY,
  title varchar(50) NOT NULL
);

INSERT INTO Movies (id, title) VALUES
  (1, 'Don Juan'),
  (2, 'The Lost World'),
  (3, 'Peter Pan'),
  (4, 'Robin Hood');

CREATE TABLE Rooms (
  id INT PRIMARY KEY,
  seats int,
  movie_id int,
  FOREIGN KEY (movie_id) REFERENCES Movies
);

INSERT INTO Rooms (id, seats, movie_id) VALUES
  (1, 50, 2),
  (2, 100, 1),
  (3, 100, NULL),
  (4, 150, 3);



/*Challenge 21 (On the Other Hand)
query.sql*/
SELECT m.title, r.id "Theatre Number"
FROM Movies m
RIGHT OUTER JOIN Rooms r
ON m.id = r.movie_id;


/*Challenge 21 (On the Other Hand)
schema.sql*/
CREATE TABLE Movies (
  id int PRIMARY KEY,
  title varchar(50) NOT NULL
);

INSERT INTO Movies (id, title) VALUES
  (1, 'Don Juan'),
  (2, 'The Lost World'),
  (3, 'Peter Pan'),
  (4, 'Robin Hood');

CREATE TABLE Rooms (
  id INT PRIMARY KEY,
  seats int,
  movie_id int,
  FOREIGN KEY (movie_id) REFERENCES Movies
);

INSERT INTO Rooms (id, seats, movie_id) VALUES
  (1, 50, 2),
  (2, 100, 1),
  (3, 100, NULL),
  (4, 150, 3);
