DROP SEQUENCE member_seq;						
DROP SEQUENCE cn_rly_seq;						
DROP SEQUENCE sch_num_seq;						
DROP SEQUENCE file_num_seq;		
DROP SEQUENCE total_seq;
DROP SEQUENCE tt_brd_seq;
				
DROP TABLE comments;
DROP TABLE TOTAL_BOARD;			
DROP TABLE FILES;						
DROP TABLE schedule;						
DROP TABLE MEMBERS;						
DROP TABLE TOTAL;		
DROP TABLE USERS;


DROP VIEW ttdboard;
DROP VIEW trainersch;
DROP VIEW membersearch;
DROP VIEW totalsearch ;


COMMIT;

					
CREATE SEQUENCE tt_brd_seq						
START WITH 10000						
INCREMENT BY 1;						
		
						
CREATE SEQUENCE member_seq						
START WITH 1						
INCREMENT BY 1;	

CREATE SEQUENCE cn_rly_seq						
START WITH 1						
INCREMENT BY 1;						
						 
CREATE SEQUENCE total_seq						
START WITH 1000					
INCREMENT BY 1;						
						
						
CREATE SEQUENCE sch_num_seq						
START WITH 1						
INCREMENT BY 1;						
						
CREATE SEQUENCE file_num_seq						
START WITH 1						
INCREMENT BY 1;			


COMMIT;
						
CREATE TABLE USERS(						
	USERSCODE NUMBER DEFAULT (total_seq.NEXTVAL) --토탈넘버					
	,USERID VARCHAR2(15) UNIQUE NOT NULL --개인 아이디					
	,PASSWORD VARCHAR2(30) NOT NULL --패스워드					
	,NAME VARCHAR2(30) NOT NULL --이름					
	,BIRTH DATE NOT NULL --생일					
	,phone VARCHAR(20) NOT NULL --핸드폰번호					
	,EMAIL VARCHAR2(100) NOT NULL --이메일					
	,GENDER VARCHAR2(5) NOT NULL --성별					
	,ROLES VARCHAR2(10) DEFAULT('M') --권한
	,HIDDEN VARCHAR(1) DEFAULT('N'),--유령회원여부,
	DELETEDATE DATE,
	deleted VARCHAR(1) DEFAULT('N'),
	DATELOG DATE
,CONSTRAINT chk_megender CHECK (GENDER IN ('F','M'))						
,CONSTRAINT chk_auth CHECK (ROLES IN('A','T','M'))						
,CONSTRAINT pk_total_id PRIMARY KEY(USERSCODE)						
);						
						
						
CREATE TABLE MEMBERS (						
	MEM_NUM NUMBER(10) DEFAULT member_seq.NEXTVAL -- 회원 번호					
	, MEM_USER NUMBER UNIQUE NOT NULL				
	, MEM_COUNT NUMBER(10)DEFAULT(0) -- pt 카운트					
	, MEM_PT NUMBER(15)--담당 피티					
,FOREIGN KEY (MEM_PT) REFERENCES USERS(USERSCODE) ON DELETE SET NULL						
,FOREIGN KEY (MEM_USER) REFERENCES USERS(USERSCODE) ON DELETE CASCADE						
,CONSTRAINT pk_user_id PRIMARY KEY (MEM_NUM)						
);						
SELECT NAME
  FROM USERS
WHERE ROLES = 'T'						
						
CREATE TABLE schedule(						
	schedule NUMBER DEFAULT sch_num_seq.NEXTVAL--예약리스트 넘버					
	,SCH_DATE DATE --예약날짜					
	,SCH_TRNR NUMBER(15) --트레이너의 토탈번호					
	,SCH_MEM NUMBER(15) --회원의 토탈번호					
	,SCH_JOIN VARCHAR2(1) --실행여부
	,HIDDEN VARCHAR(1) DEFAULT('N'),
	deleted VARCHAR(1) DEFAULT('N')					
, CONSTRAINT pk_SCHNum PRIMARY KEY(schedule)						
,FOREIGN KEY (SCH_TRNR) REFERENCES USERS(USERSCODE) ON DELETE CASCADE						
,FOREIGN KEY (SCH_MEM) REFERENCES USERS(USERSCODE) ON DELETE CASCADE						
);						
						
						
CREATE TABLE FILES(						
	NUMBERS NUMBER DEFAULT file_num_seq.NEXTVAL					
	,FILENAME VARCHAR2 (200) UNIQUE NOT NULL					
	,ORIGIN_NAME VARCHAR2(200) NOT NULL					
	,FILE_PATH VARCHAR2(2000) NOT NULL
	,HIDDEN VARCHAR(1) DEFAULT('N'),
	deleted VARCHAR(1) DEFAULT('N')
,CONSTRAINT pk_filePk PRIMARY KEY (NUMBERS)						
);

CREATE TABLE TOTAL_BOARD (						
	b_NUM NUMBER(5) --게시글 고유 넘버					
	,b_WRITER VARCHAR2(15) --글작성자 ( FK TOTAL-USERID)					
	,b_TITLE VARCHAR2(200) NOT NULL --제목					
	,b_CONTENTS VARCHAR2(2000) NOT NULL --내용					
	,b_WRITEDATE DATE DEFAULT(SYSDATE) --작성날					
	,b_COUNT NUMBER(5) DEFAULT(0) -- 조회수					
	,b_liked NUMBER(5) DEFAULT(0) --추천수					
	,b_FILE_NAME VARCHAR2(200) --첨부파일( FK FILESE-FILENAME)
	,category VARCHAR(8)					
	,b_trainer NUMBER
	,HIDDEN VARCHAR(1) DEFAULT('N'),
	deleted VARCHAR(1) DEFAULT('N'),
	recommend NUMBER  DEFAULT(0)
,FOREIGN KEY (b_trainer) REFERENCES USERS(USERSCODE) ON DELETE SET NULL									
,FOREIGN KEY (b_WRITER) REFERENCES USERS(USERID) ON DELETE SET NULL						
,FOREIGN KEY (b_FILE_NAME) REFERENCES FILES(FILENAME) ON DELETE SET NULL						
,CONSTRAINT pk_ttid PRIMARY KEY (b_NUM)						
);														
						
CREATE TABLE comments (						
	commentNum NUMBER(8) DEFAULT cn_rly_seq.NEXTVAL --리플 넘버					
	,dateNum NUMBER --본글의 넘버					
	,commentContents VARCHAR2 (1000) NOT NULL					
	,commentWriter VARCHAR2 (200) NOT NULL --댓글작성자					
	,commentDate DATE DEFAULT(SYSDATE)
	,hidden VARCHAR(1) DEFAULT('N'),
	deleted VARCHAR(1) DEFAULT('N')
,CONSTRAINT pk_rplyNum PRIMARY KEY (commentNum)						
,FOREIGN KEY (dateNum) REFERENCES TOTAL_BOARD(b_NUM) ON DELETE CASCADE						
,FOREIGN KEY (commentWriter) REFERENCES USERS(USERID) ON DELETE SET NULL						
);

COMMIT;



CREATE VIEW totalsearch AS
SELECT
	USERSCODE AS userCode
	,USERID AS userid
	,PASSWORD AS password
	,NAME AS name
	,TO_CHAR(BIRTH,'YYYY-MM-DD') AS birth
	,phone AS phone
	,EMAIL AS email
	,GENDER AS gender	
	 ,ROLES AS roles,
	 DELETED AS deleted,
	 HIDDEN AS HIDDEN,
	 DATELOG  AS DATELOG,
	 (SELECT NAME
	 FROM USERS t2
	 WHERE t2.USERSCODE= m.MEM_PT) AS coachName 
FROM USERS u
JOIN MEMBERS m 
  ON u.USERSCODE =m.MEM_USER ;

CREATE VIEW membersearch AS
SELECT
	USERID AS userid
	,NAME AS MEMBERName
	,TO_CHAR(BIRTH,'YYYY-MM-DD') AS birth
	,PHONE AS phone
	,EMAIL AS email
	,GENDER AS gender
	,MEM_COUNT AS ptcount
	,(SELECT NAME
	 FROM USERS t2
	 WHERE USERSCODE= MEM_PT) AS coachName
	,MEM_NUM AS MEMBERCODE
	,USERSCODE AS USERSCODE
	,TO_CHAR((SELECT SCH_DATE
				FROM SCHEDULE s 
                WHERE (ROWNUM=1) AND (SCH_MEM =USERSCODE)),'MM/DD_HH24:MI') AS "schedule"
	 ,ROLES,
	 deleted AS deleted,
	 HIDDEN AS hidden,
	 DATELOG  AS datelog
FROM MEMBERS m
RIGHT JOIN USERS t
ON USERSCODE =m.MEM_USER;
	
CREATE VIEW trainersch AS
SELECT
	TO_CHAR(SCH_DATE,'MM/DD_HH24:MI') AS schedule
	, (SELECT NAME
		 FROM USERS t2
		WHERE USERSCODE= s.SCH_TRNR)
		   AS coachName
	, (SELECT NAME
		 FROM USERS t2
	    WHERE USERSCODE= s.SCH_MEM)
	  	   AS memberName
	,SCH_JOIN AS joinCheck
	,t.deleted
FROM schedule s
JOIN USERS t 
ON USERSCODE =s.SCH_MEM;




CREATE VIEW ttdboard AS
SELECT b_NUM AS dataNum
,b_WRITER AS writer
,b_TITLE  AS title
,b_CONTENTS AS contents
,TO_CHAR(b_WRITEDATE,'YY-MM-DD HH24:MI')AS writedate
,b_COUNT AS conut
,b_liked AS liked
,b_FILE_NAME AS file_name,
recommend AS recommend
,(SELECT NAME
    FROM USERS t 
   WHERE USERSCODE = b_trainer) AS btrainer
,category AS category
,b.deleted AS deleted
,t.USERSCODE AS USERSCODE
FROM TOTAL_BOARD b
LEFT JOIN USERS t
ON b_trainer = USERSCODE
LEFT JOIN FILES f 
ON f.FILENAME = b.b_FILE_NAME;

COMMIT;

SELECT tt_brd_seq.NEXTVAL FROM DUAL
