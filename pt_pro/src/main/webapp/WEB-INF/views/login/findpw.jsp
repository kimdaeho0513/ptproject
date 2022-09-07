<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>비밀번호 찾기</h1>
<form action="./findpw" method="post">
	이름 <input type="text" name="name"/><br>
	아이디 <input type="text" name="id"/><br>
	이메일 <input type="text" name="email"/>
	<button type="submit">인증번호 전송</button><br>
	인증번호 <input type="text" name="cert"/><br>
	<button type="submit">확인</button>
</form>
</body>
</html>