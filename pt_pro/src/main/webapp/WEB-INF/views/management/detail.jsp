<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %>
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


<h1>${data.mngName}</h1>
		<form name="form1" method="post">
		<div class="mt-3">
			<input hidden type="text" id="mngNum" name="mngNum" value="${data.mngNum}">
			<label >아이디</label><hr>
			<input type="text" id="id" name="id" value="${data.mngId}"><hr>
			<label>비밀번호</label><hr>
			<input type="text" id="pass" name="pass" value="${data.mngPass}"><hr>
			<label>이름</label><hr>
			<input type="text" id="name" name="name" value="${data.mngName}"><hr>
			<label>생년월일</label><hr>
			<input type="text" id="birth" name="birth" value="${data.mngBirth}"><hr>
			<label>이메일</label><hr>
			<input type="text" id="email" name="email" value="${data.mngEmail}"><hr>
			<label>휴대전화</label><hr>
			<input type="text" id="phone" name="phone" value="${data.mngPhone}"><hr>
			<label>성별</label><hr>
			<input type="text" id="gender" name="gender" value="${data.mngGender}"><hr>
			
			<c:if test="${data.mngRole == 'M'}">
				<label>PT남은횟수</label><hr>
				<input type="text" id="count" name="count" value="${datas.memCount}"><hr>
				<label>담당트레이너</label><hr>
				<input type="text" id="pt" name="pt" value="${datas.memPt}"><hr>
			</c:if>
			
			<div style="width:200px; height:150px; border:1px solid red; float:left; margin-right:10px;">
				<input type="button" value="수정" id="btnUpdate"></button>
			</div>
			<div style="width:200px; height:150px; border:1px solid green; float:left;">
				<input type="submit" value="삭제" id="btnDelete"></button>
			</div>
		</div>	
	</form>	
	<script type="text/javascript">
		$(function(){
			$("#btnUpdate").click(function(){
				//확인 대화상자
				if(confirm("수정하시겠습니까?")){
					document.form1.action = "${managementModifyUrl}";
					document.form1.submit();
				}
			});
		});
		$(function(){
			$("#btnDelete").click(function(){
			//확인 대화상자
			if(confirm("탈퇴하시겠습니까?")){
				document.form1.action ="${path}/pt/management/delete";
				document.form1.submit();
				}
			});
		});		
	</script>
</body>
</html>


