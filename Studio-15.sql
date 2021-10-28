CREATE TABLE movies (
   movie_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(120),
   year_released INTEGER,
   director VARCHAR(80)
);

CREATE TABLE directors (
   director_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   first_name VARCHAR(40),
   last_name VARCHAR(40),
   country VARCHAR(80)
);
alter table movies
drop column director;
alter table movies
add director_id integer;

drop table movies;

CREATE TABLE movies (
   movie_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(120),
   year_released INTEGER,
   director_id INTEGER,
   FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

SELECT title FROM movies;
SELECT title, year_released FROM movies ORDER BY year_released DESC;
SELECT * FROM directors ORDER BY  country ASC;
SELECT * FROM directors ORDER BY country ASC, last_name ASC;
INSERT INTO directors (first_name, last_name, country) VALUES ("Rob", "Reiner", "USA");
SELECT last_name, director_id FROM directors WHERE first_name="Rob";
INSERT INTO movies (title, year_released, director_id) VALUES ("The Princess Bride", 1987, 11);
SELECT movies.title, movies.year_released, directors.last_name FROM movies INNER JOIN directors ON movies.director_id=directors.director_id;
SELECT movies.*, directors.first_name, directors.last_name FROM movies LEFT JOIN directors ON movies.director_id=directors.director_id ORDER BY directors.last_name ASC;
SELECT directors.first_name, directors.last_name FROM directors RIGHT JOIN movies ON movies.director_id=directors.director_id WHERE movies.title="The Incredibles";
SELECT directors.first_name, directors.last_name FROM directors WHERE director_id=(SELECT director_id FROM movies WHERE title="The Incredibles");
SELECT directors.last_name, directors.country FROM directors, movies WHERE movies.director_id=directors.director_id AND movies.title="Roma";
DELETE from movies WHERE movie_id=2;
DELETE from directors WHERE director_id=10;

