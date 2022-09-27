<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../module/nav.jsp"%>
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
<title>마이페이지</title>
<style>
input[type="text"]{
	width:100%;
}
input[type="date"]{
	width:100%;
}
.body{
 	padding-top:100px;
 	color:white;
}
.form-center {
 	color: white;
 	width: 300px;
  	margin-left: auto;
  	margin-right: auto;
}
.md-4 {
	font-weight : bold;
	font-size : 20px;
}
</style>
</head>
<body class="body">
<div class="container">
<div class="col-md-4" style="float: none; margin:0 auto;">
<h4 class="md-4 text-center">회원 정보 수정</h4>
<form name="form1" method="post" accept-charset="utf-8">
<div class="md-4">
	<label>아이디</label><br>
	<input class="rounded form-control-lg" type="text" name="userid" value="${sessionScope.loginData.userid}" readonly><br>
	<label>비밀번호</label><br>
	<input class="rounded form-control-lg" type="text" name="pw" value="${sessionScope.loginData.pw}"><br>
	<label>이름</label><br>
	<input class="rounded form-control-lg" type="text" name="name" value="${sessionScope.loginData.name}"><br>
	<label>생일</label><br>
	<input class="rounded form-control-lg" type="date" name="birth" value="<fmt:formatDate value="${sessionScope.loginData.birth}" pattern="yyyy-MM-dd"/>"><br>
	<label>휴대폰 번호</label><br>
	<input class="rounded form-control-lg" type="text" name="phone" value="${sessionScope.loginData.phone}"><br>
	<label>이메일</label><br>
	<input class="rounded form-control-lg" type="text" name="email" value="${sessionScope.loginData.email}"><br>
	<label>성별</label><br>
	<input class="rounded form-control-lg" type="text" name="gender" value="${sessionScope.loginData.gender}"><br><br>

<%-- 	<label>pt 남은 횟수</label><br>
	<input class="rounded form-control-lg" type="text" name="ptcount" value="${sessionScope.loginData.ptcount}" readonly><br> --%>
	
	<!-- <input class="btn btn-danger" style="float:right" type="submit" value="삭제" formaction="./delete">
	<input class="btn btn-primary" style="float:right" type="submit" value="수정" formaction="./update"> -->
	
	<input class="btn btn-danger" style="float:right" type="submit" value="탈퇴" id="btnDelete">
	<input class="btn btn-primary" style="float:right" type="submit" value="수정" id="btnUpdate">
</form>
</div>
</div>
<script type="text/javascript">
		$(function(){
			$("#btnUpdate").click(function(){
				//확인 대화상자
				if(confirm("수정하시겠습니까?")){
					document.form1.action ="./update";
					document.form1.submit();
				}else {//취소시
					return false;
				}
			});
		});
		$(function(){
			$("#btnDelete").click(function(){
			//확인 대화상자
			if(confirm("탈퇴하시겠습니까?")){
				document.form1.action ="./delete";
				document.form1.submit();
				}else {//취소시
					return false;
				}
			});
		});		
	</script>
</body>
</html>