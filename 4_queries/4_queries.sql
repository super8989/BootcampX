-- Get the total number of assistance_requests for a teacher.
SELECT COUNT(assistance_requests.*) AS total_assistances, teachers.name
FROM assistance_requests
JOIN teachers ON teacher_id = teachers.id
WHERE name = 'Waylon Boehm'
GROUP BY teachers.name;


-- how many assistance requests any student has requested.
SELECT COUNT(assistance_requests.*) AS total_assistances, students.name
FROM assistance_requests
JOIN students ON students.id = student_id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;


-- Get important data about each assistance request.
SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (completed_at - started_at) as duration
FROM assistance_requests
JOIN teachers ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN assignments ON assignment_id = assignments.id
ORDER BY duration;


-- Get the average time of an assistance request.
SELECT AVG(completed_at - started_at) AS average_assistance_request_duration
FROM assistance_requests;


-- Get the average duration of assistance requests for each cohort.
SELECT cohorts.name, AVG(completed_at - started_at) AS average_assistance_time
FROM assistance_requests
JOIN students ON student_id = students.id
JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time ASC;


-- Get the cohort with the longest average duration of assistance requests.
SELECT cohorts.name, AVG(completed_at - started_at) AS average_assistance_time
FROM assistance_requests
JOIN students ON student_id = students.id
JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;


-- Calculate the average time it takes to start an assistance request.
SELECT AVG(started_at - created_at) AS average_wait_time
FROM assistance_requests;


-- Get the total duration of all assistance requests for each cohort.
SELECT cohorts.name AS cohort, SUM(completed_at - started_at) AS total_duration
FROM assistance_requests
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohort
ORDER BY total_duration ASC;


-- Calculate the average total duration of assistance requests for each cohort.
SELECT AVG(total_duration) AS average_total_duration
FROM (
  SELECT cohorts.name AS cohort, SUM(completed_at - started_at) AS total_duration
  FROM assistance_requests
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
  GROUP BY cohort
  ORDER BY total_duration ASC
) AS total_durations;


-- List each assignment with the total number of assistance requests with it.
SELECT assignments.id, name, day, chapter, COUNT(assistance_requests) as total_requests
FROM assignments
JOIN assistance_requests ON assignments.id = assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC;


-- Get each day with the total number of assignments and the total duration of the assignments.
SELECT day, COUNT(assignments) as number_of_assignments, SUM(duration) as duration
FROM assignments
GROUP BY day
ORDER BY day;


-- Get the name of all teachers that performed an assistance request during a cohort.
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
ORDER BY teacher;


-- Perform the same query as before, but include the number of assistances as well.
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, COUNT(assistance_requests) as total_assistances
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY teacher, cohort
HAVING cohorts.name = 'JUL02' -- could be WHERE 
ORDER BY teacher;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255), 
  birth_year SMALLINT,
  member_since TIMESTAMP 
);

INSERT INTO users (name, birth_year)
VALUES ('Joe', 1990);

INSERT INTO users (name, birth_year)
VALUES ('Manny', 2000);

INSERT INTO pets (name, owner_id)
VALUES ('Fluffy', 3);

INSERT INTO pets (name, owner_id)
VALUES ('Snuggles', 4);

UPDATE pets
SET owner_id = 2
WHERE id = 2;

UPDATE pets
SET owner_id = 2
WHERE id = 3;