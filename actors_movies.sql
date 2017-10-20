/*Challenge 13 (Join Table Creation SQL)
actors_movies.sql*/
CREATE TABLE Actors_Movies (
  actor_id int REFERENCES Actors(id),
  movie_id int REFERENCES Actors(id)
);
