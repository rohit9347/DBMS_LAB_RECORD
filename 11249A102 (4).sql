-- =============================================================================
-- EXPERIMENT NO: 4
-- TITLE: Creating a Database to Set Various Constraints in Oracle
-- STUDENT REGISTER NUMBER: 11249A228 (A228)
-- =============================================================================

-- Step 1: Create the DEPARTMENT Table with PRIMARY KEY
CREATE TABLE DEPARTMENT
(
    DEPT_ID NUMBER(3),
    DEPT_NAME VARCHAR2(30),
    CONSTRAINT PK_DEPT PRIMARY KEY (DEPT_ID)
);

-- Step 2: Create the EMPLOYEE Table with Various Constraints
CREATE TABLE EMPLOYEE
(
    EMP_ID NUMBER(5),
    EMP_NAME VARCHAR2(30) CONSTRAINT NN_EMPNAME NOT NULL,
    EMAIL VARCHAR2(50),
    SALARY NUMBER(8),
    DEPT_ID NUMBER(3),
    CONSTRAINT PK_EMP PRIMARY KEY (EMP_ID),
    CONSTRAINT UK_EMAIL UNIQUE (EMAIL),
    CONSTRAINT CK_SALARY CHECK (SALARY >= 10000),
    CONSTRAINT FK_DEPT FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID)
);

-- Step 3: Insert Records into DEPARTMENT
INSERT INTO DEPARTMENT VALUES (101, 'CSE');
INSERT INTO DEPARTMENT VALUES (102, 'ECE');
COMMIT;

-- Step 4: Insert Valid Records into EMPLOYEE
INSERT INTO EMPLOYEE VALUES (1001, 'ARUN', 'arun@gmail.com', 35000, 101);
INSERT INTO EMPLOYEE VALUES (1002, 'BALA', 'bala@gmail.com', 30000, 102);
COMMIT;

-- Testing Constraints:
-- 1. NOT NULL constraint test
-- INSERT INTO EMPLOYEE VALUES (1003, NULL, 'divya@gmail.com', 25000, 101);

-- 2. UNIQUE constraint test
-- INSERT INTO EMPLOYEE VALUES (1004, 'KAVI', 'arun@gmail.com', 28000, 101);

-- 3. CHECK constraint test
-- INSERT INTO EMPLOYEE VALUES (1005, 'RAVI', 'ravi@gmail.com', 8000, 101);

-- 4. FOREIGN KEY constraint test
-- INSERT INTO EMPLOYEE VALUES (1006, 'SURESH', 'suresh@gmail.com', 25000, 105);

-- 5. PRIMARY KEY constraint test
-- INSERT INTO EMPLOYEE VALUES (1001, 'MANOJ', 'manoj@gmail.com', 30000, 101);

-- Display Valid Records
SELECT * FROM EMPLOYEE;

-- Description of Tables
DESC DEPARTMENT;
DESC EMPLOYEE;
