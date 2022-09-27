<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

<title>로그인</title>
<%@ include file="../module/nav.jsp"%>
<%@ include file="./resources/login_header.jsp"%>
<style>
<%@ include file="./resources/signin.css"%>
</style>
<script type="text/javascript">
		$(document).ready(function(){
			$("#submit").on("click", function(){
				if($("#floatingInput").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#floatingInput").focus();
					return false;
				}
				if($("#floatingInput").val() != $("#floatingPassword").val()){
		            alert("비밀번호가 일치하지 않습니다.");
		            $("#floatingPassword").focus();
		            return false;
		          }
			});
		})
</script>
</head>
<body class="body text-center">
	<main class="form-signin">
		<h1 class="h3 mb-3 fw-normal">비밀번호 변경</h1>
		<form action="./resetpw" method="post">
			<div class="form-floating">
		      <input type="text" class="form-control" id="floatingInput" placeholder="새 비밀번호" name="pw">
		      <label for="floatingInput">새 비밀번호</label>
		    </div>
		    <div class="form-floating">
		      <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호 확인" name="pw_chk">
		      <label for="floatingPassword">비밀번호 확인</label>
		    </div>
		    <div class="mb-3"></div>
			<button class="w-100 btn btn-lg btn-warning" type="submit" id="submit">확인</button>
				    
			<input type="hidden" name="id" value="${sessionScope.findPw.userid}"/>

		</form>
	</main>
</body>
</html>