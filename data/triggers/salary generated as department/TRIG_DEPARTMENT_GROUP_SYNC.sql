create or replace TRIGGER TRIG_DEPARTMENT_GROUP_SYNC
AFTER INSERT OR UPDATE OR DELETE
ON HRIS_DEPARTMENTS
FOR EACH ROW
DECLARE

BEGIN
IF INSERTING
THEN

INSERT INTO hris_salary_sheet_group
(
GROUP_ID,
GROUP_CODE,
GROUP_NAME
)
VALUES
(
:new.DEPARTMENT_ID,
:new.DEPARTMENT_CODE,
:new.DEPARTMENT_NAME
);
END IF;

IF UPDATING
THEN
IF :new.status = 'D'
then
DELETE FROM hris_salary_sheet_group WHERE GROUP_ID = :OLD.DEPARTMENT_ID;
END IF;

UPDATE hris_salary_sheet_group SET GROUP_CODE = :new.DEPARTMENT_CODE, GROUP_NAME = :new.DEPARTMENT_NAME
WHERE GROUP_ID = :OLD.DEPARTMENT_ID;
END IF;

END;