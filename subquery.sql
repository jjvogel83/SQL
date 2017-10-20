/*Challenge 21 (Out First Subquery)
subquery.sql*/
SELECT title FROM movies WHERE id IN (SELECT movie_id
FROM Rooms
Where Rooms.seats > 75)


/*Challenge 21 (Out First Subquery)
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

/*Challenge 22 (An Aggregate Subquery)
subquery.sql*/
SELECT id FROM rooms WHERE seats > (SELECT AVG(seats) FROM rooms);

/*Challenge 22 (An Aggregate Subquery)
schema.sql*/
CREATE TABLE Rooms (
  id INT PRIMARY KEY,
  seats int,
  movie_id int
);

INSERT INTO Rooms (id, seats, movie_id) VALUES
  (1, 40, 2),
  (2, 100, 1),
  (3, 100, NULL),
  (4, 150, 3);


/*Challenge 22 (Thinking Outer the Box)
subquery.sql*/
SELECT r.id, m.title
FROM Rooms r
LEFT OUTER JOIN Movies m
ON r.movie_id = m.id
WHERE seats > (SELECT AVG(seats) FROM Rooms);

/*Challenge 22 (Thinking Outer the Box)
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
