-- =============================================================================
-- EXPERIMENT NO: 5
-- TITLE: Performing Queries Using ANY, ALL, IN, EXISTS, NOT EXISTS,
--        UNION, INTERSECT and Constraints in Oracle
-- STUDENT REGISTER NUMBER: 11249A228 (A228)
-- =============================================================================

-- Step 1: Create the STUDENT Table
CREATE TABLE STUDENT
(
    STUDENT_ID NUMBER(5) PRIMARY KEY,
    STUDENT_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    MARKS NUMBER(3)
);

-- Step 2: Insert Records into STUDENT
INSERT INTO STUDENT VALUES (101, 'ARUN', 'CSE', 85);
INSERT INTO STUDENT VALUES (102, 'BALA', 'ECE', 78);
INSERT INTO STUDENT VALUES (103, 'DIVYA', 'IT', 92);
INSERT INTO STUDENT VALUES (104, 'KAVI', 'CSE', 88);
COMMIT;

-- Step 3: Create the ALUMNI Table
CREATE TABLE ALUMNI
(
    STUDENT_NAME VARCHAR2(30)
);

-- Step 4: Insert Records into ALUMNI
INSERT INTO ALUMNI VALUES ('ARUN');
INSERT INTO ALUMNI VALUES ('RAVI');
INSERT INTO ALUMNI VALUES ('KAVI');
COMMIT;

-- Query Using IN: Display CSE and IT Students
SELECT * FROM STUDENT
WHERE DEPARTMENT IN ('CSE', 'IT');

-- Query Using ANY: Students scoring more than ANY ECE student
SELECT * FROM STUDENT
WHERE MARKS > ANY
(
    SELECT MARKS FROM STUDENT WHERE DEPARTMENT = 'ECE'
);

-- Query Using ALL: Students scoring more than ALL ECE students
SELECT * FROM STUDENT
WHERE MARKS > ALL
(
    SELECT MARKS FROM STUDENT WHERE DEPARTMENT = 'ECE'
);

-- Query Using EXISTS: Students who are also alumni
SELECT STUDENT_NAME
FROM STUDENT S
WHERE EXISTS
(
    SELECT * FROM ALUMNI A WHERE A.STUDENT_NAME = S.STUDENT_NAME
);

-- Query Using NOT EXISTS: Students not found in alumni
SELECT STUDENT_NAME
FROM STUDENT S
WHERE NOT EXISTS
(
    SELECT * FROM ALUMNI A WHERE A.STUDENT_NAME = S.STUDENT_NAME
);

-- Query Using UNION: Combine names from STUDENT and ALUMNI
SELECT STUDENT_NAME FROM STUDENT
UNION
SELECT STUDENT_NAME FROM ALUMNI;

-- Query Using INTERSECT: Display common names
SELECT STUDENT_NAME FROM STUDENT
INTERSECT
SELECT STUDENT_NAME FROM ALUMNI;
