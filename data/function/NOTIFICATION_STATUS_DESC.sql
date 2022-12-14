create or replace FUNCTION NOTIFICATION_STATUS_DESC(
    P_STATUS HRIS_NOTIFICATION.STATUS%TYPE)
  RETURN VARCHAR2
IS
  V_STATUS_DESC VARCHAR2(50 BYTE);
BEGIN
  V_STATUS_DESC:=
  (
    CASE P_STATUS
    WHEN 'S' THEN
      'Seen'
    WHEN 'U'THEN
      'Unseen'
    END);
  RETURN V_STATUS_DESC;
END;