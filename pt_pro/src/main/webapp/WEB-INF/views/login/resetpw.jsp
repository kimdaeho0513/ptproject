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
<h1>비밀번호 변경</h1>
	<form action="./resetpw" method="post">
		새 비밀번호: <input type="text" name="pw" /><br>
		비밀번호 확인: <input type="text" name="pw_chk" /><br>
		<button type="submit">확인</button>
		<input type="hidden" name="id" value="${sessionScope.findPw.id}"/>
	</form>
</body>
</html>