-- =============================================================================
-- EXPERIMENT NO: 10 (c)
-- TITLE: Creation of Procedures and Functions in Oracle PL/SQL
-- STUDENT REGISTER NUMBER: 11249A228 (A228)
-- =============================================================================

SET SERVEROUTPUT ON;

-- Step 1 & 2: Setup Table and Sample Records
CREATE TABLE STUDENT
(
    STUDENT_ID NUMBER(5) PRIMARY KEY,
    STUDENT_NAME VARCHAR2(30),
    MARKS NUMBER(3)
);

INSERT INTO STUDENT VALUES (101, 'ARUN', 85);
INSERT INTO STUDENT VALUES (102, 'BALA', 72);
INSERT INTO STUDENT VALUES (103, 'DIVYA', 91);
COMMIT;

-- Step 3: Procedure to Display Student Details
CREATE OR REPLACE PROCEDURE GET_STUDENT
(
    P_ID IN NUMBER
)
IS
    V_NAME STUDENT.STUDENT_NAME%TYPE;
    V_MARKS STUDENT.MARKS%TYPE;
BEGIN
    SELECT STUDENT_NAME, MARKS
    INTO V_NAME, V_MARKS
    FROM STUDENT
    WHERE STUDENT_ID = P_ID;
    
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || V_NAME);
    DBMS_OUTPUT.PUT_LINE('Marks        : ' || V_MARKS);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student Record Not Found.');
END;
/

-- Step 4: Execute Procedure
EXEC GET_STUDENT(101);
EXEC GET_STUDENT(110);

-- Step 5: Function to Calculate Grade
CREATE OR REPLACE FUNCTION FIND_GRADE
(
    P_MARKS NUMBER
)
RETURN VARCHAR2
IS
    V_GRADE VARCHAR2(2);
BEGIN
    IF P_MARKS >= 90 THEN
        V_GRADE := 'O';
    ELSIF P_MARKS >= 80 THEN
        V_GRADE := 'A+';
    ELSIF P_MARKS >= 70 THEN
        V_GRADE := 'A';
    ELSIF P_MARKS >= 60 THEN
        V_GRADE := 'B';
    ELSE
        V_GRADE := 'C';
    END IF;
    RETURN V_GRADE;
END;
/

-- Step 6: Execute Function
SELECT FIND_GRADE(91) AS GRADE FROM DUAL;
SELECT FIND_GRADE(75) AS GRADE FROM DUAL;

-- Step 7: Use Function with Table Data
SELECT STUDENT_ID, STUDENT_NAME, MARKS, FIND_GRADE(MARKS) AS GRADE
FROM STUDENT;

-- Verify Objects
SELECT OBJECT_NAME, OBJECT_TYPE
FROM USER_OBJECTS
WHERE OBJECT_NAME IN ('GET_STUDENT', 'FIND_GRADE');
