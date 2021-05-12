/* insert Function */
INSERT INTO TABLE_NAME
(Attr_1, Attr_2, Attr_3, ... , Attr_n)
VALUES
(A1V_1, A1V_2, A1V_3, ..., A1V_n),
(A2V_1, A2V_2, A2V_3, ..., A2V_n),
(A3V_1, A3V_2, A3V_3, ..., A3V_n),
...
(AnV_1, AnV_2, AnV_3, ..., AnV_n);

/* delete Function */
DELETE FROM TABLE_NAME
WHERE PKAttr = (desiredPK);

/* update Function */
UPDATE Table
SET Column1=value1,...,ColumnN=valueN
WHERE PKAttr = (desiredPK);

/* getTuple Function */
SELECT Desired_Attributes
FROM TABLE_NAME
WHERE PKAttr = (desiredPK);

/* getSchoolCourses Function */
SELECT DISTINCT CourseName
FROM COURSE
WHERE Course_School = 'School_Name';

/* getMaxCredits Function */
SELECT CourseName, CreditHours
FROM COURSE
WHERE CreditHours =
            (SELECT MAX(CreditHours)
             FROM COURSE
             WHERE Course_School = 'School_Name');

/* getMinCredits Function */
SELECT CourseName, CreditHours
FROM COURSE
WHERE CreditHours =
            (SELECT MIN(CreditHours)
             FROM COURSE
             WHERE Course_School = 'School_Name');

/* countStudentsSchool Function */
SELECT COUNT(A.StudentID)
FROM ATTENDS AS A
WHERE A.School_Name = 'School_Name';

/* countStudentsCourse Function */
SELECT COUNT(T.StudentID)
FROM COURSE AS C, TAKES AS T
WHERE C.CourseID = T.CourseID AND C.CourseName = 'Course_Name' AND C.Course_School = 'School_Name';

/* avgSchoolGPA Function (Per Semester) */
SELECT AVG(ACA.GPA)
FROM ATTENDS AS ATT, ACADEMIC_RECORD AS ACA
WHERE ATT.StudentID = ACA.StudentID AND ATT.School_Name = 'School_Name' AND ACA.SemesterID = 'Semester_ID';

/* maxSchoolGPA Function (Per Semester) */
SELECT MAX(ACA.GPA)
FROM ATTENDS AS ATT, ACADEMIC_RECORD AS ACA
WHERE ATT.StudentID = ACA.StudentID AND ATT.School_Name = 'School_Name' AND ACA.SemesterID = 'Semester_ID';

/* minSchool GPA Function (Per Semester) */
SELECT MIN(ACA.GPA)
FROM ATTENDS AS ATT, ACADEMIC_RECORD AS ACA
WHERE ATT.StudentID = ACA.StudentID AND ATT.School_Name = 'School_Name' AND ACA.SemesterID = 'Semester_ID';

/* getStudentCourses Function */
SELECT T.StudentID, C.CourseName
FROM COURSE AS C, TAKES AS T
WHERE C.CourseID = T.CourseID AND T.StudentID = 'Desired_StudentID';

/* getStudentClubs Function */
SELECT Club_Name
FROM JOINS
WHERE StudentID = 'Desired_StudentID';

/* getStudentSchool Function */
SELECT S.LastName, S.FirstName, A.School_Name
FROM ATTENDS AS A, STUDENT AS S
WHERE S.StudentID = A.StudentID AND A.StudentID = 'StudentID';

/* calcGradCreds Function */
SELECT 'Creds_To_Graduate' - SUM(Semester_Credits)
FROM ACADEMIC_RECORD
WHERE StudentID = 'Desired_StudentID';

/* getSchoolFaculty Function */
SELECT F.Faculty_Name
FROM SCHOOL AS S, WORKS AS W, FACULTY AS F
WHERE S.School_Name = W.School_Name AND W.FacultyID = F.FacultyID AND S.School_Name = 'School_Name';

/* getFacultyCourses Function */
SELECT C.CourseName
FROM TEACHES AS T, COURSE AS C
WHERE C.CourseID = T.CourseID AND T.FacultyID = 'Desired_FacultyID';

/* getCoursePeriod Function */
SELECT CP.ClassPeriod
FROM COURSE AS CO, CLASS_PERIOD AS CP
WHERE CO.CourseID = CP.CourseID AND CO.CourseName = 'Course_Name' AND CO.Course_School = 'School_Name';

/* cumulativeGPA Function */
SELECT AVG(GPA)
FROM ACADEMIC_RECORD
WHERE StudentID = 'Desired_StudentID';

/* clubMemberCount Function */
SELECT COUNT(StudentID)
FROM JOINS
WHERE Club_Name = 'Desired_Club_Name' AND Club_School = 'Desired_School_Name';
