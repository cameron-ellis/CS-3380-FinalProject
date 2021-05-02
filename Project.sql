CREATE TABLE STUDENT (
    StudentID INTEGER PRIMARY KEY,
    FirstName VARCHAR(20),
    MiddleName VARCHAR(20),
    LastName VARCHAR(20),
    DateOfBirth DATE,
    GradeLevel INTEGER,
    StudentEmail VARCHAR(30)
    );

CREATE TABLE STUDENT_EMERGENCY_CONTACT (
	StudentID INTEGER NOT NULL,
	EC_Name VARCHAR(40) PRIMARY KEY,
	Relationship VARCHAR(20),
	FOREIGN KEY (StudentID) REFERENCES student (StudentID)
	); 

CREATE TABLE EMERGENCY_PHONE_NUMBER (
	StudentID INTEGER NOT NULL,
	EC_Name VARCHAR(40) NOT NULL,
	EC_Phone VARCHAR(15) NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID),
	FOREIGN KEY (EC_Name) REFERENCES student_emergency_contact (EC_Name)
	);

/*rename this to Student_EC_Email? */
CREATE TABLE STUDENT_EC_EMAIL (
	StudentID INTEGER NOT NULL,
	EC_NAME VARCHAR(40) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID),
	FOREIGN KEY (EC_Name) REFERENCES student_emergency_contact (EC_Name)
	);

CREATE TABLE ACADEMIC_RECORD (
	StudentID INTEGER NOT NULL,
	Credits INTEGER,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID)
	);
/*removed AR_StudentID from this table and Semester_GPA as per the TA grading */

CREATE TABLE SEMESTER_GPA (
	StudentID INTEGER NOT NULL,
	Semester VARCHAR(20),
	GPA FLOAT,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID)
	);

CREATE TABLE CLUBS (
	Club_Name VARCHAR(30) NOT NULL,
	Club_School VARCHAR(30) PRIMARY KEY, /*should this reference a school?*/
	Sponsor VARCHAR(40), /*should this reference a faculty member? */
	Leader VARCHAR(40) /* should this reference a student? */
	);

CREATE TABLE JOINS (
	StudentID INTEGER NOT NULL,
	Club_School VARCHAR(30) NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID),
	FOREIGN KEY (Club_School) REFERENCES clubs (Club_School)
	);

CREATE TABLE SCHOOL (
	Address VARCHAR(50) PRIMARY KEY,
	Name VARCHAR(40),
	PhoneNumber VARCHAR(15)
	);
	
CREATE TABLE ATTENDS (
	StudentID INTEGER NOT NULL,
	Address VARCHAR(50) NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID),
	FOREIGN KEY (Address) REFERENCES school (Address)
	);

CREATE TABLE COURSE (
	CourseID INTEGER PRIMARY KEY,
	CourseName VARCHAR(30),
	RoomNumber INTEGER,
	Course_School VARCHAR(40),
	CreditHours INTEGER
	);

CREATE TABLE TEACHES (
	CourseID INTEGER NOT NULL,
	FacultyID INTEGER NOT NULL,
	FOREIGN KEY (CourseID) REFERENCES course (CourseID)
	);

CREATE TABLE TAKES (
	StudentID INTEGER NOT NULL,
	CourseID INTEGER NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID),
	FOREIGN KEY (CourseID) REFERENCES course (CourseID)
	);

CREATE TABLE CLASS_PERIOD (
	CourseID INTEGER NOT NULL,
	ClassPeriod INTEGER NOT NULL,
	FOREIGN KEY (CourseID) REFERENCES course (CourseID)
	);

CREATE TABLE DEPARTMENT (
	DepartmentHead VARCHAR(40) PRIMARY KEY,
	Subject VARCHAR(20)
	);

CREATE TABLE FACULTY (
	FacultyID INTEGER PRIMARY KEY,
	Faculty_Name VARCHAR(40),
	Salary INTEGER,
	StartDate DATE
	);

CREATE TABLE WORKS (
	Address VARCHAR(50) NOT NULL,
	FacultyID INTEGER NOT NULL,
	FOREIGN KEY (Address) REFERENCES school (Address),
	FOREIGN KEY (FacultyID) REFERENCES faculty (FacultyID)
	);

CREATE TABLE ADMINS (
	Address VARCHAR(50) NOT NULL,
	DepartmentHead VARCHAR(40) NOT NULL,
	FOREIGN KEY (Address) REFERENCES school (Address),
	FOREIGN KEY (DepartmentHead) REFERENCES department (DepartmentHead)
	);
	
CREATE TABLE DEPARTMENT_HEAD (
	DepartmentHead VARCHAR(40) NOT NULL,
	FacultyID INTEGER NOT NULL,
	DH_StartDate DATE,
	FOREIGN KEY (DepartmentHead) REFERENCES department (DepartmentHead),
	FOREIGN KEY (FacultyID) REFERENCES faculty (FacultyID)
	);

CREATE TABLE BELONGS (
	DepartmentHead VARCHAR(40) NOT NULL,
	FacultyID INTEGER NOT NULL,
	FOREIGN KEY (DepartmentHead) REFERENCES department (DepartmentHead),
	FOREIGN KEY (FacultyID) REFERENCES faculty (FacultyID)
	);
	





	