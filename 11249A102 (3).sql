-- =============================================================================
-- EXPERIMENT NO: 3
-- TITLE: Practicing DCL and TCL Commands in Oracle
-- STUDENT REGISTER NUMBER: 11249A228 (A228)
-- =============================================================================

-- Step 1: Create the EMPLOYEE Table
CREATE TABLE EMPLOYEE
(
    EMP_ID NUMBER(5) PRIMARY KEY,
    EMP_NAME VARCHAR2(30),
    SALARY NUMBER(8)
);

-- Step 2: Insert Initial Records
INSERT INTO EMPLOYEE VALUES (101, 'ARUN', 35000);
INSERT INTO EMPLOYEE VALUES (102, 'BALA', 40000);
COMMIT;

-- DCL Commands (Data Control Language)
-- Step 3: Grant SELECT privilege to SCOTT
GRANT SELECT ON EMPLOYEE TO SCOTT;

-- Step 4: Grant Multiple Privileges to SCOTT
GRANT SELECT, INSERT, UPDATE ON EMPLOYEE TO SCOTT;

-- Step 5: Revoke INSERT privilege from SCOTT
REVOKE INSERT ON EMPLOYEE FROM SCOTT;

-- TCL Commands (Transaction Control Language)
-- Step 6: Insert a new record and commit
INSERT INTO EMPLOYEE VALUES (103, 'DIVYA', 45000);
COMMIT;

-- Step 7: Insert another record and create a savepoint
INSERT INTO EMPLOYEE VALUES (104, 'KAVI', 42000);
SAVEPOINT SP1;

-- Step 8: Insert an additional record
INSERT INTO EMPLOYEE VALUES (105, 'RAVI', 38000);

-- Step 9: Roll back to savepoint SP1
ROLLBACK TO SP1;

-- Step 10: Verify the records (Record 105 is undone)
SELECT * FROM EMPLOYEE;

-- Step 11: Complete the transaction
COMMIT;
