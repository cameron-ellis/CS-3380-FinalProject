CREATE TABLE STUDENT (
    StudentID INTEGER PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    MiddleName VARCHAR(20),
    LastName VARCHAR(20) NOT NULL,
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

/*renamed this to Student_EC_Email*/
CREATE TABLE STUDENT_EC_EMAIL (
	StudentID INTEGER NOT NULL,
	EC_NAME VARCHAR(40) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID),
	FOREIGN KEY (EC_Name) REFERENCES student_emergency_contact (EC_Name)
	);


CREATE TABLE ACADEMIC_RECORD (
	StudentID INTEGER NOT NULL,
	Credits INTEGER NOT NULL, /*Changed this to NOT NULL since the table doesnt serve a purpose if it is null*/
	FOREIGN KEY (StudentID) REFERENCES student (StudentID)
	);
/*removed AR_StudentID from this table and Semester_GPA as per the TA grading */

CREATE TABLE SEMESTER_GPA (
	StudentID INTEGER NOT NULL,
	Semester VARCHAR(20),/*should one or both of these be not null?*/
	GPA FLOAT,/*should one or both of these be not null?*/
	FOREIGN KEY (StudentID) REFERENCES student (StudentID)
	);

CREATE TABLE CLUBS (
	Club_Name VARCHAR(30) NOT NULL,
	Club_School VARCHAR(30) NOT NULL, /*1:should this reference a school? 2:Changed this to be NOT NULL instead of PRIMARY KEY, because it can't be unqiue. primary key is club_name and club_School together*/
	Sponsor VARCHAR(40), /*should this reference a faculty member? */
	Leader VARCHAR(40), /* should this reference a student? */
	PRIMARY KEY(Club_Name,Club_School)
	);

CREATE TABLE JOINS (
	StudentID INTEGER NOT NULL,
	Club_Name VARCHAR(30) NOT NULL, /*this wasnt in our relations table but i think it should have been, added because it wouldn't make sense to just have the club_school listed when a student joins a club*/
	Club_School VARCHAR(30) NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES student (StudentID),
	FOREIGN KEY (Club_Name, Club_School) REFERENCES clubs (Club_Name, Club_School)
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
	FOREIGN KEY (CourseID) REFERENCES course (CourseID),
	FOREIGN KEY (FacultyID) REFERENCES faculty (FacultyID) /*missed this line in phase 2 relations, added back*/
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
/* I think we should remove this table
CREATE TABLE BELONGS (
	DepartmentHead VARCHAR(40) NOT NULL,
	FacultyID INTEGER NOT NULL,
	FOREIGN KEY (DepartmentHead) REFERENCES department (DepartmentHead),
	FOREIGN KEY (FacultyID) REFERENCES faculty (FacultyID)
	);*/

/*Student Table Inserts*/
INSERT INTO `student` (`StudentID`, `FirstName`, `MiddleName`, `LastName`, `DateOfBirth`, `GradeLevel`, `StudentEmail`) VALUES ('12345678', 'Joe', 'Owen', 'Jacob', '2002-05-02', '12', 'joejacob@gmail.com');
INSERT INTO `student` (`StudentID`, `FirstName`, `MiddleName`, `LastName`, `DateOfBirth`, `GradeLevel`, `StudentEmail`) VALUES ('87654321', 'Bill', 'Quinton', 'Smith', '2004-04-04', '10', 'Billqsmith123@gmail.com');
INSERT INTO `student` (`StudentID`, `FirstName`, `MiddleName`, `LastName`, `DateOfBirth`, `GradeLevel`, `StudentEmail`) VALUES ('13579246', 'Jill', 'Rorry', 'Brooks', '2003-03-03', '11', 'jillrbrooks@yahoo.com');
INSERT INTO `student` (`StudentID`, `FirstName`, `MiddleName`, `LastName`, `DateOfBirth`, `GradeLevel`, `StudentEmail`) VALUES ('24681012', 'Rachel', NULL, 'Brooks', '2008-01-01', '6', 'rrice@gmail.com');
INSERT INTO `student` (`StudentID`, `FirstName`, `MiddleName`, `LastName`, `DateOfBirth`, `GradeLevel`, `StudentEmail`) VALUES ('11111111', 'James', NULL, 'Kempf', NULL, NULL, NULL);

/*Student_Emergency_Contact Table Inserts*/
INSERT INTO `student_emergency_contact` (`StudentID`, `EC_Name`, `Relationship`) VALUES ('12345678', 'John Jacob', 'Father');
INSERT INTO `student_emergency_contact` (`StudentID`, `EC_Name`, `Relationship`) VALUES ('12345678', 'Joan Jacob', 'Mother');
INSERT INTO `student_emergency_contact` (`StudentID`, `EC_Name`, `Relationship`) VALUES ('24681012', 'June Rice', 'Aunt');
INSERT INTO `student_emergency_contact` (`StudentID`, `EC_Name`, `Relationship`) VALUES ('11111111', 'Larry Kempf', NULL);
INSERT INTO `student_emergency_contact` (`StudentID`, `EC_Name`, `Relationship`) VALUES ('87654321', 'Greg Smith', 'Grandfather');
INSERT INTO `student_emergency_contact` (`StudentID`, `EC_Name`, `Relationship`) VALUES ('13579246', 'Kim Brooks', 'Mother');

/*Emergency_Phone_Number Table Inserts*/
INSERT INTO `emergency_phone_number` (`StudentID`, `EC_Name`, `EC_Phone`) VALUES ('12345678', 'John Jacob', '(365) 874-7898');
INSERT INTO `emergency_phone_number` (`StudentID`, `EC_Name`, `EC_Phone`) VALUES ('12345678', 'Joan Jacob', '(356) 302-7148');
INSERT INTO `emergency_phone_number` (`StudentID`, `EC_Name`, `EC_Phone`) VALUES ('87654321', 'Greg Smith', '(346) 554-8271');
INSERT INTO `emergency_phone_number` (`StudentID`, `EC_Name`, `EC_Phone`) VALUES ('13579246', 'Kim Brooks', '(735) 607-3186');
INSERT INTO `emergency_phone_number` (`StudentID`, `EC_Name`, `EC_Phone`) VALUES ('24681012', 'June Rice', '(313) 682-5971');
INSERT INTO `emergency_phone_number` (`StudentID`, `EC_Name`, `EC_Phone`) VALUES ('11111111', 'Larry Kempf', '(443) 785-6921');

/*Student_EC_Email Table Inserts*/
INSERT INTO `student_ec_email` (`StudentID`, `EC_NAME`, `Email`) VALUES ('12345678', 'John Jacob', 'John1234@gmail.com');
INSERT INTO `student_ec_email` (`StudentID`, `EC_NAME`, `Email`) VALUES ('12345678', 'Joan Jacob', 'Joanjacob894@yahoo.com');
INSERT INTO `student_ec_email` (`StudentID`, `EC_NAME`, `Email`) VALUES ('87654321', 'Greg Smith', 'gregorysmith@hotmail.com');
INSERT INTO `student_ec_email` (`StudentID`, `EC_NAME`, `Email`) VALUES ('13579246', 'Kim Brooks', 'Kbrooks@protonmail.com');
INSERT INTO `student_ec_email` (`StudentID`, `EC_NAME`, `Email`) VALUES ('24681012', 'June Rice', 'jrice@gmail.com');
INSERT INTO `student_ec_email` (`StudentID`, `EC_NAME`, `Email`) VALUES ('11111111', 'Larry Kempf', 'KempfCo@gmail.com');

/*Academic_Record Table Inserts*/
INSERT INTO `academic_record` (`StudentID`, `Credits`) VALUES ('12345678', '110');
INSERT INTO `academic_record` (`StudentID`, `Credits`) VALUES ('87654321', '50');
INSERT INTO `academic_record` (`StudentID`, `Credits`) VALUES ('13579246', '70');
INSERT INTO `academic_record` (`StudentID`, `Credits`) VALUES ('24681012', '36');
INSERT INTO `academic_record` (`StudentID`, `Credits`) VALUES ('11111111', '0');

/*Semester_GPA Table Inserts*/
INSERT INTO `semester_gpa` (`StudentID`, `Semester`, `GPA`) VALUES ('12345678', 'Spring 2020', '4.0');
INSERT INTO `semester_gpa` (`StudentID`, `Semester`, `GPA`) VALUES ('87654321', 'Spring 2020', '3.6');
INSERT INTO `semester_gpa` (`StudentID`, `Semester`, `GPA`) VALUES ('13579246', 'Fall 2019', '3.0');
INSERT INTO `semester_gpa` (`StudentID`, `Semester`, `GPA`) VALUES ('24681012', 'Fall 2019', '2.5');
INSERT INTO `semester_gpa` (`StudentID`, `Semester`, `GPA`) VALUES ('11111111', 'Spring 2018', '1.0');

/*Clubs Table Inserts*/
INSERT INTO `clubs` (`Club_Name`, `Club_School`, `Sponsor`, `Leader`) VALUES ('Chess Club', 'Smithton', 'Ruthie Maxene', 'Sammi Aiden');
INSERT INTO `clubs` (`Club_Name`, `Club_School`, `Sponsor`, `Leader`) VALUES ('Robotics', 'Hickman', 'Vicky Laney', 'Zachery Adella');
INSERT INTO `clubs` (`Club_Name`, `Club_School`, `Sponsor`, `Leader`) VALUES ('Choir', 'Rockbridge', 'Derick Andy', 'Jill Brooks');
INSERT INTO `clubs` (`Club_Name`, `Club_School`, `Sponsor`, `Leader`) VALUES ('Baseball', 'Battle', 'Merry Sanford', 'Joe Jacob');
INSERT INTO `clubs` (`Club_Name`, `Club_School`, `Sponsor`, `Leader`) VALUES ('Chess Club', 'Hickman', NULL, NULL);

/*Joins Table Inserts*/
INSERT INTO `joins` (`StudentID`, `Club_Name`, `Club_School`) VALUES ('24681012', 'Chess Club', 'Smithton');
INSERT INTO `joins` (`StudentID`, `Club_Name`, `Club_School`) VALUES ('87654321', 'Chess Club', 'Hickman');
INSERT INTO `joins` (`StudentID`, `Club_Name`, `Club_School`) VALUES ('13579246', 'Robotics', 'Hickman');
INSERT INTO `joins` (`StudentID`, `Club_Name`, `Club_School`) VALUES ('12345678', 'Choir', 'Rockbridge');
INSERT INTO `joins` (`StudentID`, `Club_Name`, `Club_School`) VALUES ('11111111', 'Baseball', 'Battle');
INSERT INTO `joins` (`StudentID`, `Club_Name`, `Club_School`) VALUES ('13579246', 'Chess Club', 'Hickman');

/*School Table Inserts*/
INSERT INTO `school` (`Address`, `Name`, `PhoneNumber`) VALUES ('1104 N Providence Rd, Columbia, MO 65203', 'Hickman', '(573) 214-3000');
INSERT INTO `school` (`Address`, `Name`, `PhoneNumber`) VALUES ('4303 S Providence Rd #7198, Columbia, MO 65203', 'Rockbridge', '(573) 214-3100');
INSERT INTO `school` (`Address`, `Name`, `PhoneNumber`) VALUES ('7575 E St Charles Rd, Columbia, MO 65202', 'Battle', '(573) 214-3300');
INSERT INTO `school` (`Address`, `Name`, `PhoneNumber`) VALUES ('3600 W Worley St, Columbia, MO 65203', 'Smithton', '(573) 214-3260');

/*Attends Table Inserts*/
INSERT INTO `attends` (`StudentID`, `Address`) VALUES ('12345678', '4303 S Providence Rd #7198, Columbia, MO 65203');
INSERT INTO `attends` (`StudentID`, `Address`) VALUES ('87654321', '1104 N Providence Rd, Columbia, MO 65203');
INSERT INTO `attends` (`StudentID`, `Address`) VALUES ('13579246', '1104 N Providence Rd, Columbia, MO 65203');
INSERT INTO `attends` (`StudentID`, `Address`) VALUES ('24681012', '3600 W Worley St, Columbia, MO 65203');
INSERT INTO `attends` (`StudentID`, `Address`) VALUES ('11111111', '7575 E St Charles Rd, Columbia, MO 65202');

/*Course Table Inserts*/
INSERT INTO `course` (`CourseID`, `CourseName`, `RoomNumber`, `Course_School`, `CreditHours`) VALUES ('14020184', 'Calculus', '5', 'Hickman', '5');
INSERT INTO `course` (`CourseID`, `CourseName`, `RoomNumber`, `Course_School`, `CreditHours`) VALUES ('25830589', 'Calculus', '6', 'Smithton', '3');
INSERT INTO `course` (`CourseID`, `CourseName`, `RoomNumber`, `Course_School`, `CreditHours`) VALUES ('75230598', 'English', '1', 'Smithton', '3');
INSERT INTO `course` (`CourseID`, `CourseName`, `RoomNumber`, `Course_School`, `CreditHours`) VALUES ('12365440', 'Chemistry', '3', 'Hickman', '4');
INSERT INTO `course` (`CourseID`, `CourseName`, `RoomNumber`, `Course_School`, `CreditHours`) VALUES ('71024395', 'Algebra', '1', 'Smithton', '3');
INSERT INTO `course` (`CourseID`, `CourseName`, `RoomNumber`, `Course_School`, `CreditHours`) VALUES ('36540392', 'US History', '2', 'Battle', '4');

/*Teaches Table Inserts*/
INSERT INTO `teaches` (`CourseID`, `FacultyID`) VALUES ('14020184', '16130625');
INSERT INTO `teaches` (`CourseID`, `FacultyID`) VALUES ('25830589', '27917199');
INSERT INTO `teaches` (`CourseID`, `FacultyID`) VALUES ('75230598', '77735153');
INSERT INTO `teaches` (`CourseID`, `FacultyID`) VALUES ('12365440', '16421971');
INSERT INTO `teaches` (`CourseID`, `FacultyID`) VALUES ('71024395', '71738964');
INSERT INTO `teaches` (`CourseID`, `FacultyID`) VALUES ('36540392', '37996205');

/*Takes Table Inserts*/
INSERT INTO `takes` (`StudentID`, `CourseID`) VALUES ('12345678', '25830589');
INSERT INTO `takes` (`StudentID`, `CourseID`) VALUES ('87654321', '14020184');
INSERT INTO `takes` (`StudentID`, `CourseID`) VALUES ('13579246', '12365440');
INSERT INTO `takes` (`StudentID`, `CourseID`) VALUES ('24681012', '71024395');
INSERT INTO `takes` (`StudentID`, `CourseID`) VALUES ('11111111', '36540392');

/*Class-Period Table Inserts*/
INSERT INTO `class_period` (`CourseID`, `ClassPeriod`) VALUES ('14020184', '6');
INSERT INTO `class_period` (`CourseID`, `ClassPeriod`) VALUES ('25830589', '1');
INSERT INTO `class_period` (`CourseID`, `ClassPeriod`) VALUES ('75230598', '4');
INSERT INTO `class_period` (`CourseID`, `ClassPeriod`) VALUES ('12365440', '8');
INSERT INTO `class_period` (`CourseID`, `ClassPeriod`) VALUES ('71024395', '3');
INSERT INTO `class_period` (`CourseID`, `ClassPeriod`) VALUES ('36540392', '7');

/*Faculty Table Inserts*/
INSERT INTO `faculty` (`FacultyID`, `Faculty_Name`, `Salary`, `StartDate`) VALUES ('16130625', 'Ruthie Maxene', '60000.00', '1990-06-15');
INSERT INTO `faculty` (`FacultyID`, `Faculty_Name`, `Salary`, `StartDate`) VALUES ('27917199', 'Constance Odell', '45000.00', '2010-01-25');
INSERT INTO `faculty` (`FacultyID`, `Faculty_Name`, `Salary`, `StartDate`) VALUES ('77735153', 'Stanley Haley', '48000.00', '2007-01-23');
INSERT INTO `faculty` (`FacultyID`, `Faculty_Name`, `Salary`, `StartDate`) VALUES ('16421971', 'Mandy Brownlow', '52000.00', '1999-03-02');
INSERT INTO `faculty` (`FacultyID`, `Faculty_Name`, `Salary`, `StartDate`) VALUES ('71738964', 'Adena Addison', '40000.00', '2017-04-07');
INSERT INTO `faculty` (`FacultyID`, `Faculty_Name`, `Salary`, `StartDate`) VALUES ('37996205', 'Victor Street', '50000.00', '2002-10-11');

/*Works Table Inserts*/
INSERT INTO `works` (`Address`, `FacultyID`) VALUES ('1104 N Providence Rd, Columbia, MO 65203', '16130625');
INSERT INTO `works` (`Address`, `FacultyID`) VALUES ('4303 S Providence Rd #7198, Columbia, MO 65203', '27917199');
INSERT INTO `works` (`Address`, `FacultyID`) VALUES ('3600 W Worley St, Columbia, MO 65203', '77735153');
INSERT INTO `works` (`Address`, `FacultyID`) VALUES ('1104 N Providence Rd, Columbia, MO 65203', '16421971');
INSERT INTO `works` (`Address`, `FacultyID`) VALUES ('3600 W Worley St, Columbia, MO 65203', '71738964');
INSERT INTO `works` (`Address`, `FacultyID`) VALUES ('7575 E St Charles Rd, Columbia, MO 65202', '37996205');

/*Department Table Inserts*/
INSERT INTO `department` (`DepartmentHead`, `Subject`) VALUES ('Ruthie Maxene', 'Math');
INSERT INTO `department` (`DepartmentHead`, `Subject`) VALUES ('Stanley Haley', 'English');
INSERT INTO `department` (`DepartmentHead`, `Subject`) VALUES ('Victor Street', 'Social Studies');
INSERT INTO `department` (`DepartmentHead`, `Subject`) VALUES ('Constance Odell', 'Math');
INSERT INTO `department` (`DepartmentHead`, `Subject`) VALUES ('Mandy Brownlow', 'Science');

/*Admins Table Inserts*/
INSERT INTO `admins` (`Address`, `DepartmentHead`) VALUES ('1104 N Providence Rd, Columbia, MO 65203', 'Ruthie Maxene');
INSERT INTO `admins` (`Address`, `DepartmentHead`) VALUES ('3600 W Worley St, Columbia, MO 65203', 'Stanley Haley');
INSERT INTO `admins` (`Address`, `DepartmentHead`) VALUES ('7575 E St Charles Rd, Columbia, MO 65202', 'Victor Street');
INSERT INTO `admins` (`Address`, `DepartmentHead`) VALUES ('4303 S Providence Rd #7198, Columbia, MO 65203', 'Constance Odell');
INSERT INTO `admins` (`Address`, `DepartmentHead`) VALUES ('1104 N Providence Rd, Columbia, MO 65203', 'Mandy Brownlow');

/*Department_Head Table Inserts*/
INSERT INTO `department_head` (`DepartmentHead`, `FacultyID`, `DH_StartDate`) VALUES ('Ruthie Maxene', '16130625', '1998-01-23');
INSERT INTO `department_head` (`DepartmentHead`, `FacultyID`, `DH_StartDate`) VALUES ('Stanley Haley', '77735153', '2012-01-23');
INSERT INTO `department_head` (`DepartmentHead`, `FacultyID`, `DH_StartDate`) VALUES ('Victor Street', '37996205', '2009-01-23');
INSERT INTO `department_head` (`DepartmentHead`, `FacultyID`, `DH_StartDate`) VALUES ('Constance Odell', '27917199', '2015-01-23');
INSERT INTO `department_head` (`DepartmentHead`, `FacultyID`, `DH_StartDate`) VALUES ('Mandy Brownlow', '16421971', '2006-01-23');









