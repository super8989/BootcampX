const { Pool } = require('pg');

const pool = new Pool({
	user: 'vagrant',
	password: '123',
	host: 'localhost',
	database: 'bootcampx',
});

// > node teachers.js JUL
const [, , cohortName] = process.argv;
const values = [`%${cohortName}%`];
const queryString = ` 
  SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
  FROM teachers
  JOIN assistance_requests ON teachers.id = teacher_id
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name LIKE $1
  ORDER BY teacher;`;

pool
	.query(queryString, values)
	.then((res) => {
		res.rows.forEach((user) => {
			console.log(`${user.cohort}: ${user.teacher}`);
		});
	})
	.catch((err) => console.error('query error', err.stack));
