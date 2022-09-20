<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<%@ include file="./resources/login_header.jsp"%>
<style>
<%@ include file="./resources/signin.css"%>
</style>
</head>
	<body class="text-center">
		<main class="form-signin">
			<h1 class="h3 mb-3 fw-normal">아이디 찾기</h1>
			<form action="./findid" method="post">
				<div class="form-floating">
			      <input type="text" class="form-control" id="floatingInput" placeholder="이름" name="name">
			      <label for="floatingInput">이름</label>
			    </div>
			    <div class="form-floating">
			      <input type="text" class="form-control" id="floatingInput" placeholder="핸드폰 번호" name="phone">
			      <label for="floatingInput">핸드폰 번호</label>
			    </div>
			    <div class="mb-3">
			    </div>
				<button class="w-100 btn btn-lg btn-primary" type="submit">확인</button>
			</form>
		</main>
	</body>
</html>