CREATE TABLE STUDENTS_LOG (
    LOG_ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    ACTION_TYPE VARCHAR2(10),
    OLD_STUDENT_ID NUMBER,
    NEW_STUDENT_ID NUMBER,
    OLD_NAME VARCHAR2(100),
    NEW_NAME VARCHAR2(100),
    OLD_GROUP_ID NUMBER,
    NEW_GROUP_ID NUMBER,
    ACTION_DATE TIMESTAMP
);
/

CREATE OR REPLACE TRIGGER trigger_students_logging
AFTER INSERT OR UPDATE OR DELETE ON STUDENTS
FOR EACH ROW
DECLARE
    v_action_type VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_action_type := 'INSERT';
        
        INSERT INTO STUDENTS_LOG (ACTION_TYPE, NEW_STUDENT_ID, NEW_NAME, NEW_GROUP_ID, ACTION_DATE)
        VALUES (v_action_type, :NEW.ID, :NEW.NAME, :NEW.GROUP_ID, SYSTIMESTAMP);
    ELSIF UPDATING THEN
        v_action_type := 'UPDATE';
        
        INSERT INTO STUDENTS_LOG (ACTION_TYPE, OLD_STUDENT_ID, NEW_STUDENT_ID, OLD_NAME, NEW_NAME, OLD_GROUP_ID, NEW_GROUP_ID, ACTION_DATE)
        VALUES (v_action_type, :OLD.ID, :NEW.ID, :OLD.NAME, :NEW.NAME, :OLD.GROUP_ID, :NEW.GROUP_ID, SYSTIMESTAMP);
    ELSIF DELETING THEN
        v_action_type := 'DELETE';
        
        INSERT INTO STUDENTS_LOG (ACTION_TYPE, OLD_STUDENT_ID, OLD_NAME, OLD_GROUP_ID, ACTION_DATE)
        VALUES (v_action_type, :OLD.ID, :OLD.NAME, :OLD.GROUP_ID, SYSTIMESTAMP);
    END IF;
END;
/

INSERT INTO GROUPS (name, c_val) VALUES ('RED', 30);
INSERT INTO GROUPS (name, c_val) VALUES ('GREEN', 25);

INSERT INTO STUDENTS (id, name, group_id) VALUES (1, 'Joe', 1);
INSERT INTO STUDENTS (name, group_id) VALUES ('Mark', 1);
INSERT INTO STUDENTS (name, group_id) VALUES ('Cobe', 2);
INSERT INTO STUDENTS (name, group_id) VALUES ('Amogus', 2);

UPDATE STUDENTS
SET NAME = 'Boba', GROUP_ID = 2
WHERE ID = 1;

DELETE FROM STUDENTS
WHERE ID = 1;

SELECT * FROM GROUPS;
SELECT * FROM STUDENTS;
SELECT * FROM STUDENTS_LOG;
DELETE FROM STUDENTS;