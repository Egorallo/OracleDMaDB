CREATE OR REPLACE FUNCTION calculate_annual_compensation(
    p_monthly_salary IN NUMBER,
    p_annual_bonus_rate IN NUMBER
) RETURN NUMBER
IS
    v_annual_reward NUMBER;
BEGIN
    IF p_monthly_salary <= 0 OR p_annual_bonus_rate < 0 OR p_annual_bonus_rate > 100 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Incorrect input values');
    END IF;
    
    v_annual_reward := (1 + p_annual_bonus_rate / 100) * 12 * p_monthly_salary;
    
    RETURN v_annual_reward;
END;
/

DECLARE
    v_annual_reward NUMBER;
BEGIN
    v_annual_reward := calculate_annual_compensation(1000, 10);
    
    DBMS_OUTPUT.PUT_LINE('Total annual reward: ' || v_annual_reward);
END;
/


--CREATE OR REPLACE FUNCTION AB_FUNCSS (v_id NUMBER, v_val NUMBER) RETURN VARCHAR2
--IS
--v_count NUMBER;
--BEGIN
--    SELECT COUNT(*) INTO v_count FROM MyTable WHERE id = v_id;
--    IF v_count > 0 THEN
--        RAISE_APPLICATION_ERROR(-20002, 'Already exists');
--    ELSE 
--        RETURN 'INSERT INTO TABLE MyTable (id, val) VALUES (' || v_id || ', ' || v_val || ');';
--    END IF;
--        
--END;
--/
--
--DECLARE
--    v_answer VARCHAR2(100);
--BEGIN
--    v_answer:=AB_FUNCSS(11, 222);
--    DBMS_OUTPUT.PUT_LINE(v_answer);
--END;
