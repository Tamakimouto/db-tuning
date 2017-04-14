reset query cache;
use Heapsters_Tuning_MySQL;

-- List name of the student with id equal to v1 (id)

SELECT name
FROM Student
WHERE id = 912325;

-- List names of students with id in range of v2 (id) to v3 (inclusive).

SELECT name
FROM Student
WHERE id >= 3000 AND id <= 9000;

-- List names of students who have taken course v4 (crsCode)

CREATE INDEX transcript_crsCode_index ON Trancript (crsCode);

SELECT S.name
FROM Student AS S JOIN Transcript AS T
WHERE S.id = T.studId && T.crsCode = 'crs148793';

-- List of names of students who have taken a course taught by professor v5 (name)

CREATE INDEX teaching_crsCode_index ON Teaching (crsCode);
CREATE INDEX transcript_id_index ON Trancript (studId);

SELECT S.name
FROM Student AS S JOIN Transcript AS Tr JOIN Teaching AS Te JOIN Professor AS P
WHERE S.id = Tr.studId && Tr.crsCode = Te.crsCode && Te.profId = P.id && P.name = 'name489302';

-- List of names of students who have taken a course from department v6 (deptId), but not v7

SELECT S.name
FROM Student S JOIN Transcript Tr JOIN Teaching Te JOIN Professor P
WHERE S.id = Tr.studId && Tr.crsCode = Te.crsCode && Te.profId = P.id && P.deptId = 6 && P.deptId != 7;

-- List names of students who have taken all courses offered by department v8 (deptId)

CREATE INDEX student_name_index ON Student (name);

SELECT S.name
FROM Student S JOIN Transcript Tr FORCE INDEX (transcript_id_index)
JOIN Teaching Te JOIN Professor P
WHERE S.id = Tr.studId && Tr.crsCode = Te.crsCode && Te.profId = P.id
GROUP BY S.id, S.name
HAVING COUNT(*) = (SELECT COUNT(*)
    FROM Professor AS P JOIN Teaching AS T
    WHERE P.id = T.profId && P.deptId = 'dept873573');
