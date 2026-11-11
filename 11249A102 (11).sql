-- =============================================================================
-- EXPERIMENT NO: 10 (b)
-- TITLE: PL/SQL Block to Handle Exceptions in Oracle
-- STUDENT REGISTER NUMBER: 11249A228 (A228)
-- =============================================================================

SET SERVEROUTPUT ON;

-- Program 1: Handling ZERO_DIVIDE Exception
DECLARE
    A NUMBER := 100;
    B NUMBER := 0;
    C NUMBER;
BEGIN
    C := A / B;
    DBMS_OUTPUT.PUT_LINE('Result = ' || C);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Division by Zero is not allowed.');
END;
/

-- Program 2: Handling NO_DATA_FOUND Exception
DECLARE
    V_NAME STUDENT.STUDENT_NAME%TYPE;
BEGIN
    SELECT STUDENT_NAME
    INTO V_NAME
    FROM STUDENT
    WHERE STUDENT_ID = 999;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No matching record found.');
END;
/

-- Program 3: Handling TOO_MANY_ROWS Exception
DECLARE
    V_NAME STUDENT.STUDENT_NAME%TYPE;
BEGIN
    SELECT STUDENT_NAME
    INTO V_NAME
    FROM STUDENT;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Error: Query returned multiple rows.');
END;
/

-- Program 4: Handling DUP_VAL_ON_INDEX Exception
BEGIN
    INSERT INTO STUDENT VALUES (101, 'BALA', 'ECE', 78);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Duplicate value violates unique constraint.');
END;
/

-- Program 5: Handling VALUE_ERROR Exception
DECLARE
    V_NUM NUMBER(2);
BEGIN
    V_NUM := 12345;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Value exceeds variable size.');
END;
/

-- Program 6: Using OTHERS Handler
DECLARE
    V_NUM NUMBER;
BEGIN
    V_NUM := 10 / 0;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;
/
