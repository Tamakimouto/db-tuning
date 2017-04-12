reset query cache;
use Heapsters_Tuning_MySQL;

-- List name of the student with id equal to v1 (id)

EXPLAIN
SELECT name
FROM Student
WHERE id = 912325;

SELECT name
FROM Student
WHERE id = 912325;

-- List names of students with id in range of v2 (id) to v3 (inclusive).

EXPLAIN
SELECT name
FROM Student
WHERE id >= 3000 AND id <= 9000;

SELECT name
FROM Student
WHERE id >= 3000 AND id <= 9000;

-- List names of students who have taken course v4 (crsCode)

EXPLAIN
SELECT S.name
FROM Student AS S, Transcript AS T
WHERE S.id = T.studId && T.crsCode = 'crs148793';

SELECT S.name
FROM Student AS S, Transcript AS T
WHERE S.id = T.studId && T.crsCode = 'crs148793';

SELECT S.name
FROM Student AS S, Transcript AS T
WHERE S.id = T.studId && T.crsCode = 'crs148793';

-- List of names of students who have taken a course taught by professor v5 (name)

EXPLAIN
SELECT S.name
FROM Student AS S, Transcript AS Tr, Teaching AS Te, Professor AS P
WHERE S.id = Tr.studId && Tr.crsCode = Te.crsCode && Te.profId = P.id && P.name = 'name489302';

SELECT S.name
FROM Student AS S, Transcript AS Tr, Teaching AS Te, Professor AS P
WHERE S.id = Tr.studId && Tr.crsCode = Te.crsCode && Te.profId = P.id && P.name = 'name489302';

-- List of names of students who have taken a course from department v6 (deptId), but not v7

EXPLAIN
SELECT S.name
FROM Student S, Transcript Tr, Teaching Te, Professor P
WHERE S.id = Tr.studId && Tr.crsCode = Te.crsCode && Te.profId = P.id && P.deptId = 6 && P.deptId != 7;
SELECT S.name
FROM Student S, Transcript Tr, Teaching Te, Professor P
WHERE S.id = Tr.studId && Tr.crsCode = Te.crsCode && Te.profId = P.id && P.deptId = 6 && P.deptId != 7;

-- List names of students who have taken all courses offered by department v8 (deptId)

EXPLAIN
SELECT S.name
FROM Student AS S, Transcript AS Tr, Teaching AS Te, Professor P
WHERE S.id = Tr.studId && Tr.crsCode = Te.crsCode && Te.profId = P.id
GROUP BY S.name, S.id
HAVING COUNT(*) = (SELECT COUNT(*)
    FROM Professor AS P JOIN Teaching AS T
    WHERE P.id = T.profId && P.deptId = 'dept873573');

SELECT S.name
FROM Student AS S, Transcript AS Tr, Teaching AS Te, Professor P
WHERE S.id = Tr.studId && Tr.crsCode = Te.crsCode && Te.profId = P.id
GROUP BY S.name, S.id
HAVING COUNT(*) = (SELECT COUNT(*)
    FROM Professor AS P JOIN Teaching AS T
    WHERE P.id = T.profId && P.deptId = 'dept873573');
