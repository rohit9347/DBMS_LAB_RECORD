-- =============================================================================
-- EXPERIMENT NO: 10 (a)
-- TITLE: PL/SQL Block to Satisfy Conditions by Accepting Input from the User
-- STUDENT REGISTER NUMBER: 11249A228 (A228)
-- =============================================================================

SET SERVEROUTPUT ON;

DECLARE
    N NUMBER;
BEGIN
    N := &N;
    
    IF N > 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number is Positive');
    ELSIF N < 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number is Negative');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number is Zero');
    END IF;
END;
/
