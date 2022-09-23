
--예약 하기
--id="insertSchedule"
INSERT INTO schedule (
SCH_DATE,SCH_TRNR,SCH_MEM)
VALUES ('#{DATE}','#{TRNR_totalCode}','#{totalCode}');
/*
INSERT INTO schedule (
SCH_DATE,SCH_TRNR,SCH_MEM)
VALUES (SYSDATE+1,'1015','1014');
*/

COMMIT;


 
--예약 취소
--id="deleteSchedule"
DELETE FROM schedule
WHERE schedule ="#{totalCode}"

COMMIT;
 


--pt count 조절
--id="countSet"
UPDATE MEMBERS
   SET MEM_PT = MEM_PT + #{NUM}
 WHERE MEM_USER = '#{totalCode}';

COMMIT;

--id="countMinusSet"
UPDATE MEMBERS
   SET MEM_COUNT = MEM_COUNT-1
 WHERE MEM_USER = '#{totalCode}';

 
 COMMIT;

--파일 등록?
--id="uploadFile"
INSERT INTO FILES
(FILENAME,ORIGIN_NAME,FILE_PATH)
VALUES ('#{I}','#{m}','#{path}');

COMMIT;

--pt변경,설정
--id="changeCoach"
UPDATE MEMBERS
   SET MEM_PT = '#{TRNR_totalCode}'
 WHERE MEM_USER = '#{totalCode}';-
 
 COMMIT;


COMMIT;
