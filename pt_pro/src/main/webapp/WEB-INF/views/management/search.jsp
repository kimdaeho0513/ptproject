<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<title>전체 회원 조회 게시판</title>

</head>
<body>
	<h1>회원 조회</h1>
	<section class="container">
		<div class="mb-1">
			<c:url var="managementsearchUrl" value="/management/search" />
			<form action="${managementsearchUrl}/search" method="get">
				<div class="row g-1">
					<div class="col-3">
						<div class="input-group">
							<input class="form-control" type="text" name="search" >
							<button class="btn btn-secondary" name="btnSearch" value="search" type="submit">조회</button>
						</div>
					</div>
					<div class="col-1">
						<select class="form-select" onchange="location.href='${managementsearchUrl}?pageCount=' + this.value">
							<option value="5" ${sessionScope.pageCount == 5 ? 'selected' : ''}>5 개</option>
							<option value="10" ${sessionScope.pageCount == 10 ? 'selected' : ''}>10 개</option>
							<option value="15" ${sessionScope.pageCount == 15 ? 'selected' : ''}>15 개</option>
							<option value="20" ${sessionScope.pageCount == 20 ? 'selected' : ''}>20 개</option>
						</select>
					</div>
				</div>
			</form>
		</div>
		
		<table class="table table-hover">
			<colgroup>
				<col class="col-1">
				<col class="col-auto">
				<col class="col-2">
				<col class="col-1">
				<col class="col-1">
				<col class="col-2">
			</colgroup>
			<thead>
				<tr>
					<th>회원이름</th>
					<th>아이디</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty listSearch}">
					<c:forEach items="${listSearch}" var="data">
						<c:url var="managementDetailUrl" value="/management/detail">
							<c:param name="mngNum">${datas.mngNum}</c:param>
						</c:url>
						<tr onclick="location.href='${managementDetailUrl}'">
							<td>${listSearch.mngName}</td>
							<td>${listSearch.mngId}</td>
							<td>${listSearch.mngPhone}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<nav>
			<div>
				<ul class="pagination justify-content-center">
					<c:if test="${pageData.hasPrevPage()}">
						<li class="page-item">
							<a class="page-link" href="${managementsearchUrl}?page=${pageData.prevPageNumber}">Prev</a>
						</li>
					</c:if>
					<c:forEach items="${pageData.getPageNumberList(pageData.currentPageNumber - 2, pageData.currentPageNumber + 2)}" var="num">
						<li class="page-item ${pageData.currentPageNumber eq num ? 'active' : ''}">
							<a class="page-link" href="${managementsearchUrl}?page=${num}">${num}</a>
						</li>
					</c:forEach>
					<c:if test="${pageData.hasNextPage()}">
						<li class="page-item">
							<a class="page-link" href="${managementsearchUrl}?page=${pageData.nextPageNumber}">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
		</nav>
	</section>
	<script>  
	$(function(){
		$("#btnSearch").click(function(){
			if(search.value.trim() === ""){
				return;
			}
				//document.form1.action ="${path}/pt/management/search?keyword=" + keyword + "&btnSearch=" + btnSearch;
				document.form1.action = "${path}/pt/management/search"
				document.form1.submit();
		});
	});
	</script>
</body>
</html>