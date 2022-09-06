<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/update">
	<span>아이디 :</span> <input type="text" id="id" value="${data.id}" readonly><br>
	<span>비밀번호 : </span> <input type="text" id="password" value="${data.password}"><br>
	<span>이름 : </span> <input type="text" id="name" value="${data.name}"><br>
	<span>생년월일 : </span><input type="text" id="name" value="${data.birth}"><br>
	<span>핸드폰번호 : </span><input type="text" id="name" value="${data.phonenumber}"><br>
	<span>이메일 : </span><input type="text" id="name" value="${data.email}"><br>
	<span>성별 : </span><input type="text" id="name" value="${data.gender}"><br>
	<button type="submit">수정</button><br>
		</form>
		<form action="/delete">
			<button type="submit">탈퇴</button>
	</form>
</body>
</html>