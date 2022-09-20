<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<%@ include file="./resources/login_header.jsp"%>
<style>
<%@ include file="./resources/signin.css"%>
</style>
</head>
<body class="text-center">
	<main class="form-signin">
		<h1 class="h3 mb-3 fw-normal">비밀번호 찾기</h1>
		<form action="./findpw" method="post">
			<div class="form-floating">
		      <input type="text" class="form-control" id="floatingInput" placeholder="이름" name="name">
		      <label for="floatingInput">이름</label>
		    </div>
		    <div class="form-floating">
		      <input type="text" class="form-control" id="floatingInput" placeholder="아이디" name="userid">
		      <label for="floatingInput">아이디</label>
		    </div>
		    <div class="form-floating">
		      <input type="email" class="form-control" id="floatingInput" placeholder="이메일" name="email">
		      <label for="floatingInput">이메일</label>
		    </div>
		    <div class="mb-3">
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">인증번호 전송</button>
		</form>
	</main>
</body>
</html>