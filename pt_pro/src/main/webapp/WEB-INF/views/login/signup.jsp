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
		$(document).ready(function(){
			$("#submit").on("click", function(){
				if($("#name").val()==""){
					alert("이름을 입력해주세요.");
					$("#name").focus();
					return false;
				}
				if($("#userid").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userid").focus();
					return false;
				}
				if($("#pw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#pw").focus();
					return false;
				}
				if($("#pw").val() != $("#pw_chk").val()){
		            alert("비밀번호가 일치하지 않습니다.");
		            $("#pw_chk").focus();
		            return false;
		          }
				if($("#email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#email").focus();
					return false;
				}
				if($("#phone").val()==""){
					alert("핸드폰번호를 입력해주세요.");
					$("#phone").focus();
					return false;
				}
				
				if($("#birth").val()==""){
					alert("생년월일을 입력해주세요.");
					$("#bitrh").focus();
					return false;
				}
				var bCheck = RegExp(/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/);
				if(!bCheck.test($('#birth').val())){
					alert("생년월일은 \'yyyy-mm-dd\' 형식으로 입력해주세요");
				}
				if($("input[name=gender]:radio:checked").length < 1){
					alert("성별을 선택해주세요.");
					return false;
				}
			
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
					return false;
				}else if(idChkVal == "Y"){
					return true;
				}
			});
		})
		
		function fn_idChk(){
			$.ajax({
				url : "./idChk",
				type : "POST",
				dataType : "json",
				data : {"userid" : $("#userid").val()},
				success : function(data){
					if(data == 1){
						$("#idChk").attr("value", "N");
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>
	<style>
	<%@ include file="./resources/signin.css"%>
	</style>
<body>
<main class="form-signin">
	<div class="form-floating">
<h1 class="h3 mb-3 fw-normal">회원가입</h1>
		<form action="./signup" method="post" id="form">
			이름 <input class="form-control" type="text" name="name" id="name" /><br>
			아이디 <input class="form-control" type="text" name="userid" id="userid"/>
			<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button><br>
			비밀번호 <input class="form-control" type="password" name="pw"  id="pw"/><br>
			비밀번호 확인 <input class="form-control" type="password" name="pw_chk"  id="pw_chk"/><br>
			이메일 <input class="form-control" type="email" name="email"  id="email"/><br>
			핸드폰번호 <input class="form-control" type="text" name="phone"  id="phone"/><br>
			생년월일 <input class="form-control" type=text name="birth"  id="birth"/><br>
			성별 <input type="radio" name="gender" value="M"  id="gender"/>남 
			<input type="radio" name="gender" value="F"  id="gender"/>여<br>
			<button id="submit">가입하기</button>
		</form>
	</div>
</main>
</body>
</html>