<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty sessionScope.loginData}">
		<h1>login</h1>
		<form action="./login" method="post">
			아이디 <input type="text" name="id" /><br>
			비밀번호 <input type="password" name="pw" /><br>
			<input type="radio" name="role" value="T"> trainer 
			<input type="radio" name="role" value="M"> member<br>
			<button type="submit">login</button>
		</form>
		<a href="./findid">아이디 찾기</a> | 
		<a href="./findpw">비밀번호 찾기</a> | 
		<a href="./signup">회원가입</a>
	</c:if>
	<c:if test="${not empty sessionScope.loginData}">
		${sessionScope.loginData.userid} 님 환영합니다.

		<br><a href="./logout">로그아웃</a>
	</c:if>
</body>
</html>