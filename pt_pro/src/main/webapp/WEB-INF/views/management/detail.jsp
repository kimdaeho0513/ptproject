<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:url var="bs5" value="/static/bs5" />
<c:url var="jQuery" value="/static/js" />
<link rel="stylesheet" type="text/css" href="${bs5}/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript" src="${bs5}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${jQuery}/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원상세페이지</title>
</head>
<body>

<h1>${data.mngName}11</h1>
	<section class="container">
		<div class="mt-3">
			<label >아이디</label><hr>
			<input type="text" id="id" value="${data.mngId}"><hr>
			<label>비밀번호</label><hr>
			<input type="text" id="pass" value=""><hr>
			<label>이름</label><hr>
			<input type="text" id="name" value=""><hr>
			<label>생년월일</label><hr>
			<input type="text" id="birth" value=""><hr>
			<label>이메일</label><hr>
			<input type="text" id="email" value=""><hr>
			<label>휴대전화</label><hr>
			<input type="text" id="phon" value=""><hr>
			<label>성별</label><hr>
			<input type="text" id="gender" value=""><hr>
			<label>PT남은횟수</label><hr>
			<input type="text" id="count" value=""><hr>
			<label>담당트레이너</label><hr>
			<input type="text" id="pt" value=""><hr>
			
			<div style="width:200px; height:150px; border:1px solid red; float:left; margin-right:10px;">
				<button onclick="location.href='${managementUrl}'">수정</button>
			</div>
			<div style="width:200px; height:150px; border:1px solid green; float:left;">
				<button onclick="location.href='${managementUrl}'">회원 삭제</button>
			</div>
		</div>	
	</section>

</body>
</html>