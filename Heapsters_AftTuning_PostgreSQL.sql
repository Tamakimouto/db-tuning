


CREATE INDEX student_index ON student (stud_id, stud_name);

CREATE INDEX transcript_index ON transcript (stud_id, crs_code);

CREATE INDEX teaching_index ON teaching (crs_code, prof_id);

CREATE INDEX professor_index ON professor (id, name, dept_id);



-- List name of the student with id equal to v1 (id)



SELECT student.stud_name
FROM student
WHERE student.stud_id=912325;



-- List names of students with id in range of v2 (id) to v3 (inclusive).



Select student.stud_name
from student
where student.stud_id >=3000 and student.stud_id <= 9000;



-- List names of students who have taken course v4 (crsCode)



Select student.stud_name
from student, transcript
Where student.stud_id=transcript.stud_id AND transcript.crs_code='148793';



-- List of names of students who have taken a course taught by professor v5 (name)



Select student.stud_name
from student, transcript, teaching, professor
where transcript.crs_code= teaching.crs_code 
AND student.stud_id= transcript.stud_id
AND teaching.prof_id= professor.id
AND professor.name= 'name489302';



-- List of names of students who have taken a course from department v6 (deptId), but not v7



Select student.stud_name
from student, transcript, course
where transcript.crs_code= course.crs_code
and student.stud_id = transcript.stud_id 
and course.dept_id = '6' and course.dept_id <> '7' ;



-- List names of students who have taken all courses offered by department v8 (deptId)



Select student.stud_name
from student, transcript, course
where transcript.stud_id = student.stud_id 
AND transcript.crs_code=course.crs_code 
AND course.dept_id='873573';
