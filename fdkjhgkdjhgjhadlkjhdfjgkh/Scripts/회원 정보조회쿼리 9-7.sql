COMMIT;
/*
 String userid       아이디
 String MEMBERName   이름(회원)
 String birth        생년월일
 String phone        핸드폰
 String email        이메일
 String gender       성별
 int ptcount         피티카운트
 String coachName    담당 피티 이름
 int MEMBERCODE      회원코드(회원만 주는 코
 int USERSCODE       유저코드(어드민 트레이너 회원 합친코드
 String schedule     pt날짜 
 String deleted      삭제여부
 String hidden       유령회원 여부
 date datelog        로그인
 String NAME
 */


---------------------------------

--id=allperson
SELECT * --총원조회
FROM totalsearch
WHERE DELETED='N';

--id=searchAll
SELECT * --구분별조회 쿼리
FROM totalsearch 
WHERE ROLE = '#{role}'
  AND DELETED='N'; ; --#{role} A M T


--id=searchAdmin
SELECT * --어드민조회
FROM totalsearch
WHERE ROLE = 'A'
  AND DELETED='N';


--id=searchTrainer
SELECT * --트레이너 조회
FROM totalsearch
WHERE ROLES  = 'T'
  AND DELETED='N';


--id=searchMember
SELECT * --회원조회
FROM membersearch
WHERE ROLE = 'M'
  AND DELETED='N';	
--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

 
/--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
--회원가입
--id=joinSighIn
INSERT INTO TOTAL (
USERID,PASSWORD,NAME,BIRTH,PHONENUMBER,EMAIL,GENDER)
VALUES ('#{USERID}','#{PASSWORD}','#{NAME}','#{BIRTH}','#{PHONENUMBER}','#{EMAIL}','#{GENDER}');
--회원 가입후 m일시
--id=Joinmember
INSERT INTO MEMBERS (
MEM_USER)
VALUES ('#{USERSCODE}');

COMMIT;

*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--/


 --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
---아이디 찾기 쿼리
 --id=foundId
SELECT userid
FROM membersearch
WHERE (membername  = '#{name}')
  AND (phone = '#{PHONE}')
  AND (LOWER(email) = LOWER('#{EMAIL}'))
  AND DELETED='N';
/*
SELECT USERID
FROM membersearch 
WHERE (membername  = '서정권')
  AND (phone = '01032345678')
  AND (LOWER(email) = LOWER('thedtjk@email.com'))
  AND DELETED='N';  
*/ 

 
 
 ---패스 워드 찾는 쿼리 
  --id=foundPWD
SELECT USERCODE AS userCode
  FROM USERS
 WHERE (name  = '#{name}')
   AND (phone  = '#{phone}')
   AND (email  = '#{email}')
   AND (userid = '#{userid}')
   AND DELETED='N';
 -- 패스워드 변경 쿼리
  --id=updatePWD
 UPDATE USERS 
    SET PASSWORD = '#{NEWPWD}'
  WHERE (name  = '#{name}')
  AND (phone  = '#{phone}')
  AND (email  = '#{email}')
  AND (USERID  = '#{USERID}')
  AND (userCode='#{userCode}');
 
*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
 

 --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
 --id=login
SELECT *
FROM USERS
WHERE LOWER(userid) = LOWER('#{userid}')
  AND password =#{password}
  AND DELETED='N';
 /*
SELECT *
FROM totalsearch
WHERE id = 'thedtjk'
  AND password ='password1'
  AND DELETED='N';
 */ 
 
--id=dateLog --로그인시 해당쿼리도 작동할수있게 해주세여
UPDATE USERS
   SET DATELOG = SYSDATE
 WHERE userid = #{userid};
 --or
UPDATE USERS
   SET DATELOG = #{DATE}
 WHERE userid = '#{userid}';
 

--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

 --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
 --회원탈퇴
 --id=deletUser
 UPDATE USERS t, 
    SET DELETED ='Y',
     	DELETEDATE = SYSDATE
  WHERE userid = '#{userid}';
--PT가 회원 탈퇴를 했을떄 담당 앞으로의 스켸줄에서 이름null 세팅
--id=deleteTrnrSch
UPDATE schedule
   SET SCH_TRNR=NULL
 WHERE (TO_CHAR(SCH_DATE,'YY.MM.DD.HH24.MI') > TO_CHAR(SYSDATE ,'YY.MM.DD.HH24.MI'))
   AND (SCH_TRNR=(SELECT userCode
 				   FROM USERS 
                  WHERE (DELETED = 'N')
                    AND (userid='{userid}')));
 
 COMMIT;

--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
  
 --회원기록 삭제 --회원탈퇴후 5년뒤 데이터 완전삭제  자동시스템
 --id=dropUser
 DELETE FROM USERS
   WHERE TO_CHAR(DELETEDATE ,'YY.MM.DD') <= TO_CHAR(SYSDATE-1825,'YY.MM.DD');
 
  --데이터파기
  DELETE FROM USERS
  WHERE USERCODE='#{USERCODE}'
 
 COMMIT;



---id=hiddenMember -유령회원 설정  자동시스템
UPDATE USERS
   SET HIDDEN ='Y'
 WHERE TO_CHAR(DATELOG,'YY.MM.DD') <= TO_CHAR(SYSDATE-365,'YY.MM.DD');

COMMIT;


  
 --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

 

--id=searchId ---마이페이지
SELECT *--회원 id 조회 쿼리
FROM membersearch
WHERE  (LOWER(userid)LIKE LOWER('%#{userid}%'));--#{ID}
/*
SELECT *--테스트 회원 id 조회
FROM membersearch
WHERE (LOWER(userid)LIKE LOWER('%theja%'));--#{}
*/





--id=searchUser
SELECT *--회원 id 혹은 이름 조회 쿼리
FROM membersearch
WHERE (LOWER(userid)   LIKE LOWER('%#{userid}%'))
   OR (LOWER(name)  LIKE LOWER('%#{name}%'));
/*   
SELECT *--테스트 회원 id 혹은 이름 조회
FROM membersearch
WHERE (LOWER(userid) LIKE LOWER('%theja%'))
   OR (LOWER(name) LIKE LOWER('%theja%'));--#{var};
*/
    
  
  
 

--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*


--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
--id=scheduleAll
SELECT*  --모든 스켸줄 조회
FROM trainersch
ORDER BY schedule;  




SELECT*  
FROM trainersch;
--id=scheduleDate
SELECT*  --일별 모든 스켸줄 조회
FROM trainersch
WHERE SUBSTR(schedule,1,5) = TO_CHAR((TRUNC('#{DATE}')),'MM/DD')
ORDER BY schedule; 

SELECT*
FROM trainersch
WHERE SUBSTR(schedule,1,5) = TO_CHAR((TRUNC(SYSDATE)),'MM/DD')
ORDER BY schedule; 
*/



--id=trnrSchedule
SELECT*----트레이너 이름으로 전체 스켸줄 조회
FROM trainersch
WHERE coachName LIKE '%#{name}%'
  AND t.DELETED='N';
ORDER BY schedule;

SELECT*--트레이너 이름 조회 스켸줄
FROM trainersch
WHERE coachName LIKE '%정기%'
ORDER BY schedule;--#{name}
*/




--id=trnrScheduleDate
SELECT*  --트레이너 일별 스켸줄 조회
FROM trainersch
WHERE SUBSTR(schedule,1,5) = TO_CHAR((TRUNC('#{DATE}')),'MM/DD')--#{DATE}
  AND (coachName LIKE '%#{NAME}%')
ORDER BY schedule; 

 SELECT*
FROM trainersch
WHERE SUBSTR(schedule,1,5) = TO_CHAR((TRUNC(SYSDATE)),'MM/DD')--#{DATE}
  AND (coachName LIKE '%최%')---#{NAME}
ORDER BY schedule; 
 */
	



--id=userSchedule
SELECT*----회원 이름으로 전체 스켸줄 조회
FROM trainersch
WHERE memberName LIKE '%#{name}%'
ORDER BY schedule;

SELECT*--회원 이름 조회 스켸줄
FROM trainersch
WHERE memberName LIKE '%민호%'
ORDER BY schedule;--#{name}
*/




--id=userScheduleDate
SELECT*----회원 이름으로 스켸줄 조회/지난일정제외
FROM trainersch
WHERE (SUBSTR(schedule,1,5) >= TO_CHAR((TRUNC(SYSDATE)),'MM/DD')) 
  AND memberName LIKE '%#{name}%'
ORDER BY schedule;

 SELECT*----회원 이름으로 스켸줄 조회/지난일정제외
FROM trainersch
WHERE (SUBSTR(schedule,1,5) >= TO_CHAR((TRUNC(SYSDATE)),'MM/DD')) 
  AND memberName LIKE '%정%'--%{name}
ORDER BY schedule;
*/




--id=userScheDateSet
SELECT*--회원 이름으로 스켸줄 조회/날짜지정
FROM trainersch
WHERE SUBSTR(schedule,1,5) = TO_CHAR((TRUNC('#{DATE}')),'MM/DD')
  AND memberName LIKE '%#{name}%'
ORDER BY schedule;
/*
SELECT*--회원 이름으로 스켸줄 조회/날짜지정
FROM trainersch
WHERE SUBSTR(schedule,1,5) = TO_CHAR((TRUNC(SYSDATE)),'MM/DD')--#{DATE}
  AND memberName LIKE '%서%'--%{name}
ORDER BY schedule;
*/

COMMIT;
------------------------------------


COUNT(CASE WHEN DELETE ='Y' THEN 0 ELSE NULL END)

SELECT 'X'FROM TOTAL;
HAVING COUNT(CASE WHEN DELETED ='N' THEN 0 ELSE NULL END)>=1;

GROUP BY ROLE;
