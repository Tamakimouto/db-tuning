REATE INDEX student_index ON Student (id, name);

CREATE INDEX transcript_index ON Transcript (studId, crsCode);

CREATE INDEX teaching_index ON Teaching (crsCode, profId);

CREATE INDEX professor_index ON professor (id, name, deptId);



-- List name of the student with id equal to v1 (id)



SELECT Student.name
FROM Student
WHERE Student.id=912325;



-- List names of students with id in range of v2 (id) to v3 (inclusive).



Select Student.name
from Student
where Student.id >=3000 and Student.id <= 9000;



-- List names of students who have taken course v4 (crsCode)



Select Student.name
from Student, Transcript
Where Student.id=Transcript.StudId AND Transcript.crsCode='crs148793';



-- List of names of students who have taken a course taught by professor v5 (name)



Select Student.name
from Student, Transcript, Teaching, Professor
where Transcript.crsCode= Teaching.crsCode 
AND Student.id= Transcript.studId
AND Teaching.profID= Professor.ID
AND Professor.name= 'name489302';



-- List of names of students who have taken a course from department v6 (deptId), but not v7



Select Student.name
from Student, Transcript, Course
where Transcript.crsCode= Course.crsCode
and Student.id = Transcript.studId 
and Course.deptId = '6' and Course.deptId <> '7' ;



-- List names of students who have taken all courses offered by department v8 (deptId)



Select Student.name
from Student, Transcript, Course
where Transcript.studId = Student.id 
AND ALL Transcript.crsCode=Course.crsCode 
AND Course.deptId='dept873573';
