-- 1
SELECT id, title
  FROM movie
 WHERE yr=1962;

-- 2
SELECT yr
  FROM movie
 WHERE title = 'Citizen Kane';

-- 3
SELECT id, title, yr
  FROM movie
 WHERE title LIKE '%Star Trek%'
 ORDER BY yr ASC;

-- 4
SELECT id FROM actor
 WHERE name = 'Glenn Close';

-- 5
 SELECT id
  FROM movie
 WHERE title = 'Casablanca';

-- 6
SELECT name FROM actor
  JOIN casting ON (actor.id = casting.actorid)
 WHERE casting.movieid = 11768;

-- 7
SELECT name FROM actor
  JOIN casting ON (actor.id = casting.actorid)
  JOIN movie   ON (casting.movieid = movie.id)
 WHERE movie.title = 'Alien';

-- 8
SELECT movie.title FROM movie
  JOIN casting ON (movie.id = casting.movieid)
  JOIN actor ON (casting.actorid = actor.id)
 WHERE actor.name = 'Harrison Ford';

-- 9
SELECT movie.title FROM movie
  JOIN casting ON (movie.id = casting.movieid)
  JOIN actor ON (casting.actorid = actor.id)
 WHERE actor.name = 'Harrison Ford'
   AND casting.ord <> '1';

-- 10
SELECT movie.title, actor.name FROM movie
  JOIN casting ON (movie.id = casting.movieid)
  JOIN actor ON (casting.actorid = actor.id)
 WHERE movie.yr = '1962'
   AND casting.ord = '1';

-- 11
SELECT yr, COUNT(title) FROM movie
  JOIN casting ON movie.id = movieid
  JOIN actor   ON actorid = actor.id
 where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
     movie JOIN casting ON movie.id=movieid
           JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
);

-- 12
SELECT movie.title, actor.name
  FROM movie
  JOIN casting ON (movie.id = casting.movieid)
  JOIN actor ON (casting.actorid = actor.id)
 WHERE movie.id in (SELECT movie.id
                         FROM movie
                         JOIN casting ON (movie.id = casting.movieid)
                         JOIN actor ON (casting.actorid = actor.id)
                        WHERE actor.name = 'Julie Andrews')
  AND casting.ord = '1';

-- 13
SELECT name
  FROM casting
  JOIN actor ON (actorid = actor.id)
 WHERE actorid IN (SELECT actorid
                     FROM casting
                    WHERE ord = '1'
                    GROUP BY actorid
                   HAVING COUNT(ord) >= 30)
GROUP BY name;

-- 14
SELECT title, COUNT(actorid)
  FROM movie
  JOIN casting ON (movie.id = casting.movieid)
 WHERE yr = '1978'
GROUP BY title
ORDER BY COUNT(actorid) DESC, title ASC;

-- 15

SELECT name
  FROM movie
  JOIN casting ON (movie.id = casting.movieid)
  JOIN actor ON (casting.actorid = actor.id)
 WHERE title IN (SELECT title
                  FROM movie
                  JOIN casting ON (movie.id = casting.movieid)
                  JOIN actor ON (casting.actorid = actor.id)
                 WHERE name = 'Art Garfunkel'
                 GROUP BY title)
  AND name <> 'Art Garfunkel'
GROUP BY name;
