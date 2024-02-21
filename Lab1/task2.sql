DECLARE
    var_id NUMBER;
    var_val NUMBER;
BEGIN
    FOR i IN 1..10 LOOP
        var_id := i;
        var_val := ROUND(DBMS_RANDOM.VALUE(1, 10000));

        INSERT INTO MyTable (id, val) VALUES (var_id, var_val);
    END LOOP;
END;