CREATE OR REPLACE FUNCTION check_even_odd
RETURN VARCHAR2
IS
    var_even_count NUMBER := 0;
    var_odd_count NUMBER := 0;
BEGIN
    SELECT COUNT(CASE WHEN MOD(val, 2) = 0 THEN 1 END),
           COUNT(CASE WHEN MOD(val, 2) <> 0 THEN 1 END)
    INTO var_even_count, var_odd_count
    FROM MyTable;

    IF var_even_count > var_odd_count THEN
        RETURN 'TRUE';
    ELSIF var_even_count < var_odd_count THEN
        RETURN 'FALSE';
    ELSE
        RETURN 'EQUAL';
    END IF;
END;
/

DECLARE
    v_result VARCHAR2(10);
BEGIN
    v_result := check_even_odd();

    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
END;
/

