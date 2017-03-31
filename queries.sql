
--See all movies--
SELECT *
FROM movie;

--See All Movies & Rating
SELECT movie.name,review.score
FROM movie JOIN review
  ON movie.movieid = review.movieid;


--See All Movies & Ratings (Asending)
SELECT movie.name,review.score
FROM movie JOIN review
    ON movie.movieid = review.movieid
  ORDER BY review.score ASC ;

--See all Movies & Rating (Descending)
SELECT movie.name,review.score
FROM movie JOIN review
    ON movie.movieid = review.movieid
ORDER BY review.score DESC;


--See all people--
SELECT *
FROM person;

--See all people by role--

SELECT person.firstname,person.lastname,role.role
from person JOIN person_role
  ON person.personid = person_role.personid
JOIN role
  ON person_role.roleid = role.roleid;

--See all people by movie--

SELECT person.firstname,person.lastname,movie.name
FROM person JOIN person_role
  ON person.personid = person_role.personid
JOIN movie
  ON movie.movieid = person_role.movieid

--See all people by movie & role--

SELECT person.firstname,person.lastname,role.role,movie.name
FROM person JOIN person_role
  ON person.personid = person_role.personid
JOIN role
  ON person_role.roleid = role.roleid
JOIN movie
  ON person_role.movieid = movie.movieid;

--See all directors--
SELECT person.firstname,person.lastname,role.role
FROM person JOIN person_role
  ON person.personid = person_role.personid
JOIN role
  ON person_role.roleid = role.roleid
WHERE role = 'Director'
GROUP BY person.firstname,person.lastname,role.role;

--See all actors--
SELECT person.firstname,person.lastname,role.role
FROM person JOIN person_role
    ON person.personid = person_role.personid
  JOIN role
    ON person_role.roleid = role.roleid
WHERE role = 'Actor'
GROUP BY person.firstname,person.lastname,role.role;

--See all writers--
SELECT person.firstname,person.lastname,role.role
FROM person JOIN person_role
    ON person.personid = person_role.personid
  JOIN role
    ON person_role.roleid = role.roleid
WHERE role = 'Writer'
GROUP BY person.firstname,person.lastname,role.role;

--See all writers by movie with rating
SELECT movie.name,role.role,person.firstname,person.lastname,review.score
FROM movie JOIN person_role
  ON movie.movieid = person_role.movieid
JOIN role
  ON person_role.roleid = role.roleid
JOIN person
  ON person_role.personid = person.personid
JOIN review
  ON movie.movieid = review.movieid
WHERE role.role='Writer'
GROUP BY movie.name,role.role,person.firstname,person.lastname,review.score;

--See all directors by movie with rating--
SELECT movie.name,role.role,person.firstname,person.lastname,review.score
FROM movie JOIN person_role
    ON movie.movieid = person_role.movieid
  JOIN role
    ON person_role.roleid = role.roleid
  JOIN person
    ON person_role.personid = person.personid
  JOIN review
    ON movie.movieid = review.movieid
WHERE role.role='Director'
GROUP BY movie.name,role.role,person.firstname,person.lastname,review.score;


--See all actors by movie with rating--
SELECT movie.name,role.role,person.firstname,person.lastname,review.score
FROM movie JOIN person_role
    ON movie.movieid = person_role.movieid
  JOIN role
    ON person_role.roleid = role.roleid
  JOIN person
    ON person_role.personid = person.personid
  JOIN review
    ON movie.movieid = review.movieid
WHERE role.role='Actor'
GROUP BY movie.name,role.role,person.firstname,person.lastname,review.score;


