 /* 게시판 DTO
     int rn 게시판내에서 글넘버
     String write 글작성자
     String title 글제목
     String contents 글내
     String writedate 글쓴날짜
     String category 게시판성격   
     char deleted 삭제여부    
     int dataNum 해당 글의 고유 넘버
     int conut 조회수
     int liked 추천수
     int recommend 덧글수
  */


---게시글 수정 --유저
-- id="updateDateUser"
UPDATE TOTAL_BOARD
   SET b_CONTENTS = '#{contents}',
       b_TITLE = '#{title}'
 WHERE b_WRITER = '#{dataNum}'
 
 ---게시글 수정 --유저
-- id="updateDateUser"
UPDATE TOTAL_BOARD
   SET b_CONTENTS = '#{contents}',
       b_TITLE = '#{title}'
      ,category ='#{category}'
 WHERE b_NUM  = '#{dataNum}'

    

---게시글 작성 쿼리
   --id="insertBoard"
INSERT INTO TOTAL_BOARD(
b_WRITER,
b_TITLE,
b_CONTENTS,
category,
b_WRITEDATE
) VALUES(
'#{ID}',
'#{TITLE}',
'#{COMTENTS}',
'#{category}',
SYSDATE
);       

--리뷰게시판작성
   --id="RVinsertBoard"
INSERT INTO TOTAL_BOARD(
b_WRITER,
b_TITLE,
b_CONTENTS,
category,
b_trainer,
b_WRITEDATE
) VALUES(
'#{ID}',
'#{TITLE}',
'#{COMTENTS}',
'#{category}',
'#{b_trainer}',
SYSDATE

);         
UPDATE TOTAL_BOARD
  SET b_liked = '3'
WHERE b_NUM = '10000';

---게시글 삭제
	--id="deletData"
DELETE TOTAL_BOARD
WHERE b_NUM = 10073;

COMMIT;

---조회수증가
--id="updateViewCnt"
UPDATE TOTAL_BOARD
  SET b_COUNT = b_COUNT+1
WHERE b_NUM = '#{b_NUM}';


COMMIT;

--좋아요
-- id="liked"
UPDATE TOTAL_BOARD
  SET recommend = recommend+1
WHERE b_NUM = '#{b_NUM}';

COMMIT;


--좋취,싫어요
--id="dislike"
UPDATE TOTAL_BOARD
  SET recommend = recommend-1
WHERE b_NUM = '#{b_NUM}';

COMMIT;

