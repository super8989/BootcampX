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