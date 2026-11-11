-- =============================================================================
-- EXPERIMENT NO: 1
-- TITLE: Creation of a Database and Writing SQL Queries to Retrieve Information
--        from the Database (Oracle)
-- STUDENT REGISTER NUMBER: 11249A228 (A228)
-- =============================================================================

-- Step 1: Create the STUDENT Table
CREATE TABLE STUDENT
(
    STUDENT_ID NUMBER(5) PRIMARY KEY,
    STUDENT_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    AGE NUMBER(2),
    MARKS NUMBER(3)
);

-- Step 2: Insert Records into the STUDENT Table
INSERT INTO STUDENT VALUES (101, 'ARUN', 'CSE', 20, 85);
INSERT INTO STUDENT VALUES (102, 'BALA', 'ECE', 21, 78);
INSERT INTO STUDENT VALUES (103, 'KAVI', 'CSE', 20, 92);
INSERT INTO STUDENT VALUES (104, 'DIVYA', 'IT', 21, 88);
COMMIT;

-- Step 3: Display All Records
SELECT * FROM STUDENT;

-- Step 4: Display Student Name and Marks
SELECT STUDENT_NAME, MARKS
FROM STUDENT;

-- Step 5: Retrieve CSE Students
SELECT *
FROM STUDENT
WHERE DEPARTMENT = 'CSE';

-- Step 6: Retrieve Students Scoring More Than 80 Marks
SELECT STUDENT_NAME, MARKS
FROM STUDENT
WHERE MARKS > 80;
