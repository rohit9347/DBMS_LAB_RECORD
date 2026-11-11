-- =============================================================================
-- EXPERIMENT NO: 7
-- TITLE: Creation of Views, Sequence, Indexes and Savepoint in Oracle
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

-- Step 2: Insert Records
INSERT INTO STUDENT VALUES (101, 'ARUN', 'CSE', 85);
INSERT INTO STUDENT VALUES (102, 'BALA', 'ECE', 78);
INSERT INTO STUDENT VALUES (103, 'DIVYA', 'IT', 92);
INSERT INTO STUDENT VALUES (104, 'KAVI', 'CSE', 88);
COMMIT;

-- VIEW: Step 3: Create View of CSE Students
CREATE VIEW CSE_STUDENTS AS
SELECT STUDENT_ID, STUDENT_NAME, MARKS
FROM STUDENT
WHERE DEPARTMENT = 'CSE';

-- Step 4: Retrieve Data from View
SELECT * FROM CSE_STUDENTS;

-- SEQUENCE: Step 5: Create Sequence
CREATE SEQUENCE STUD_SEQ
START WITH 105
INCREMENT BY 1
MINVALUE 105
MAXVALUE 999
NOCYCLE
NOCACHE;

-- Step 6: Generate Sequence Values
SELECT STUD_SEQ.NEXTVAL FROM DUAL;
SELECT STUD_SEQ.NEXTVAL FROM DUAL;

-- Step 7: Insert Using Sequence
INSERT INTO STUDENT VALUES (STUD_SEQ.NEXTVAL, 'RAVI', 'ECE', 81);
COMMIT;

SELECT * FROM STUDENT;

-- INDEX: Step 8: Create Index
CREATE INDEX IDX_STUDENT_NAME ON STUDENT(STUDENT_NAME);

SELECT INDEX_NAME, TABLE_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'STUDENT';

-- SAVEPOINT: Step 9: Create Savepoint
INSERT INTO STUDENT VALUES (108, 'SURESH', 'IT', 90);
SAVEPOINT SP1;

-- Step 10: Insert Another Record
INSERT INTO STUDENT VALUES (109, 'MANOJ', 'CSE', 87);

-- Step 11: Rollback to Savepoint
ROLLBACK TO SP1;

-- Step 12: Verify Records (Record 109 is removed)
SELECT * FROM STUDENT;

-- Step 13: Commit Transaction
COMMIT;
