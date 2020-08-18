CREATE TABLE teachers (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  start_date DATE,
  end_date DATE
);

-- A teacher will have the following attributes:

-- id: A unique identifier
-- name: The name of the teacher
-- start_date: The date that the teacher started working.
-- end_date: The date that the teacher stopped working.
-- is_active: If the teacher is actively teaching right now.

CREATE TABLE assistance_requests (
  id SERIAL PRIMARY KEY NOT NULL,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  teacher_id INTEGER REFERENCES teachers(id) ON DELETE CASCADE,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  created_at TIMESTAMP,
  started_at TIMESTAMP,
  completed_at TIMESTAMP,
  student_feedback TEXT,
  teacher_feedback TEXT
);



-- An assistance_request will have the following attributes:

-- id: A unique identifier
-- assignment_id: The id of the assignment the request was made from
-- student_id: The id of the student making the request
-- teacher_id: The id of the teacher responding to the request
-- created_at: The timestamp when the request was made
-- started_at: The timestamp when the assistance started
-- completed_at: The timestamp when the assistance was completed
-- student_feedback: Feedback about the student given by the teacher
-- teacher_feedback: Feedback about the teacher given by the student

-- A student can create many assistance_requests and a teacher can respond to many assistance_requests.
