CREATE OR REPLACE PROCEDURE HRIS_CAFE_LOG_MIGRATION 
AS
    V_EMPOWER_LOG_NO             VARCHAR2(100);
    V_HRIS_LOG_NO                NUMBER;
BEGIN
FOR DATA IN
(SELECT * FROM SCP0218.HR_ECANTEEN_LOG) LOOP

V_EMPOWER_LOG_NO := DATA.LOG_NO;

SELECT NVL(MAX(LOG_NO)+1, 1) INTO V_HRIS_LOG_NO FROM HRIS_CAFETERIA_LOG;

INSERT INTO HRIS_CAFETERIA_LOG(
LOG_NO,
LOG_DATE,
EMPLOYEE_ID,
TIME_ID,
PAY_TYPE,
CREATED_BY,
TOTAL_AMOUNT
)
VALUES(
V_HRIS_LOG_NO,
DATA.LOG_DATE,
DATA.EMPLOYEE_CODE,
DATA.TIME_CODE,
DATA.PAY_TYPE,
1,
DATA.TOTAL_AMOUNT
);

INSERT INTO HRIS_CAFETERIA_LOG_DETAIL(
LOG_NO,
LOG_DATE,
EMPLOYEE_ID,
TIME_CODE,
PAY_TYPE,
CREATED_BY,
TOTAL_AMOUNT,
MENU_CODE,
QUANTITY,
RATE,
SERIAL_NO
)
SELECT 
(SELECT LOG_NO FROM HRIS_CAFETERIA_LOG WHERE LOG_NO = V_HRIS_LOG_NO),
LOG_DATE,
EMPLOYEE_CODE,
TIME_CODE,
PAY_TYPE,
1,
TOTAL_AMOUNT,
MENU_CODE,
QUANTITY,
RATE,
SERIAL_NO
FROM
SCP0218.HR_ECANTEEN_LOG_DETAIL
WHERE LOG_NO = V_EMPOWER_LOG_NO
;

END LOOP;

FOR DATA IN
(SELECT * FROM SCP0218.HR_MENU_MASTER_SETUP) LOOP

INSERT INTO HRIS_CAFETERIA_MENU_SETUP
(
MENU_ID,
MENU_NAME, 
QUANTITY,
RATE,
REMARKS,
CREATED_BY,
CREATED_DATE,
COMPANY_ID
)
VALUES(
DATA.MENU_CODE,
DATA.MENU_EDESC,
DATA.QUANTITY,
DATA.RATE,
DATA.REMARKS,
1,
DATA.CREATED_DATE,
DATA.COMPANY_CODE
)
;

END LOOP;

FOR DATA IN
(SELECT * FROM SCP0218.HR_TIME_CODE) LOOP

INSERT INTO HRIS_CAFETERIA_TIME_CODE
(
TIME_ID,
TIME_NAME, 
REMARKS,
CREATED_BY,
CREATED_DATE,
COMPANY_ID
)
VALUES( 
DATA.TIME_CODE,
DATA.TIME_EDESC,
DATA.REMARKS,
1,
DATA.CREATED_DATE,
DATA.COMPANY_CODE
)
;

END LOOP;

FOR DATA IN
(SELECT * FROM SCP0218.HR_MENU_MAP) LOOP

INSERT INTO HRIS_CAFETERIA_MENU_TIME_MAP(
MAP_ID,
MENU_ID,
TIME_ID,
CREATED_BY,
CREATED_DATE,
COMPANY_CODE,
"TYPE"
)
VALUES(
(SELECT NVL(MAX(MAP_ID)+1, 1) FROM HRIS_CAFETERIA_MENU_TIME_MAP),
DATA.MENU_CODE,
DATA.TIME_CODE,
1,
TRUNC(SYSDATE),
1,
'SCP'
)
;

END LOOP;

--FOR DATA IN
--(SELECT * FROM SCP0218.HR_MENU_MAP_LSG) LOOP

--INSERT INTO HRIS_CAFETERIA_MENU_TIME_MAP(
--MAP_ID,
--MENU_ID,
--TIME_ID,
--CREATED_BY,
--CREATED_DATE,
--COMPANY_CODE,
--"TYPE"
--)
--VALUES(
--(SELECT NVL(MAX(MAP_ID)+1, 1) FROM HRIS_CAFETERIA_MENU_TIME_MAP),
--DATA.MENU_CODE,
--DATA.TIME_CODE,
--1,
--TRUNC(SYSDATE),
--1,
--'LSG'
--);

--END LOOP;

END;
