<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %>
<% request.setCharacterEncoding("UTF-8");
%>
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
	<%@ include file="../module/head.jsp" %>
</head>
<body>
		<form name="form1" class="container"  method="post" accept-charset="utf-8">
		<div class="row justify-content-center" >
			<input hidden type="text" id="mngNum" name="mngNum" value="${All.mngNum}">
			<div class="row justify-content-center" style="width:400px;font-size:20px;" >
				<label>아이디</label>
				<input type="text" id="id" name="mngId" value="${All.mngId}" readonly><hr>
				<label>비밀번호</label>
				<input type="text" id="pass" name="mngPass" value="${All.mngPass}"><hr>
				<label>이름</label>
				<input type="text" id="name" name="mngName" value="${All.mngName}" readonly><hr>
				<label>생년월일</label>
				<input type="text" id="birth" name="mngBirth" value="${All.mngBirth}"><hr>
				<label>이메일</label>
				<input type="text" id="email" name="mngEmail" value="${All.mngEmail}"><hr>
				<label>휴대전화</label>
				<input type="text" id="phone" name="mngPhone" value="${All.mngPhone}"><hr>
				<label>성별</label>
				<input type="text" id="gender" name="mngGender" value="${All.mngGender}" readonly><hr>
				
				<c:if test="${All.mngRole == 'M'}">
					<label>PT남은횟수</label>
					<input type="text"  id="count" name="memCount" value="${All.memCount}"><hr>
					<label>담당트레이너</label>
					<!-- <input type="text" id="pt" name="memPt" value="${All.memPt}"><hr> -->
					<select class="form-select" name="memPt" style="font-size:20px;">
						<c:forEach var="managementDTO" items="${listTrainer}">
							 <option value="${managementDTO.mngNum}" ${managementDTO.mngNum eq All.memPt ? 'selected' : ''}>${managementDTO.mngName}</option>
		  				</c:forEach>
					</select><hr>
				</c:if>
				 <div class="row justify-content-evenly align-items-center my-row">
					<input class="col-sm-5 my-col" type="submit" value="수정" id="btnUpdate"></button>
					<input class="col-sm-5 my-col" type="submit" value="삭제" id="btnDelete"></button>
				</div>
			</div>
		</div>	
	</form>	
	<script type="text/javascript">
		$(function(){
			$("#btnUpdate").click(function(){
				//확인 대화상자
				if(confirm("수정하시겠습니까?")){
					document.form1.action ="${path}/pt/management/modify";
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
				document.form1.action ="${path}/pt/management/delete";
				document.form1.submit();
				}else {//취소시
					return false;
				}
			});
		});		
	</script>
</body>
</html>


