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
		<c:if test="${empty sessionScope.loginData}">
			<h1 class="h3 mb-3 fw-normal">로그인</h1>
			<form action="./login" method="post">
				<div class="form-floating">
			      <input type="text" class="form-control" id="floatingInput" placeholder="아이디" name="id">
			      <label for="floatingInput">아이디</label>
			    </div>
			    <div class="form-floating">
			      <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호" name="pw">
			      <label for="floatingPassword">비밀번호</label>
			    </div>
			
			    <div class="radio mb-3">
			      <label>
			        <input type="radio" value="T" name="role"> trainer <input type="radio" value="M" name="role"> member
			      </label>
			    </div>
			    <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
			    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
				
			</form>
			<a href="./findid">아이디 찾기</a> | 
			<a href="./findpw">비밀번호 찾기</a> | 
			<a href="./signup">회원가입</a>
		</c:if>
		<c:if test="${not empty sessionScope.loginData}">
			${sessionScope.loginData.userid} 님 환영합니다.
	
			<br><a href="./logout">로그아웃</a>
		</c:if>
	</main>
</body>
</html>