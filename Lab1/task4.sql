CREATE OR REPLACE FUNCTION generate_insert_command(
    p_id IN NUMBER,
    p_val IN NUMBER
) RETURN VARCHAR2
IS
    v_insert_command VARCHAR2(1000);
BEGIN
    v_insert_command := 'INSERT INTO MyTable (id, val) VALUES (' || p_id || ', ' || p_val || ');';

    DBMS_OUTPUT.PUT_LINE(v_insert_command);

    RETURN v_insert_command;
END;
/

DECLARE
    v_insert_cmd VARCHAR2(1000);
BEGIN
    v_insert_cmd := generate_insert_command(120, 222);
END;
/


DROP TABLE MyTable;
/