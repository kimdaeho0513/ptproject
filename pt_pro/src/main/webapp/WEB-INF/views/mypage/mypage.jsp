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

</head>
<body>
<form>
	<span>아이디 :</span> <input type="text" name="userid" value="${sessionScope.loginData.userid}" readonly><br>
	<span>비밀번호 : </span> <input type="text" name="pw" value="${sessionScope.loginData.pw}"><br>
	<span>이름 : </span> <input type="text" name="name" value="${sessionScope.loginData.name}"><br>
	<span>생년월일 : </span><input type="date" name="birth" value="<fmt:formatDate value="${sessionScope.loginData.birth}" pattern="yyyy-MM-dd"/>"><br>
	<span>핸드폰번호 : </span><input type="text" name="phone" value="${sessionScope.loginData.phone}"><br>
	<span>이메일 : </span><input type="text" name="email" value="${sessionScope.loginData.email}"><br>
	<span>성별 : </span><input type="text" name="gender" value="${sessionScope.loginData.gender}"><br>
	
	<input type="submit" value="수정" formaction="./update">
	<input type="submit" value="삭제" formaction="./delete">
</form>
</body>
</html>