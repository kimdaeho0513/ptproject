<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../module/nav.jsp"%>
<meta charset="UTF-8">
</head>
<body class="body">
<div style="text-align:center;margin: 200px 0px; color:white; font-size:25px;">
	<c:if test="${not empty sessionScope.findId}">
		${sessionScope.findId.name}님의 아이디는 ${sessionScope.findId.userid} 입니다.

		<br><a href="./login">로그인</a>
	</c:if>
	</div>
</body>
</html>