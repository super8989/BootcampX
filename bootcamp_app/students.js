const { Pool } = require('pg');

const pool = new Pool({
	user: 'vagrant',
	password: '123',
	host: 'localhost',
	database: 'bootcampx',
});

// pool
// 	.query(
// 		`
// SELECT id, name, cohort_id
// FROM students
// LIMIT 5;
// `
// 	)
// 	.then((res) => {
// 		console.log(res.rows);
// 	})
// 	.catch((err) => console.error('query error', err.stack));

// pool
// 	.query(
// 		`
// SELECT id, name, cohort_id
// FROM students
// LIMIT 5;
// `
// 	)
// 	.then((res) => {
// 		res.rows.forEach((user) => {
// 			console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_id} cohort`);
// 		});
// 	});

// pool
// 	.query(
// 		`
// SELECT students.id, students.name as name, cohorts.name as cohorts
// FROM students
// JOIN cohorts ON cohort_id = cohorts.id
// LIMIT 5;
// `
// 	)
// 	.then((res) => {
// 		res.rows.forEach((user) => {
// 			console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohorts} cohort`);
// 		});
// 	});

// const cohortName = process.argv[2];
// const resultLimit = process.argv[3];

const [, , cohortName, resultLimit] = process.argv;

pool
	.query(
		`
SELECT students.id, students.name as name, cohorts.name as cohorts
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE '${cohortName}%'
LIMIT ${resultLimit};
`
	)
	.then((res) => {
		res.rows.forEach((user) => {
			console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohorts} cohort.`);
		});
	})
	.catch((err) => console.error('query error', err.stack));
