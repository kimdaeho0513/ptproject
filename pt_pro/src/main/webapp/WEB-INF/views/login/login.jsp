<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/nav.jsp"%>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
		
<title>로그인</title>
<%@ include file="./resources/login_header.jsp"%>
<style>
<%@ include file="./resources/signin.css"%>

.h3, .radio, .mt-5, a{
	color:white;
}
</style>
<script type="text/javascript">
		$(document).ready(function(){
			let message = "${msg}";
	        if (message != "") {
	            alert(message);
	        }
	        
			$("#submit").on("click", function(){
				if($("#floatingInput").val()==""){
					alert("아이디를 입력해주세요.");
					$("#floatingInput").focus();
					return false;
				}
				if($("#floatingPassword").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#floatingPassword").focus();
					return false;
				}
				if($("input[name=role]:radio:checked").length < 1){
					alert("사용자 선택을 해주세요.");
					return false;
				}
			});
		})
</script>

<body class="body text-center">
	<main class="form-signin">
<section>
	
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
			    <br>
			    <button class="w-100 btn btn-lg btn-primary" type="submit" id="submit">로그인</button>
			    <br>
				
			</form>
			<a href="./findid">아이디 찾기</a> | 
			<a href="./findpw">비밀번호 찾기</a> | 
			<a href="./signup">회원가입</a>
		</c:if>
		<c:if test="${not empty sessionScope.loginData}">
			${sessionScope.loginData.userid} 님 환영합니다.
	
			<br><a href="./logout">로그아웃</a>
		</c:if>
	</section>
	</main>
</body>
</html>