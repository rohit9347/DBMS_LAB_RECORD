-- =============================================================================
-- EXPERIMENT NO: 10 (e)
-- TITLE: Creation of Database Operations with Implicit and Explicit Cursors
-- STUDENT REGISTER NUMBER: 11249A228 (A228)
-- =============================================================================

SET SERVEROUTPUT ON;

-- Step 1 & 2: Create and Populate Table
CREATE TABLE EMPLOYEE
(
    EMP_ID NUMBER(5) PRIMARY KEY,
    EMP_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER(8)
);

INSERT INTO EMPLOYEE VALUES (101, 'ARUN', 'CSE', 35000);
INSERT INTO EMPLOYEE VALUES (102, 'BALA', 'ECE', 32000);
INSERT INTO EMPLOYEE VALUES (103, 'DIVYA', 'IT', 45000);
INSERT INTO EMPLOYEE VALUES (104, 'KAVI', 'CSE', 40000);
COMMIT;

-- Part A: Implicit Cursor
BEGIN
    UPDATE EMPLOYEE
    SET SALARY = SALARY + 5000
    WHERE DEPARTMENT = 'CSE';
    
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' row(s) updated.');
    COMMIT;
END;
/

SELECT * FROM EMPLOYEE;

-- Part B: Explicit Cursor
DECLARE
    CURSOR EMP_CURSOR IS
        SELECT EMP_ID, EMP_NAME, DEPARTMENT, SALARY
        FROM EMPLOYEE;
    V_ID   EMPLOYEE.EMP_ID%TYPE;
    V_NAME EMPLOYEE.EMP_NAME%TYPE;
    V_DEPT EMPLOYEE.DEPARTMENT%TYPE;
    V_SAL  EMPLOYEE.SALARY%TYPE;
BEGIN
    OPEN EMP_CURSOR;
    LOOP
        FETCH EMP_CURSOR INTO V_ID, V_NAME, V_DEPT, V_SAL;
        EXIT WHEN EMP_CURSOR%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(V_ID || ' ' || V_NAME || ' ' || V_DEPT || ' ' || V_SAL);
    END LOOP;
    CLOSE EMP_CURSOR;
END;
/

-- Cursor FOR Loop
DECLARE
    CURSOR EMP_CURSOR IS
        SELECT EMP_ID, EMP_NAME, SALARY
        FROM EMPLOYEE;
BEGIN
    FOR EMP_REC IN EMP_CURSOR LOOP
        DBMS_OUTPUT.PUT_LINE(EMP_REC.EMP_ID || ' ' || EMP_REC.EMP_NAME || ' ' || EMP_REC.SALARY);
    END LOOP;
END;
/
