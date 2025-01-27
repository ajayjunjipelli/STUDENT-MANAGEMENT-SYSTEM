
# Student Database Management System

This project demonstrates the creation and management of a **Student Database Management System** using SQL. The system is designed to handle student records, course details, enrollments, grades, and student classifications, making data management systematic and insightful.

## Project Overview

The purpose of this project is to create a fully functional Student Database that tracks the following information:
- **Student Details** (name, gender, contact, admission year)
- **Courses** (course name, credits)
- **Enrollments** (students enrolled in specific courses)
- **Grades** (marks and letter grades for each student in each course)
- **Student Classification** (classifying students based on their grades)

## Key Features

- **Database Structure**: Multiple tables for storing and managing different aspects of student data:
  - **STUDENT**: Contains details of each student.
  - **COURSES**: Information about the courses offered.
  - **ENROLLMENTS**: Links students to courses they are enrolled in.
  - **GRADES**: Stores the grades of students in each course.
  - **STUDENT_CLASSIFICATION**: Classifies students based on their grades.

- **Dynamic Queries**: SQL queries to:
  - Retrieve lists of all students and courses.
  - Find students enrolled in specific courses.
  - Classify students based on their grades (e.g., "Top Student," "Good Student").

- **Student Performance Classification**: Classifies students into categories such as:
  - **Top Student** (Grade: A+)
  - **Good Student** (Grade: A)
  - **Average Student** (Grade: B+)
  - **Below Average** (Grade: B)
  - **Needs Improvement** (Any grade below B)

## Database Setup

1. **Create Database**:
   ```sql
   CREATE DATABASE Students;
   USE Students;
   ```

2. **Create Tables**:
   - **STUDENT**: Stores student details.
   - **COURSES**: Stores course information.
   - **ENROLLMENTS**: Links students and courses.
   - **GRADES**: Stores student grades in courses.
   - **STUDENT_CLASSIFICATION**: Classifies students based on their grades.

3. **Insert Data**:
   - Insert sample data for students, courses, enrollments, and grades.

## SQL Queries

- **Retrieve All Students**:
  ```sql
  SELECT * FROM STUDENT;
  ```

- **Retrieve All Courses**:
  ```sql
  SELECT * FROM COURSES;
  ```

- **Retrieve Students in a Specific Course**:
  ```sql
  SELECT student.student_name, student.contact, courses.course_name
  FROM student
  JOIN enrollments ON student.studentid = enrollments.studentid
  JOIN courses ON enrollments.courseid = courses.courseid
  WHERE courses.course_name = 'Database Management';
  ```

- **Classify Students Based on Grades**:
  ```sql
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
  ```

## Technologies Used

- **SQL**: Structured Query Language for managing the database and performing operations.
- **Database Management System**: SQL-based systems such as MySQL, PostgreSQL, or SQLite.


## Future Enhancements

- Track student attendance.
- Generate detailed academic reports.
- Integrate with a front-end application for easy access and management.
- Allow for advanced queries and reporting features for academic administrators.
