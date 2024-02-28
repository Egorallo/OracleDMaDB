CREATE OR REPLACE TRIGGER trigger_cascade_deletion
AFTER DELETE ON GROUPS
FOR EACH ROW
BEGIN

    
    DELETE FROM STUDENTS
    WHERE GROUP_ID = :OLD.ID;


END;
/

DROP TRIGGER trigger_cascade_deletion;
/
--SELECT * FROM GROUPS;
--SELECT * FROM STUDENTS;

--DELETE FROM GROUPS
--WHERE NAME = 'RED';

--DELETE FROM GROUPS;
--DELETE FROM STUDENTS;