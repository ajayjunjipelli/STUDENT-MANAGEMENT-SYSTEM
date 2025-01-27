create database Students;
use  students;
CREATE TABLE STUDENT(
STUDENTID INT primary key,STUDENT_NAME VARCHAR(100),GENDER VARCHAR(100),CONTACT INT,ADMISSION_YEAR INT);

select * from STUDENT;

CREATE TABLE COURSES(
COURSEID INT primary key,COURSE_NAME VARCHAR(100),CREDITS INT);

select* from COURSES;

CREATE TABLE ENROLLMENTS(
ENROLLMENT_ID INT primary key,studentid int,courseid int,
foreign key (studentid) references student(studentid),
foreign key (courseid) references courses(courseid));

CREATE TABLE GRADES(
GRADEID INT,STUDENTID INT,COURSEID INT,MARKS INT,GRADE VARCHAR(20),
FOREIGN KEY (STUDENTID) REFERENCES STUDENT (STUDENTID),
FOREIGN KEY (COURSEID) REFERENCES COURSES (COURSEID));


INSERT INTO student (studentid, STUDENT_NAME, gender, contact, admission_year) VALUES
(1, 'Ajay', 'Male', 876543210, 2022);
(2, 'Abhishek', 'Male', 765432109, 2023),
(3, 'Madhu', 'Female',654321098, 2022),
(4, 'Priya', 'Female', 543210987, 2023),
(5, 'Vikram', 'Male', 432109876, 2022),
(6, 'Neha', 'Female', 321098765, 2023),
(7, 'Rahul', 'Male', 310987654, 2022),
(8, 'Swati', 'Female',109876543, 2023),
(9, 'Kiran', 'Male', 198765432, 2022),
(10, 'Divya', 'Female',988776655, 2023),
(11, 'Rohan', 'Male', 877665544, 2022),
(12, 'Pooja', 'Female',766554433, 2023),
(13, 'Suresh', 'Male', 655443322, 2022),
(14, 'Meena', 'Female',544332211, 2023),
(15, 'Yash', 'Male', 443221100, 2022),
(16, 'Nidhi', 'Female',322110099, 2023),
(17, 'Arjun', 'Male', 211009988, 2022),
(18, 'Sneha', 'Female',100998877, 2023),
(19, 'Varun', 'Male', 998887776, 2022),
(20, 'Anjali', 'Female',887776665, 2023),
(21, 'Karthik', 'Male', 776665554, 2022),
(22, 'Ritika', 'Female',665554443, 2023),
(23, 'Harish', 'Male', 554443332, 2022),
(24, 'Sonia', 'Female',443332221, 2023),
(25, 'Gopal', 'Male', 332221110, 2022),
(26, 'Lavanya', 'Female', 221110009, 2023),
(27, 'Mohan', 'Male', 111009998, 2022),
(28, 'Aditi', 'Female',000998887, 2023),
(29, 'Vishal', 'Male', 999887776, 2022),
(30, 'Preeti', 'Female', 887776665, 2023);

select * from STUDENT;

INSERT INTO courses (courseid, course_name, credits) VALUES
(101, 'Database Management', 4),
(102, 'Computer Networks', 3),
(103, 'Data Structures', 4),
(104, 'Artificial Intelligence', 3),
(105, 'Machine Learning', 4);

select * from COURSES;

INSERT INTO enrollments (enrollment_id, studentid, courseid) VALUES
(1, 1, 101), (2, 2, 102), (3, 3, 103), (4, 4, 104), (5, 5, 105),
(6, 6, 101), (7, 7, 102), (8, 8, 103), (9, 9, 104), (10, 10, 105),
(11, 11, 101), (12, 12, 102), (13, 13, 103), (14, 14, 104), (15, 15, 105),
(16, 16, 101), (17, 17, 102), (18, 18, 103), (19, 19, 104), (20, 20, 105),
(21, 21, 101), (22, 22, 102), (23, 23, 103), (24, 24, 104), (25, 25, 105),
(26, 26, 101), (27, 27, 102), (28, 28, 103), (29, 29, 104), (30, 30, 105);


INSERT INTO grades (gradeid, studentid, courseid, marks, grade) VALUES
(1, 1, 101, 97, 'A+'),(2, 2, 102, 88, 'A'),(3, 3, 103, 92, 'A'),(4, 4, 104, 68, 'C'),
(5, 5, 105, 76, 'B'),(6, 6, 101, 78, 'B'),(7, 7, 102, 90, 'A'),(8, 8, 103, 71, 'C+'),
(9, 9, 104, 60, 'D+'),(10, 10, 105, 96, 'A+'),(11, 11, 101, 82, 'B+'),
(12, 12, 102, 72, 'C+'),(13, 13, 103, 87, 'A'),(14, 14, 104, 38, 'F'),
(15, 15, 105, 93, 'A'),(16, 16, 101, 92, 'A'),(17, 17, 102, 77, 'B'),
(18, 18, 103, 89, 'A'),(19, 19, 104, 35, 'F'),(20, 20, 105, 98, 'A+'),
(21, 21, 101, 84, 'A'),(22, 22, 102, 28, 'F'),(23, 23, 103, 95, 'A+'),
(24, 24, 104, 52, 'D+'),(25, 25, 105, 91, 'A'),(26, 26, 101, 78, 'B'),
(27, 27, 102, 17, 'F'),(28, 28, 103, 72, 'C+'),(29, 29, 104, 31, 'F'),
(30, 30, 105, 36, 'F');

select * from GRADES;

--students in a specific course
SELECT student.student_name, student.contact, courses.course_name
FROM student
JOIN enrollments ON student.studentid = enrollments.studentid
JOIN courses ON enrollments.courseid = courses.courseid
WHERE courses.course_name = 'Database Management';

--Students Based on their grades
CREATE TABLE student_classification (
    studentid INT PRIMARY KEY,
    classification VARCHAR(20),
    FOREIGN KEY grades(studentid) REFERENCES student(studentid)
);

--updating  classification based on grades
INSERT INTO student_classification (studentid, classification)
SELECT student.studentid,
       CASE
           WHEN grades.grade = 'A+' THEN 'Top Student'
           WHEN grades.grade = 'A' THEN 'Good Student'
           WHEN grades.grade = 'B+' THEN 'Average Student'
           WHEN grades.grade = 'B' THEN 'Below Average'
           ELSE 'Needs Improvement'
       END AS classification
FROM student
JOIN grades ON student.studentid = grades.studentid;

select * from student_classification;