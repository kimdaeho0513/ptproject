-------------------------------------


--모든게시글 조회
  

--id=AllBoard
SELECT ROWNUM AS rn--모든게시글 조회
  	  ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
FROM ttdboard;
 
 /*
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
    
--id=Info
SELECT ROWNUM AS rn--정보게시판
  	  ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
  FROM ttdboard
WHERE category='I';
 
 /*
      rn 게시판내에서 글넘버
      write 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      category 게시판성격       
  */
    
--id=Couns
SELECT ROWNUM AS rn--문의게시판
  	  ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
  FROM ttdboard
WHERE category='C';
 
 /*
      rn 게시판내에서 글넘버
      write 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      category 게시판성격       
  */
    
--id=Review
SELECT ROWNUM AS RN--후기게시판
  	  ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
      ,btrainer,
      USERSCODE
  FROM ttdboard
WHERE category='R';

UPDATE TOTAL_BOARD 
   SET B_TRAINER = NULL 
  WHERE B_NUM = 10338;
 /*
      rn 게시판내에서 글넘버
      write 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      btrainer 태그된 트레이너 
      category 게시판성격       
  */
    

--id=Notice
SELECT ROWNUM AS RN--공지게시판
  	  ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
  FROM ttdboard
WHERE category='N';
 
 /*
      rn 게시판내에서 글넘버
      write 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      category 게시판성격       
  */
    


-------------------------------------

-----정보게시판
--id=InfoIdSearch-- 작성자 아이디로 -정보
SELECT ROWNUM AS RN
  	  ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
FROM ttdboard
WHERE (UPPER(writer) LIKE UPPER('%#{ID}%') AND category='I')
  AND deleted='N';
/*
SELECT ROWNUM AS RN
  	  ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
FROM ttdboard
WHERE (UPPER(writer) LIKE UPPER('%theja%') AND category='I')
  AND deleted='N';; ---#{ID}
*/

 
 /*
      rn 게시판내에서 글넘버
      write 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      btrainer 태그된 트레이너 
      category 게시판성격       
  */
     
 
 
--id=InfoConSearch---제목,내용 검색 -정보
  SELECT ROWNUM AS RN
  	  ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
FROM ttdboard
WHERE ((UPPER(contents) LIKE UPPER('%#{파일}%')) 
   OR (UPPER(title) LIKE UPPER('%#{CON}%')) )AND category='I'
  AND deleted='N';
/*SELECTROWNUM AS RN
  	  ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
FROM ttdboard
WHERE ((UPPER(contents) LIKE UPPER('%파일%')) 
   OR (UPPER(title) LIKE UPPER('%파일%')) )AND category='I'
  AND deleted='N';;---#{CON}
*/ ;     

  
 /*
      rn 게시판내에서 글넘버
      write 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      btrainer 태그된 트레이너 
      category 게시판성격       
  */
    




-----리뷰 
--id='ReveiwIdSearch'-- 작성자 아이디로 검색 -리뷰
SELECT ROWNUM AS RN
  	  ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
FROM ttdboard
WHERE (UPPER(writer) LIKE UPPER('%#{ID}%') AND category='R')
  AND deleted='N';
/*
SELECT ROWNUM AS RN
  	  ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
FROM ttdboard
WHERE (UPPER(writer) LIKE UPPER('%theja%') AND category='R')
  AND deleted='N';;*/
 
 
 /*
      rn 게시판내에서 글넘버
      write 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      btrainer 태그된 트레이너 
      category 게시판성격       
  */
     
 
 
 
 
--id='ReveiwConSearch'
  SELECT ROWNUM AS RN 
  	  ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
FROM ttdboard
WHERE ((UPPER(contents) LIKE UPPER('%#{CON}%')) 
   OR (UPPER(title) LIKE UPPER('%#{CON}%')) )AND category='R'
  AND deleted='N';
/*
SELECT ROWNUM AS RN
 	  ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
FROM ttdboard
WHERE ((UPPER(contents) LIKE UPPER('%title%')) 
   OR (UPPER(title) LIKE UPPER('%title%')) )AND category='R'
  AND deleted='N';*/
 
 
 /*
      rn 게시판내에서 글넘버
      write 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      btrainer 태그된 트레이너 
      category 게시판성격       
  */
    
 
 
 
 --id='ReveiwPTSearch'  
    SELECT ROWNUM AS RN ---제목,내용 검색 -문의
      ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
FROM ttdboard
WHERE category LIKE %#{NAME}%
  AND deleted='N';
SELECT ROWNUM AS RN
	  ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
FROM ttdboard
WHERE CATEGORY LIKE '%정%'---#{CATEGORI}
  AND deleted='N';; 
*/


 /*
      rn 게시판내에서 글넘버
      write 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      btrainer 태그된 트레이너 
      category 게시판성격       
  */
    

-----문의
--id=couIdSearch-- 작성자 아이디로 검색 -문의
  SELECT ROWNUM AS RN
      ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
FROM ttdboard
WHERE (LOWER(writer) LIKE LOWER('%#{ID}%') AND category='C')
  AND deleted='N';
 /*
SELECT ROWNUM AS RN
    ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
FROM ttdboard
WHERE (LOWER(writer) LIKE LOWER('%theja%') AND category='C')
  AND deleted='N';---#{ID}
  */
 
 /*
      rn 게시판내에서 글넘버
      write 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      btrainer 태그된 트레이너 
      category 게시판성격       
  */
    
 
 
 
 
--id=couConSearch  
  SELECT ROWNUM AS RN ---제목,내용 검색 -문의
      ,writer
      ,title
      ,dataNum
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
FROM ttdboard
WHERE ((UPPER(contents) LIKE UPPER('%#{CON}%')) 
   OR (UPPER(title) LIKE UPPER('%#{CON}%')) )AND category='C'
  AND deleted='N'; 
/*SELECT ROWNUM AS RN
      ,writer
      ,title
      ,id
      ,contents
      ,writedate
      ,conut
      ,recommend,liked
      ,file_name
FROM ttdboard
WHERE ((UPPER(contents) LIKE UPPER('%게시판%')) 
   OR (UPPER(title) LIKE UPPER('%게시판%')) )AND category='C
  AND deleted='N';---#{CON} 
*/
  
 /*
      rn 게시판내에서 글넘버
      write 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      btrainer 태그된 트레이너 
      category 게시판성격       
  */
    
   
   
   
   
-----공지
--id=notisIdSearch
SELECT * -- 작성자 아이디로 검색 -공지
FROM ttdboard
WHERE (UPPER(writer) LIKE UPPER(%#{ID}%) AND category='N')
  AND deleted='N';
   
SELECT *
FROM ttdboard
WHERE (UPPER(writer) LIKE UPPER('%AD%') AND category='N')---#{ID}
  AND deleted='N';  
  */
 
 /*
      rn 게시판내에서 글넘버
      write 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      btrainer 태그된 트레이너 
      category 게시판성격       
  */
   
 
 
 
 
 --id=notisConSearch
  SELECT *---제목,내용 검색 -공지
FROM ttdboard
WHERE ((UPPER(contents) LIKE UPPER(%#{CON}%)) 
   OR (UPPER(title) LIKE UPPER(%#{CON}%)) )AND category='N'
  AND deleted='N';
/*SELECT *
FROM ttdboard
WHERE ((UPPER(contents) LIKE UPPER('%제목%')) 
   OR (UPPER(title) LIKE UPPER('%제목%')) )AND category='N'--#{CON}
  AND deleted='N';
*/
 /*
      rn 게시판내에서 글넘버
      writer 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      category 게시판성격   
  */
   
 
 
   
---------------
 
 --게시글 읽기
 --id=selectData  
 SELECT *
 FROM ttdboard
 WHERE dataNum =#{dataNum};--게시글고유넘버
 
 SELECT *
 FROM ttdboard
 WHERE dataNum ='10000';*/
 
 /*
      rn 게시판내에서 글넘버
      writer 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      category 게시판성격   
  */
   
  
---------------
 
 
 --id=CategorySearch  
 SELECT *
 FROM ttdboard
 WHERE btrainer = #{btrainer}
   AND deleted='N';
/*
 SELECT *
 FROM ttdboard
 WHERE id ='10000';*/
 
  /*
      rn 게시판내에서 글넘버
      write 글작성자
      dataNum 해당 글의 고유 넘버
      title 글제목
      contents 글내
      writedate 글쓴날짜
      conut 조회수
      liked 추천수
      recommend 덧글수
      btrainer 태그된 트레이너 
      category 게시판성격       
  */
   
   