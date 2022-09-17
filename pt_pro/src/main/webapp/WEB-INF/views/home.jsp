<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
	<title>Home</title>
	

</head>
<body>
	<h1>Hello world! </h1>

	<P>  The time on the server is ${serverTime}. 확인중</P>
	<c:if test="${not empty sessionScope.loginData}">
		<button type="button" onclick="location.href='/pt/mypage'">마이페이지</button>
	</c:if>
	<c:if test="${empty sessionScope.loginData}">
		<button type="button" onclick="location.href='/pt/login'">로그인</button>
	</c:if>
	<button type="button" onclick="location.href='/pt/management'">회원조회 테스트</button>
<h1>회원 조회</h1>


</body>
</html>
