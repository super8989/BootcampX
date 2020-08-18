-- Get the total number of assignments for each day of bootcamp.
SELECT day, COUNT(*) as total_assignments
FROM assignments
GROUP BY day
ORDER BY day ASC;

-- return rows where total assignments is greater than or equal to 10.
SELECT day, COUNT(*) AS total_assignments
FROM assignments
GROUP BY day
HAVING COUNT(*) >= 10
ORDER BY day;

-- Get all cohorts with 18 or more students.
SELECT cohorts.name AS cohort_name, COUNT(students.*) AS student_count
FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING COUNT(students.*) >= 18
ORDER BY COUNT(students.*) ASC;

-- Get the total number of assignment submissions for each cohort.
SELECT cohorts.name AS cohort, COUNT(assignment_submissions.*) AS total_submissions
FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
GROUP BY cohort
ORDER BY total_submissions DESC;
--
SELECT cohorts.name as cohort, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;

-- Get currently enrolled students' average assignment completion time.
SELECT students.name AS student, AVG(assignment_submissions.duration) AS average_assignment_duration
FROM assignment_submissions
JOIN students ON assignment_submissions.student_id = students.id AND students.end_date is NULL
GROUP BY student
ORDER BY average_assignment_duration DESC;
--
SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
WHERE end_date IS NULL
GROUP BY student
ORDER BY average_assignment_duration DESC;

-- Get the students who's average time it takes to complete an assignment is less than the average estimated time it takes to complete an assignment.
SELECT students.name AS student, AVG(assignment_submissions.duration) AS average_assignment_duration, AVG(assignments.duration) AS average_estimated_duration
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
JOIN assignments ON assignment_submissions.assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY student
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY average_assignment_duration ASC;
