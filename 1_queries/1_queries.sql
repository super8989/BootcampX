SELECT id, name
FROM students
WHERE cohort_id = 1
ORDER BY name;

SELECT COUNT(*)
FROM students
WHERE cohort_id IN (1, 2, 3);

SELECT name, id, cohort_id
FROM students
WHERE email IS NULL OR phone IS NULL;

SELECT name, id, email, phone, cohort_id
FROM students
WHERE phone IS NULL OR email != '%@gmail.com'
ORDER BY cohort_id DESC;

SELECT name, id, cohort_id
FROM students
WHERE end_date IS NULL
ORDER BY cohort_id DESC;

SELECT name, email, phone
FROM students
WHERE github IS NULL AND end_date IS NOT NULL;

SELECT students.name as student_name, 
cohorts.name as cohort_name, 
cohorts.start_date as cohort_start_date, 
students.start_date as student_start_date
FROM students
LEFT JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.start_date != students.start_date
ORDER BY cohorts.start_date;