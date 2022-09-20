<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="./resources/login_header.jsp"%>
<style>
<%@ include file="./resources/signin.css"%>
</style>
</head>
<body class="text-center">
	<main class="form-signin">
		<h1 class="h3 mb-3 fw-normal">비밀번호 변경</h1>
		<form action="./resetpw" method="post">
			<div class="form-floating">
		      <input type="password" class="form-control" id="floatingPassword" placeholder="새 비밀번호" name="pw">
		      <label for="floatingPassword">새 비밀번호</label>
		    </div>
		    <div class="form-floating">
		      <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호 확인" name="pw_chk">
		      <label for="floatingPassword">비밀번호 확인</label>
		    </div>
		    <div class="mb-3"></div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">확인</button>
				    
			<input type="hidden" name="id" value="${sessionScope.findPw.userid}"/>

		</form>
	</main>
</body>
</html>