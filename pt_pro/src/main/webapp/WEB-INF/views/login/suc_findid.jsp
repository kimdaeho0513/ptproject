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
	<c:if test="${not empty sessionScope.findId}">
<<<<<<< HEAD
		${sessionScope.findId.name}님의 아이디는 ${sessionScope.findId.userid} 입니다.
=======
		${sessionScope.findId.name}님의 아이디는 ${sessionScope.findId.id} 입니다.
>>>>>>> refs/remotes/origin/양효진
		<br><a href="./login">로그인</a>
	</c:if>
</body>
</html>