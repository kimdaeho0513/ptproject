<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
input{
	width:100%;
}
</style>
</head>
<body>
<div class="container">
<div class="col-md-4" style="float: none; margin:0 auto;">
<h4 class="md-4 text-center">회원 정보 수정</h4>
<form>
<div class="md-4">
<div class="md-4">
	<label>아이디</label><br>
	<input class="rounded form-control-lg box-sizing:border-box" type="text" name="userid" value="${sessionScope.loginData.userid}" readonly><br><br>
</div>
<div>
	<label>비밀번호</label><br>
	<input class="rounded form-control-lg" type="text" name="pw" value="${sessionScope.loginData.pw}"><br><br>
</div>
	<label>이름</label><br>
	<input class="rounded form-control-lg" type="text" name="name" value="${sessionScope.loginData.name}"><br><br>
	<label>생일</label><br>
	<input class="rounded form-control-lg" type="date" name="birth" value="<fmt:formatDate value="${sessionScope.loginData.birth}" pattern="yyyy-MM-dd"/>"><br><br>
	<label>휴대폰 번호</label><br>
	<input class="rounded form-control-lg" type="text" name="phone" value="${sessionScope.loginData.phone}"><br><br>
	<label>이메일</label><br>
	<input class="rounded form-control-lg" type="text" name="email" value="${sessionScope.loginData.email}"><br><br>
	<label>성별</label><br>
	<input class="rounded form-control-lg" type="text" name="gender" value="${sessionScope.loginData.gender}"><br><br>
	
	<input class="btn btn-danger" style="float:right" type="submit" value="삭제" formaction="./delete">
	<input class="btn btn-primary" style="float:right" type="submit" value="수정" formaction="./update">
</div>
</form>
</div>
</div>
</body>
</html>