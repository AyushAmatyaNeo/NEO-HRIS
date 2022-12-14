--------------------------------------------------------
--  File created - Wednesday-December-27-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table HRIS_TRAVEL_MASTER_SETUP
--------------------------------------------------------

  CREATE TABLE "HRIS_TRAVEL_MASTER_SETUP" 
   (	"TRAVEL_ID" NUMBER(7,0), 
	"TRAVEL_CODE" VARCHAR2(15 BYTE), 
	"TRAVEL_ENAME" VARCHAR2(255 BYTE), 
	"TRAVEL_LNAME" VARCHAR2(255 BYTE), 
	"SETTLEMENT_FLAG" CHAR(1 BYTE) DEFAULT 'N', 
	"TADA_SETTLEMENT_FLAG" CHAR(1 BYTE) DEFAULT 'N', 
	"OVERRIDE_RECOMMENDER_FLAG" CHAR(1 BYTE) DEFAULT 'N', 
	"OVERRIDE_APPROVER_FLAG" CHAR(1 BYTE) DEFAULT 'N', 
	"ENABLE_SUBSTITUTE" CHAR(1 BYTE) DEFAULT 'N', 
	"IS_SUBSTITUTE_MANDATORY" CHAR(1 BYTE) DEFAULT 'N', 
	"FALM_TYPE" CHAR(1 BYTE) DEFAULT 'F', 
	"ALLOW_EXPENSE_IN_ADVANCE" CHAR(1 BYTE) DEFAULT 'N', 
	"STATUS" CHAR(1 BYTE) DEFAULT 'E', 
	"CREATED_BY" NUMBER(7,0), 
	"CREATED_DT" DATE DEFAULT TRUNC(SYSDATE), 
	"MODIFIED_BY" NUMBER(7,0), 
	"MODIFIED_DT" DATE
   )
--------------------------------------------------------
--  DDL for Index SYS_C0033428
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0033428" ON "HRIS_TRAVEL_MASTER_SETUP" ("TRAVEL_ID")
--------------------------------------------------------
--  Constraints for Table HRIS_TRAVEL_MASTER_SETUP
--------------------------------------------------------

  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" ADD PRIMARY KEY ("TRAVEL_ID") ENABLE
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" ADD CHECK (STATUS                    IN('E','D')) ENABLE
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" ADD CHECK (ALLOW_EXPENSE_IN_ADVANCE  IN ('Y','N')) ENABLE
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" ADD CHECK (FALM_TYPE                 IN ('F','B')) ENABLE
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" ADD CHECK (IS_SUBSTITUTE_MANDATORY   IN ('Y','N')) ENABLE
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" ADD CHECK (ENABLE_SUBSTITUTE         IN ('Y','N')) ENABLE
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" ADD CHECK (OVERRIDE_APPROVER_FLAG    IN ('Y','N')) ENABLE
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" ADD CHECK (OVERRIDE_RECOMMENDER_FLAG IN ('Y','N')) ENABLE
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" ADD CHECK (TADA_SETTLEMENT_FLAG      IN ('Y','N')) ENABLE
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" ADD CHECK (SETTLEMENT_FLAG           IN ('Y','N')) ENABLE
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" MODIFY ("STATUS" NOT NULL ENABLE)
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" MODIFY ("ALLOW_EXPENSE_IN_ADVANCE" NOT NULL ENABLE)
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" MODIFY ("FALM_TYPE" NOT NULL ENABLE)
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" MODIFY ("IS_SUBSTITUTE_MANDATORY" NOT NULL ENABLE)
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" MODIFY ("ENABLE_SUBSTITUTE" NOT NULL ENABLE)
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" MODIFY ("OVERRIDE_APPROVER_FLAG" NOT NULL ENABLE)
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" MODIFY ("OVERRIDE_RECOMMENDER_FLAG" NOT NULL ENABLE)
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" MODIFY ("TADA_SETTLEMENT_FLAG" NOT NULL ENABLE)
  ALTER TABLE "HRIS_TRAVEL_MASTER_SETUP" MODIFY ("SETTLEMENT_FLAG" NOT NULL ENABLE)


--------------------------------------------------------
--  File created - Wednesday-December-27-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table HRIS_EMPLOYEE_TRAVEL_REQUEST
--------------------------------------------------------

  CREATE TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" 
   (	"TRAVEL_ID" NUMBER(7,0), 
	"EMPLOYEE_ID" NUMBER(7,0), 
	"REQUESTED_DATE" DATE DEFAULT SYSDATE, 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"DESTINATION" VARCHAR2(255 BYTE), 
	"PURPOSE" VARCHAR2(255 BYTE), 
	"REQUESTED_AMOUNT" FLOAT(126), 
	"REMARKS" VARCHAR2(255 BYTE), 
	"STATUS" VARCHAR2(2 BYTE), 
	"RECOMMENDED_BY" NUMBER(7,0), 
	"RECOMMENDED_DATE" DATE, 
	"RECOMMENDED_REMARKS" VARCHAR2(255 BYTE), 
	"APPROVED_BY" NUMBER(7,0), 
	"APPROVED_DATE" DATE, 
	"APPROVED_REMARKS" VARCHAR2(255 BYTE), 
	"TRANSPORT_TYPE" VARCHAR2(255 BYTE), 
	"DEPARTURE_DATE" DATE, 
	"RETURNED_DATE" DATE, 
	"APPROVER_ROLE" VARCHAR2(5 BYTE), 
	"ADVANCE_RECOMMENDED_BY" NUMBER(7,0), 
	"ADVANCE_RECOMMENDED_DATE" DATE, 
	"ADVANCE_RECOMMENDED_REMARKS" VARCHAR2(255 BYTE), 
	"ADVANCE_APPROVED_BY" NUMBER(7,0), 
	"ADVANCE_APPROVED_DATE" DATE, 
	"ADVANCE_APPROVED_REMARKS" VARCHAR2(255 BYTE), 
	"TRAVEL_MASTER_ID" NUMBER(7,0), 
	"OVERRIDE_RECOMMENDER_ID" NUMBER(7,0), 
	"OVERRIDE_APPROVER_ID" NUMBER(7,0), 
	"SUB_EMPLOYEE_ID" NUMBER(7,0), 
	"SUB_APPROVED_FLAG" CHAR(1 BYTE), 
	"SUB_APPROVED_DATE" DATE, 
	"REQUESTED_TYPE" CHAR(1 BYTE)
   )
--------------------------------------------------------
--  DDL for Index EMP_TRAVEL_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EMP_TRAVEL_ID_PK" ON "HRIS_EMPLOYEE_TRAVEL_REQUEST" ("TRAVEL_ID")
--------------------------------------------------------
--  Constraints for Table HRIS_EMPLOYEE_TRAVEL_REQUEST
--------------------------------------------------------

  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" ADD CHECK (REQUESTED_TYPE IN ('A','E')) ENABLE
  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" ADD CHECK (SUB_APPROVED_FLAG IN ('Y','N')) ENABLE
  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" ADD CONSTRAINT "EMP_TRAVEL_ID_PK" PRIMARY KEY ("TRAVEL_ID") ENABLE
  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" MODIFY ("STATUS" NOT NULL ENABLE)
  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" MODIFY ("REQUESTED_AMOUNT" NOT NULL ENABLE)
  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" MODIFY ("DESTINATION" NOT NULL ENABLE)
  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" MODIFY ("TO_DATE" NOT NULL ENABLE)
  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" MODIFY ("FROM_DATE" NOT NULL ENABLE)
  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" MODIFY ("REQUESTED_DATE" NOT NULL ENABLE)
  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" MODIFY ("EMPLOYEE_ID" NOT NULL ENABLE)
  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" MODIFY ("TRAVEL_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Ref Constraints for Table HRIS_EMPLOYEE_TRAVEL_REQUEST
--------------------------------------------------------

  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" ADD CONSTRAINT "EMP_TRAVEL_EMP_ID_FK" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "HRIS_EMPLOYEES" ("EMPLOYEE_ID") DISABLE
  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" ADD CONSTRAINT "RQ_TRVL_APRV_BY_FK" FOREIGN KEY ("APPROVED_BY")
	  REFERENCES "HRIS_EMPLOYEES" ("EMPLOYEE_ID") DISABLE
  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" ADD CONSTRAINT "RQ_TRVL_RECMD_BY_FK" FOREIGN KEY ("RECOMMENDED_BY")
	  REFERENCES "HRIS_EMPLOYEES" ("EMPLOYEE_ID") DISABLE
  ALTER TABLE "HRIS_EMPLOYEE_TRAVEL_REQUEST" ADD CONSTRAINT "TVL_REQ_TVL_FK" FOREIGN KEY ("TRAVEL_ID")
	  REFERENCES "HRIS_EMPLOYEE_TRAVEL_REQUEST" ("TRAVEL_ID") ENABLE
