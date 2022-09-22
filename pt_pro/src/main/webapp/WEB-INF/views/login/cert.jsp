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

<title>비밀번호 찾기</title>
<%@ include file="./resources/login_header.jsp"%>
<style>
<%@ include file="./resources/signin.css"%>
</style>
<script type="text/javascript">
		$(document).ready(function(){
			let message = "${msg}";
	        if (message != "") {
	            alert(message);
	        }
			
			$("#submit").on("click", function(){
				if($("#floatingInput").val()==""){
					alert("인증번호를 입력해주세요.");
					$("#floatingInput").focus();
					return false;
				}
			});
		})
</script>
</head>
	<body class="text-center">
		<main class="form-signin">
			<form method="post" action="./cert">
				<div class="mb-3">
					메일로 발송된 인증번호를 입력해주세요.
				</div>
				<div class="form-floating">
			      <input type="text" class="form-control" id="floatingInput" name="usercert">
			    </div>
				<div class="mb-3">
				</div>
				<button class="w-100 btn btn-lg btn-primary" type="submit" id="submit">확인</button>
			</form>
		</main>
	</body>
</html>