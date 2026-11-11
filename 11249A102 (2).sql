-- =============================================================================
-- EXPERIMENT NO: 2
-- TITLE: Performing Insertion, Deletion, Modifying, Altering, Updating and
--        Viewing Records Based on Conditions (Oracle)
-- STUDENT REGISTER NUMBER: 11249A228 (A228)
-- =============================================================================

-- Step 1: Create the EMPLOYEE Table
CREATE TABLE EMPLOYEE
(
    EMP_ID NUMBER(5) PRIMARY KEY,
    EMP_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER(8),
    CITY VARCHAR2(20)
);

-- Step 2: Insert Records
INSERT INTO EMPLOYEE VALUES (101, 'ARUN', 'CSE', 35000, 'CHENNAI');
INSERT INTO EMPLOYEE VALUES (102, 'BALA', 'ECE', 32000, 'VELLORE');
INSERT INTO EMPLOYEE VALUES (103, 'DIVYA', 'IT', 40000, 'KANCHIPURAM');
INSERT INTO EMPLOYEE VALUES (104, 'KAVI', 'CSE', 38000, 'CHENNAI');
COMMIT;

-- Step 3: View All Records
SELECT * FROM EMPLOYEE;

-- Step 4: Update Records Based on a Condition (Increase salary of EMP_ID 102)
UPDATE EMPLOYEE
SET SALARY = 35000
WHERE EMP_ID = 102;
COMMIT;

SELECT * FROM EMPLOYEE WHERE EMP_ID = 102;

-- Step 5: Delete Records Based on a Condition (Delete IT department employee)
DELETE FROM EMPLOYEE
WHERE DEPARTMENT = 'IT';
COMMIT;

SELECT * FROM EMPLOYEE;

-- Step 6: Alter Table Structure (Add EMAIL column)
ALTER TABLE EMPLOYEE
ADD EMAIL VARCHAR2(40);

DESC EMPLOYEE;

-- Step 7: Modify Column Size
ALTER TABLE EMPLOYEE
MODIFY EMP_NAME VARCHAR2(50);

-- Step 8: View Records Based on Conditions
-- Employees in CSE Department
SELECT * FROM EMPLOYEE WHERE DEPARTMENT = 'CSE';

-- Employees with salary greater than 35000
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY > 35000;

-- Employees based in Chennai
SELECT EMP_NAME, CITY FROM EMPLOYEE WHERE CITY = 'CHENNAI';
