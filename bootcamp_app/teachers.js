const { Pool } = require('pg');

const pool = new Pool({
	user: 'vagrant',
	password: '123',
	host: 'localhost',
	database: 'bootcampx',
});

const [, , cohortName] = process.argv;

pool
	.query(
		`
  SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
  FROM teachers
  JOIN assistance_requests ON teachers.id = teacher_id
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name LIKE '${cohortName}'
  ORDER BY teacher;
`
	)
	.then((res) => {
		res.rows.forEach((user) => {
			console.log(`${user.cohort}: ${user.teacher}`);
		});
	})
	.catch((err) => console.error('query error', err.stack));
