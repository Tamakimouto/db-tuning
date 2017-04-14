-- Queries for Project 4
-- -------------------------------------

-- 1. List the name of the student with id equal to v1 (id).
SELECT stud_name FROM student WHERE stud_id = 774861;

-- 2. List the names of students with id in the range of v2 (id) to v3 (inclusive).
SELECT stud_name FROM student WHERE stud_id BETWEEN 396624 AND 763176;

-- 3. List the names of students who have taken course v4 (crs_code).
SELECT stud_name FROM student
JOIN transcript
ON transcript.stud_id = student.stud_id
WHERE transcript.crs_code = '917489';

-- 4. List the names of students who have taken a course taught by professor v5 (name).
SELECT DISTINCT student.stud_name FROM student
JOIN transcript
ON transcript.stud_id = student.stud_id
JOIN teaching
ON teaching.crs_code = transcript.crs_code AND teaching.semester = transcript.semester
JOIN professor
ON professor.Id = teaching.prof_id
WHERE professor.Name = 'name10747';

-- 5. List the names of students who have taken a course from department v6 (dept_id), but not v7.
SELECT stud_name FROM student, 
       (SELECT stud_id FROM transcript, course WHERE dept_id = '160435' AND course.crs_code = transcript.crs_code
	AND stud_id NOT IN
	(SELECT stud_id FROM transcript, course WHERE dept_id = '78889' AND course.crs_code = transcript.crs_code)) as alias
       WHERE student.stud_id = alias.stud_id;

       -- 6. List the names of students who have taken all courses offered by department v8 (dept_id).
       SELECT stud_name 
       FROM student
       JOIN transcript
       ON student.stud_id = transcript.stud_id
       WHERE crs_code IN
       (SELECT crs_code FROM course WHERE dept_id = '14420' AND crs_code IN (SELECT crs_code FROM teaching))
       GROUP BY stud_name
       HAVING COUNT(*) = 
       (SELECT COUNT(*) FROM course WHERE dept_id = '14420' AND crs_code IN (SELECT crs_code FROM teaching));
