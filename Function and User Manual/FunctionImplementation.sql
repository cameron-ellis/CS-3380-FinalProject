/* insert Function */
INSERT INTO TABLE_NAME
(Attr_1, Attr_2, Attr_3, ... , Attr_n)
VALUES
(T1A_1, T1A_2, T1A_3, ..., T1A_n),
(T2A_1, T2A_2, T2A_3, ..., T2A_n),
(T3A_1, T3A_2, T3A_3, ..., T3A_n),
...
(TnA_1, TnA_2, TnA_3, ..., TnA_n);

/* insert Function Example */
INSERT INTO STUDENT
( StudentID, FirstName, MiddleName, LastName, DateOfBirth, GradeLevel, StudentEmail )
VALUES
('22222222', 'Mike', 'James', 'Jacob', '2005-09-17', '9', 'Mike12345@gmail.com'),
('33333313', 'Jennifer', 'Marie', 'Barber', '2002-08-02', '12', 'JennyB123@yahoo.com');

/* delete Function */
DELETE FROM TABLE_NAME
WHERE PKAttr = 'desiredPK';

/* delete Function Example */
DELETE FROM STUDENT
WHERE StudentID = '11111111';

/* update Function */
UPDATE TABLE_NAME
SET Column1=value1,...,ColumnN=valueN
WHERE PKAttr = 'desiredPK';

/* update Function Example */
UPDATE COURSE
SET CourseID='14020185', CourseName='Pre-Calculus'
WHERE CourseID='14020184';

/* getTuple Function */
SELECT Desired_Attributes
FROM TABLE_NAME
WHERE PKAttr = 'desiredPK';

/* getTuple Function Example */
SELECT F.Salary, F.Faculty_Name, F.Department
FROM FACULTY AS F
WHERE FacultyID = '16130625';

/* getSchoolCourses Function */
SELECT DISTINCT CourseName
FROM COURSE
WHERE Course_School = 'School_Name';

/* getSchoolCourses Function Example */
SELECT DISTINCT CourseName
FROM COURSE
WHERE Course_School = 'Smithton';

/* getMaxCredits Function */
SELECT CourseName, CreditHours
FROM COURSE
WHERE Course_School = 'School_Name' AND CreditHours =
											(SELECT MAX(CreditHours)
                                             FROM COURSE
                                             WHERE Course_School = 'School_Name');

/* getMaxCredits Function Example */
SELECT CourseName, CreditHours
FROM COURSE
WHERE Course_School = 'Hickman' AND CreditHours =
											(SELECT MAX(CreditHours)
                                             FROM COURSE
                                             WHERE Course_School = 'Hickman');

/* getMinCredits Function */
SELECT CourseName, CreditHours
FROM COURSE
WHERE Course_School = 'School_Name' AND CreditHours =
											(SELECT MIN(CreditHours)
                                             FROM COURSE
                                             WHERE Course_School = 'School_Name');

/* getMinCredits Function Example */
SELECT CourseName, CreditHours
FROM COURSE
WHERE Course_School = 'Smithton' AND CreditHours =
											(SELECT MIN(CreditHours)
                                             FROM COURSE
                                             WHERE Course_School = 'Smithton');

/* countStudentsSchool Function */
SELECT COUNT(A.StudentID)
FROM ATTENDS AS A
WHERE A.School_Name = 'School_Name';

/* countStudentsSchool Function Example */
SELECT COUNT(A.StudentID)
FROM ATTENDS AS A
WHERE A.School_Name = 'Hickman';

/* countStudentsCourse Function */
SELECT COUNT(T.StudentID)
FROM COURSE AS C, TAKES AS T
WHERE C.CourseID = T.CourseID AND C.CourseName = 'Course_Name' AND C.Course_School = 'School_Name';

/* countStudentsCourse Function Example */
SELECT COUNT(T.StudentID)
FROM COURSE AS C, TAKES AS T
WHERE C.CourseID = T.CourseID AND C.CourseName = 'Chemistry' AND C.Course_School = 'Hickman';

/* avgSchoolGPA Function (Per Semester) */
SELECT AVG(ACA.GPA)
FROM ATTENDS AS ATT, ACADEMIC_RECORD AS ACA
WHERE ATT.StudentID = ACA.StudentID AND ATT.School_Name = 'School_Name' AND ACA.SemesterID = 'Semester_ID';

/* avgSchoolGPA Function (Per Semester) Example */
SELECT AVG(ACA.GPA)
FROM ATTENDS AS ATT, ACADEMIC_RECORD AS ACA
WHERE ATT.StudentID = ACA.StudentID AND ATT.School_Name = 'Hickman' AND ACA.SemesterID = 'Fall 2019';

/* maxSchoolGPA Function (Per Semester) */
SELECT MAX(ACA.GPA)
FROM ATTENDS AS ATT, ACADEMIC_RECORD AS ACA
WHERE ATT.StudentID = ACA.StudentID AND ATT.School_Name = 'School_Name' AND ACA.SemesterID = 'Semester_ID';

/* maxSchoolGPA Function (Per Semester) Example */
SELECT MAX(ACA.GPA)
FROM ATTENDS AS ATT, ACADEMIC_RECORD AS ACA
WHERE ATT.StudentID = ACA.StudentID AND ATT.School_Name = 'Hickman' AND ACA.SemesterID = 'Fall 2019';

/* minSchoolGPA Function (Per Semester) */
SELECT MIN(ACA.GPA)
FROM ATTENDS AS ATT, ACADEMIC_RECORD AS ACA
WHERE ATT.StudentID = ACA.StudentID AND ATT.School_Name = 'School_Name' AND ACA.SemesterID = 'Semester_ID';

/* minSchoolGPA Function (Per Semester) Example */
SELECT MIN(ACA.GPA)
FROM ATTENDS AS ATT, ACADEMIC_RECORD AS ACA
WHERE ATT.StudentID = ACA.StudentID AND ATT.School_Name = 'Hickman' AND ACA.SemesterID = 'Fall 2019';

/* getStudentCourses Function */
SELECT C.CourseName
FROM COURSE AS C, TAKES AS T
WHERE C.CourseID = T.CourseID AND T.StudentID = 'Desired_StudentID';

/* getStudentCourses Function Example */
SELECT C.CourseName
FROM COURSE AS C, TAKES AS T
WHERE C.CourseID = T.CourseID AND T.StudentID = '87654321';

/* getStudentClubs Function */
SELECT Club_Name
FROM JOINS
WHERE StudentID = 'Desired_StudentID';

/* getStudentClubs Function Example */
SELECT Club_Name
FROM JOINS
WHERE StudentID = '13579246';

/* getStudentSchool Function */
SELECT S.LastName, S.FirstName, A.School_Name
FROM ATTENDS AS A, STUDENT AS S
WHERE S.StudentID = A.StudentID AND A.StudentID = 'StudentID';

/* getStudentSchool Function Example */
SELECT S.LastName, S.FirstName, A.School_Name
FROM ATTENDS AS A, STUDENT AS S
WHERE S.StudentID = A.StudentID AND A.StudentID = '13579246';

/* calcGradCreds Function */
SELECT 'Creds_To_Graduate' - SUM(Semester_Credits)
FROM ACADEMIC_RECORD
WHERE StudentID = 'Desired_StudentID';

/* calcGradCreds Function Example */
SELECT '150' - SUM(Semester_Credits)
FROM ACADEMIC_RECORD
WHERE StudentID = '12345678';

/* getSchoolFaculty Function */
SELECT F.Faculty_Name
FROM SCHOOL AS S, WORKS AS W, FACULTY AS F
WHERE S.School_Name = W.School_Name AND W.FacultyID = F.FacultyID AND S.School_Name = 'School_Name';

/* getSchoolFaculty Function Example */
SELECT F.Faculty_Name
FROM SCHOOL AS S, WORKS AS W, FACULTY AS F
WHERE S.School_Name = W.School_Name AND W.FacultyID = F.FacultyID AND S.School_Name = 'Hickman';

/* getFacultyCourses Function */
SELECT C.CourseName
FROM TEACHES AS T, COURSE AS C
WHERE C.CourseID = T.CourseID AND T.FacultyID = 'Desired_FacultyID';

/* getFacultyCourses Function Example */
SELECT C.CourseName
FROM TEACHES AS T, COURSE AS C
WHERE C.CourseID = T.CourseID AND T.FacultyID = '71738964';

/* getCoursePeriod Function */
SELECT CP.ClassPeriod
FROM COURSE AS CO, CLASS_PERIOD AS CP
WHERE CO.CourseID = CP.CourseID AND CO.CourseName = 'Course_Name' AND CO.Course_School = 'School_Name';

/* getCoursePeriod Function Example */
SELECT CP.ClassPeriod
FROM COURSE AS CO, CLASS_PERIOD AS CP
WHERE CO.CourseID = CP.CourseID AND CO.CourseName = 'Pre-Calculus' AND CO.Course_School = 'Hickman';

/* cumulativeGPA Function */
SELECT FORMAT(AVG(GPA), 4)
FROM ACADEMIC_RECORD
WHERE StudentID = 'Desired_StudentID';

/* cumulativeGPA Function Example */
SELECT FORMAT(AVG(GPA), 4)
FROM ACADEMIC_RECORD
WHERE StudentID = '12345678';

/* clubMemberCount Function */
SELECT COUNT(StudentID)
FROM JOINS
WHERE Club_Name = 'Desired_Club_Name' AND Club_School = 'Desired_School_Name';

/* clubMemberCount Function Example */
SELECT COUNT(StudentID)
FROM JOINS
WHERE Club_Name = 'Chess Club' AND Club_School = 'Hickman';
