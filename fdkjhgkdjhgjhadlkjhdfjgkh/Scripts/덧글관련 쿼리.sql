/*
int dataNum 본글의 넘버
String CON     댓글의 내용
String RWRITER 댓글쓴이
int rn      댓글 순번
int comment 댓글수
String COMDATE 댓글날자
int NUM     댓글고유 순번
*/
  
 

--덧글달기
--id="insertComment"
INSERT INTO comments(
	 b_NUM				
	,r_CONTENTS					
	,r_WRITER)
VALUES('#{dataNum}','#{CON}','#{RWRITER}');

--id="CommentPlus"

UPDATE TOTAL_BOARD
   SET recommend = recommend+1
 WHERE b_NUM =10001;

COMMIT;


--덧글보기
--id="comment"
SELECT ROWNUM AS rn,
r.r_CONTENTS AS CONTENTS,
r.r_WRITER AS RWRITER ,
TO_CHAR(r.r_DATE,'YY-MM-DD HH24:MI') AS COMDATE 
FROM comments r
JOIN TOTAL_BOARD b
ON b.b_NUM =r.b_NUM
WHERE r.b_NUM = 10001
  AND r.DELETED='N';
/*
SELECT ROWNUM AS "R_NUM",
r.R_CONTENTS AS "R_CON",
r.R_WRITER AS "R_WRITER" ,
TO_CHAR(r.R_DATE,'YY-MM-DD HH24:MI') AS"DATE" 
FROM comments r
JOIN TOTAL_BOARD b
ON b.B_NUM =r.B_NUM
WHERE r.B_NUM = '10030'
  AND r.DELETED='N';*/

 
 
--덧글 삭제
--id="deletComment"
UPDATE comments r
   SET DELETED = 'Y'
 WHERE r_NUM = '#{NUM}';

--id="CommentPlus"
UPDATE TOTAL_BOARD
   SET recommend= recommend-1
 WHERE b_NUM = #{dataNum}


COMMIT;
 
--덧글 수정
--id="UpdateComment"
UPDATE comments r
   SET r.R_CONTENTS  = '#{CON}'
 WHERE r_NUM = '#{NUM}';
 WHERE r_WRITER = #{RWRITER}


 COMMIT;

