SELECT name
FROM students
WHERE name = 'Ibrahim Schimmel';


-- Get the total amount of time that a student has spent on all assignments.
SELECT SUM(assignment_submissions.duration) AS total_duration
FROM assignment_submissions
JOIN students ON assignment_submissions.student_id = students.id
WHERE students.name = 'Ibrahim Schimmel';

-- SELECT sum(assignment_submissions.duration) as total_duration
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.name = 'Ibrahim Schimmel';

-- 
-- Get the total amount of time that all students from a specific cohort have spent on all assignments.

SELECT SUM(assignment_submissions.duration) AS total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'FEB12';

-- 
-- calculate the total number of assignment_submissions for each student individually, and output the totals next to the student's name

SELECT students.name AS student, COUNT(assignment_submissions) AS total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
GROUP BY students.name
ORDER BY students.name;

-- 
-- Alter the query slightly to only return currently enrolled students.
SELECT students.name AS student, COUNT(assignment_submissions) AS total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name;

-- 
-- return currently enrolled students whose total submissions are less than 100;
SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions.*) < 100;
