CREATE DATABASE universityDB;
USE universityDB;
CREATE TABLE Course (
    CourseCode VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(100),
  
Department VARCHAR(100)
);
CREATE TABLE Department (
    DeptNo INT PRIMARY KEY,
    DeptName VARCHAR(100),
    Location VARCHAR(100),
    ManagerStaffNo INT,
    PhoneNumber VARCHAR(15),
    FaxNumber VARCHAR(15)
);
CREATE TABLE Staff (
    StaffNo INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Sex CHAR(1),
    PhoneExtension VARCHAR(10),
    OfficeNo VARCHAR(20),
    Salary DECIMAL(10, 2),
    Post VARCHAR(50),
    Qualifications VARCHAR(200),
    DeptNo INT,
    FOREIGN KEY (DeptNo) REFERENCES Department(DeptNo)
);
CREATE TABLE Student (
    MatricNo VARCHAR(20) PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Sex CHAR(1),
    DOB DATE,
    Address VARCHAR(255),
    CourseCode VARCHAR(10),
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode)
);CREATE TABLE Module (
    ModuleCode VARCHAR(10) PRIMARY KEY,
    ModuleName VARCHAR(100),
    CourseCode VARCHAR(10),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode)
);
CREATE TABLE Performance (
    MatricNo VARCHAR(20),
    ModuleCode VARCHAR(10),
    Performance VARCHAR(10),
    PRIMARY KEY (MatricNo, ModuleCode),
    FOREIGN KEY (MatricNo) REFERENCES Student(MatricNo),
    FOREIGN KEY (ModuleCode) REFERENCES Module(ModuleCode)
);
INSERT INTO Course (CourseCode, CourseName, Department)
VALUES
    ('CS101', 'Computer Science', 'CIS'),
    ('CS102', 'Software Engineering', 'CIS'),
    ('CS103', 'Data Science', 'CIS');
INSERT INTO Department (DeptNo, DeptName, Location, ManagerStaffNo, PhoneNumber, FaxNumber)
VALUES
    (1, 'CIS', 'E Block', 101, '1234567890', '1234567891'),
    (2, 'EEE', 'F Block', 102, '0987654321', '0987654322');
INSERT INTO Staff (StaffNo, FirstName, LastName, Sex, PhoneExtension, OfficeNo, Salary, Post, Qualifications, DeptNo)
VALUES
    (101, 'John', 'Doe', 'M', '101', 'B101', 55000.00, 'Professor', 'PhD in CS', 1),
    (102, 'Jane', 'Smith', 'F', '102', 'B102', 60000.00, 'Senior Lecturer', 'PhD in CS', 1);
    INSERT INTO Student (MatricNo, FirstName, LastName, Sex, DOB, Address, CourseCode)
VALUES
    ('00/5021', 'Alice', 'Mcleod', 'F', '2000-01-01', '6 Lady Lane, Paisley', 'CS101'),
    ('00/4647', 'John', 'Smith', 'M', '2001-02-01', '28 New Str, Paisley', 'CS102');
    INSERT INTO Module (ModuleCode, ModuleName, CourseCode, StartDate, EndDate)
VALUES
    ('CS10101', 'Introduction to CS', 'CS101', '2023-09-01', '2023-12-01'),
    ('CS10201', 'Software Engineering', 'CS102', '2023-09-01', '2023-12-01');
    INSERT INTO Performance (MatricNo, ModuleCode, Performance)
VALUES
    ('00/5021', 'CS10101', 'Pass'),
    ('00/4647', 'CS10201', 'Fail');