CREATE TABLE STUDENT (
    StudentID INTEGER PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    MiddleName VARCHAR(20),
    LastName VARCHAR(20) NOT NULL,
    DateOfBirth DATE NOT NULL,
    GradeLevel SMALLINT NOT NULL,
    StudentEmail VARCHAR(30)
    );

CREATE TABLE STUDENT_EMERGENCY_CONTACT (
	StudentID INTEGER NOT NULL,
	EC_Name VARCHAR(40) PRIMARY KEY,
	Relationship VARCHAR(20),
	FOREIGN KEY (StudentID) REFERENCES student (StudentID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);

CREATE TABLE EMERGENCY_PHONE_NUMBER (
	StudentID INTEGER NOT NULL,
	EC_Name VARCHAR(40) NOT NULL,
	EC_Phone VARCHAR(15) NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (EC_Name) REFERENCES student_emergency_contact (EC_Name)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);

CREATE TABLE STUDENT_EC_EMAIL (
	StudentID INTEGER NOT NULL,
	EC_NAME VARCHAR(40) NOT NULL,
	EC_Email VARCHAR(30) NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (EC_Name) REFERENCES student_emergency_contact (EC_Name)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);

CREATE TABLE ACADEMIC_RECORD (
	StudentID INTEGER NOT NULL,
    SemesterID VARCHAR(20) NOT NULL,
	Semester_Credits SMALLINT NOT NULL,
	GPA FLOAT,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	PRIMARY KEY(StudentID,SemesterID)

	);

CREATE TABLE SCHOOL (
	Address VARCHAR(50) NOT NULL,
	School_Name VARCHAR(40) PRIMARY KEY,
	PhoneNumber VARCHAR(15) NOT NULL
	);

CREATE TABLE CLUBS (
	Club_Name VARCHAR(30) NOT NULL,
	Club_School VARCHAR(40) NOT NULL,
	Sponsor VARCHAR(40) NOT NULL,
    LeaderID INTEGER,
	FOREIGN KEY (Club_School) REFERENCES school (School_Name)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (LeaderID) REFERENCES student (StudentID)
		ON UPDATE CASCADE
		ON DELETE SET NULL,
    PRIMARY KEY(Club_Name,Club_School)
	);

CREATE TABLE JOINS (
	StudentID INTEGER NOT NULL,
	Club_Name VARCHAR(30) NOT NULL,
	Club_School VARCHAR(40) NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (Club_Name, Club_School) REFERENCES clubs (Club_Name, Club_School)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	PRIMARY KEY(StudentID,Club_Name,Club_School)
	);

CREATE TABLE ATTENDS (
	StudentID INTEGER NOT NULL,
	School_Name VARCHAR(40) NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (School_Name) REFERENCES school (School_Name)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	PRIMARY KEY(StudentID,School_Name)
	);

CREATE TABLE COURSE (
	CourseID INTEGER PRIMARY KEY,
	CourseName VARCHAR(30) NOT NULL,
	RoomNumber SMALLINT,
	Course_School VARCHAR(40) NOT NULL,
	CreditHours SMALLINT,
	FOREIGN KEY (Course_School) REFERENCES school (School_Name)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);

CREATE TABLE FACULTY (
	FacultyID INTEGER PRIMARY KEY,
	Faculty_Name VARCHAR(40) NOT NULL,
	Salary INTEGER NOT NULL,
	StartDate DATE NOT NULL,
	Department VARCHAR(20) NOT NULL
	);

CREATE TABLE TEACHES (
	CourseID INTEGER NOT NULL,
	FacultyID INTEGER NOT NULL,
	FOREIGN KEY (CourseID) REFERENCES course (CourseID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (FacultyID) REFERENCES faculty (FacultyID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	PRIMARY KEY(FacultyID,CourseID)
	);

CREATE TABLE TAKES (
	StudentID INTEGER NOT NULL,
	CourseID INTEGER NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (CourseID) REFERENCES course (CourseID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	PRIMARY KEY(StudentID,CourseID)
	);

CREATE TABLE CLASS_PERIOD (
	CourseID INTEGER NOT NULL,
	ClassPeriod INTEGER NOT NULL,
	FOREIGN KEY (CourseID) REFERENCES course (CourseID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);

CREATE TABLE WORKS (
	School_Name VARCHAR(40) NOT NULL,
	FacultyID INTEGER NOT NULL,
	FOREIGN KEY (School_Name) REFERENCES school (School_Name)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (FacultyID) REFERENCES faculty (FacultyID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	PRIMARY KEY(School_Name,FacultyID)
	);

/*Student Table Inserts*/
INSERT INTO STUDENT
( StudentID, FirstName, MiddleName, LastName, DateOfBirth, GradeLevel, StudentEmail )
VALUES
('12345678', 'Joe', 'Owen', 'Jacob', '2002-05-02', '12', 'joejacob@gmail.com'),
('87654321', 'Bill', 'Quinton', 'Smith', '2004-04-04', '10', 'Billqsmith123@gmail.com'),
('13579246', 'Jill', 'Rorry', 'Brooks', '2003-03-03', '11', 'jillrbrooks@yahoo.com'),
('24681012', 'Rachel', NULL, 'Brooks', '2008-01-01', '6', 'rrice@gmail.com'),
('11111111', 'James', NULL, 'Kempf', '2004-08-09', '10', NULL);

/*Student_Emergency_Contact Table Inserts*/
INSERT INTO STUDENT_EMERGENCY_CONTACT
( StudentID, EC_Name, Relationship )
VALUES
('12345678', 'John Jacob', 'Father'),
('12345678', 'Joan Jacob', 'Mother'),
('24681012', 'June Rice', 'Aunt'),
('11111111', 'Larry Kempf', NULL),
('87654321', 'Greg Smith', 'Grandfather'),
('13579246', 'Kim Brooks', 'Mother');

/*Emergency_Phone_Number Table Inserts*/
INSERT INTO EMERGENCY_PHONE_NUMBER
( StudentID, EC_Name, EC_Phone )
VALUES
('12345678', 'John Jacob', '(365) 874-7898'),
('12345678', 'Joan Jacob', '(356) 302-7148'),
('87654321', 'Greg Smith', '(346) 554-8271'),
('13579246', 'Kim Brooks', '(735) 607-3186'),
('24681012', 'June Rice', '(313) 682-5971'),
('11111111', 'Larry Kempf', '(443) 785-6921');

/*Student_EC_Email Table Inserts*/
INSERT INTO STUDENT_EC_EMAIL
( StudentID, EC_NAME, EC_Email )
VALUES
('12345678', 'John Jacob', 'John1234@gmail.com'),
('12345678', 'Joan Jacob', 'Joanjacob894@yahoo.com'),
('87654321', 'Greg Smith', 'gregorysmith@hotmail.com'),
('13579246', 'Kim Brooks', 'Kbrooks@protonmail.com'),
('24681012', 'June Rice', 'jrice@gmail.com'),
('11111111', 'Larry Kempf', 'KempfCo@gmail.com');

/*Academic_Record Table Inserts*/
INSERT INTO ACADEMIC_RECORD
(StudentID, SemesterID, Semester_Credits, GPA)
VALUES
('12345678', 'Spring 2020', '110', '4.0'),
('87654321', 'Spring 2020', '50', '3.6'),
('13579246', 'Fall 2019', '70', '3.0'),
('24681012', 'Fall 2019', '36', '2.5'),
('11111111', 'Spring 2018', '0', '1.0');

/*Semester_GPA Table Inserts removed and placed data into academic record
INSERT INTO SEMESTER_GPA
(StudentID, Semester, GPA)
VALUES
('12345678', 'Spring 2020', '4.0'),
('87654321', 'Spring 2020', '3.6'),
('13579246', 'Fall 2019', '3.0'),
('24681012', 'Fall 2019', '2.5'),
('11111111', 'Spring 2018', '1.0');
*/
/*School Table Inserts*/
INSERT INTO SCHOOL
(Address, School_Name, PhoneNumber)
VALUES
('1104 N Providence Rd, Columbia, MO 65203', 'Hickman', '(573) 214-3000'),
('4303 S Providence Rd #7198, Columbia, MO 65203', 'Rockbridge', '(573) 214-3100'),
('7575 E St Charles Rd, Columbia, MO 65202', 'Battle', '(573) 214-3300'),
('3600 W Worley St, Columbia, MO 65203', 'Smithton', '(573) 214-3260');

/*Clubs Table Inserts*/
INSERT INTO CLUBS
(Club_Name, Club_School, Sponsor, LeaderID)
VALUES
('Chess Club', 'Smithton', 'Ruthie Maxene', '24681012'),
('Robotics', 'Hickman', 'Vicky Laney', '87654321'),
('Choir', 'Rockbridge', 'Derick Andy', '12345678'),
('Baseball', 'Battle', 'Merry Sanford', '11111111'),
('Chess Club', 'Hickman', 'Bobby Taub', '13579246');

/*Joins Table Inserts*/
INSERT INTO JOINS
(StudentID, Club_Name, Club_School)
VALUES
('24681012', 'Chess Club', 'Smithton'),
('87654321', 'Chess Club', 'Hickman'),
('13579246', 'Robotics', 'Hickman'),
('12345678', 'Choir', 'Rockbridge'),
('11111111', 'Baseball', 'Battle'),
('13579246', 'Chess Club', 'Hickman');

/*Attends Table Inserts*/
INSERT INTO ATTENDS
(StudentID, School_Name)
VALUES
('12345678', 'Rockbridge'),
('87654321', 'Hickman'),
('13579246', 'Hickman'),
('24681012', 'Smithton'),
('11111111', 'Battle');

/*Course Table Inserts*/
INSERT INTO COURSE
(CourseID, CourseName, RoomNumber, Course_School, CreditHours)
VALUES
('14020184', 'Calculus', '5', 'Hickman', '5'),
('25830589', 'Calculus', '6', 'Smithton', '3'),
('75230598', 'English', '1', 'Smithton', '3'),
('12365440', 'Chemistry', '3', 'Hickman', '4'),
('71024395', 'Algebra', '1', 'Smithton', '3'),
('36540392', 'US History', '2', 'Battle', '4');

/*Faculty Table Inserts*/
INSERT INTO FACULTY
(FacultyID, Faculty_Name, Salary, StartDate, Department)
VALUES
('16130625', 'Ruthie Maxene', '60000.00', '1990-06-15', 'Math'),
('27917199', 'Constance Odell', '45000.00', '2010-01-25', 'Math'),
('77735153', 'Stanley Haley', '48000.00', '2007-01-23', 'English'),
('16421971', 'Mandy Brownlow', '52000.00', '1999-03-02', 'Science'),
('71738964', 'Adena Addison', '40000.00', '2017-04-07', 'Math'),
('37996205', 'Victor Street', '50000.00', '2002-10-11', 'Social Studies');

/*Teaches Table Inserts*/
INSERT INTO TEACHES
(CourseID, FacultyID)
VALUES
('14020184', '16130625'),
('25830589', '27917199'),
('75230598', '77735153'),
('12365440', '16421971'),
('71024395', '71738964'),
('36540392', '37996205');

/*Takes Table Inserts*/
INSERT INTO TAKES
(StudentID, CourseID)
VALUES
('12345678', '25830589'),
('87654321', '14020184'),
('13579246', '12365440'),
('24681012', '71024395'),
('11111111', '36540392');

/*Class-Period Table Inserts*/
INSERT INTO CLASS_PERIOD
(CourseID, ClassPeriod)
VALUES
('14020184', '6'),
('25830589', '1'),
('75230598', '4'),
('12365440', '8'),
('71024395', '3'),
('36540392', '7');

/*Works Table Inserts*/
INSERT INTO WORKS
(School_Name, FacultyID)
VALUES
('Hickman', '16130625'),
('Rockbridge', '27917199'),
('Smithton', '77735153'),
('Hickman', '16421971'),
('Smithton', '71738964'),
('Battle', '37996205');
