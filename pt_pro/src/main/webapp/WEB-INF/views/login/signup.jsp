<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<form action="./signup" method="post">
	이름 <input type="text" name="name" /><br>
	아이디 <input type="text" name="id" /> <button>중복확인</button> <br>
	비밀번호 <input type="text" name="pw" /><br>
	비밀번호 확인 <input type="text" name="pw_chk" /><br>
	이메일 <input type="text" name="email" /><br>
	핸드폰번호 <input type="text" name="phone" /><br>
	생년월일 <input type="text" name="birth" /><br>
	성별 <input type="radio" name="gender" value="M" />남 
	<input type="radio" name="gender" value="F" />여<br>
	<button type="submit">가입하기</button>
</form>
</body>
</html>