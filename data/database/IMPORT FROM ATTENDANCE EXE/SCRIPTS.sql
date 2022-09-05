CREATE TABLE HRIS_ATTD_EXCEL
(
THUMB_ID NUMBER(9,0),
NO_ONE NUMBER(3,0),
NO_TWO NUMBER(3,0),
NO_THREE NUMBER(3,0),
ATTD_YEAR NUMBER(4,0),
ATTD_MONTH NUMBER(2,0),
ATTD_DAY NUMBER(2,0),
ATTD_HOUR NUMBER(2,0),
ATTD_MINUTE NUMBER(2,0),
ATTD_SECOND NUMBER(2,0),
NO_FOUR NUMBER(3,0)
);



BEGIN

FOR EMPLOYEE_LIST IN(SELECT * FROM HRIS_EMPLOYEES WHERE 
--COMPANY_ID=4
--AND STATUS='E' AND RESIGNED_FLAG='N'
--AND RETIRED_FLAG='N')
LOOP

HRIS_MIG_ATTD_EXCEL(
--EMPLOYEE_LIST.EMPLOYEE_ID,
--'9-SEP-18',
--'9-SEP-18'
);

END LOOP;
END;

