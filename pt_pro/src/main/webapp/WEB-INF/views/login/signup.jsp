<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<%@ include file="./resources/importfile.jsp"%>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
	/*$(document).ready(function(){
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
		})*/
		
		function fn_idChk(){
			$.ajax({
				url : "./idChk",
				type : "POST",
				dataType : "json",
				data : {"userid" : $("#userid").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>
<body>
<h1>회원가입</h1>
<form action="./signup" method="post" id="regForm">
	이름 <input type="text" name="name" /><br>
	아이디 <input type="text" name="userid" id="userid"/>
	<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button><br>
	비밀번호 <input type="text" name="pw" /><br>
	비밀번호 확인 <input type="text" name="pw_chk" /><br>
	이메일 <input type="text" name="email" /><br>
	핸드폰번호 <input type="text" name="phone" /><br>
	생년월일 <input type="text" name="birth" /><br>
	성별 <input type="radio" name="gender" value="M" />남 
	<input type="radio" name="gender" value="F" />여<br>
	<button type="submit">가입하기</button>
</form>
</body>
</html>