/*Challenge 15 (Creating a Relationship)
rooms.sql*/

CREATE TABLE Rooms (
  id int PRIMARY KEY,
  seats int,
  movie_id int UNIQUE,
  FOREIGN KEY (movie_id) REFERENCES movies
);

/*Challenge 15 (Creating a Relationship)
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
