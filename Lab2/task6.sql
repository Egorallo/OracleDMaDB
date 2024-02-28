CREATE OR REPLACE TRIGGER trigger_update_c_val
AFTER INSERT OR UPDATE OR DELETE ON STUDENTS
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE GROUPS
        SET C_VAL = C_VAL +1
        WHERE ID = :NEW.GROUP_ID;
    END IF;
    
    IF UPDATING THEN
        UPDATE GROUPS
        SET C_VAL = C_VAL + 1
        WHERE ID = :NEW.GROUP_ID;
        
        UPDATE GROUPS
        SET C_VAL = C_VAL - 1
        WHERE ID = :OLD.GROUP_ID;
    END IF;
    
    IF DELETING THEN
        UPDATE GROUPS
        SET C_VAL = C_VAL - 1
        WHERE ID = :OLD.GROUP_ID;
    END IF;
END;
/

--DROP TRIGGER trigger_update_c_val;
--
--SELECT * FROM GROUPS;
--SELECT * FROM STUDENTS;
--SELECT * FROM STUDENTS_LOG;
--
--DELETE FROM STUDENTS;
--DELETE FROM STUDENTS_LOG;
--
--UPDATE STUDENTS
--SET GROUP_ID = 2
--WHERE ID = 3;
--
--INSERT INTO STUDENTS (name, group_id) VALUES ('TANK', 1);
--DELETE FROM STUDENTS WHERE NAME = 'Amogus';
--
--DELETE FROM STUDENTS_LOG
--WHERE LOG_ID = 38;