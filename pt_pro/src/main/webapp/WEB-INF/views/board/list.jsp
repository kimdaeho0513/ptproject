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
<div>
	<select>
		<option value="${sessionScope.type = title}">제목+내용</option>
		<option value="${sessionScope.type = id}">아이디</option>
	</select>
	<input type="text">
	<button type ="submit" onchange="location.href=''">검색</button>
</div>
	<section>
		<table>
			<colgroup>
				<col class="col-auto">
				<col class="col-auto">
				<col class="col-auto">
				<col class="colauto1">
				<col class="col-auto">
				<col class="col-auto">
				<col class="col-auto">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>conut</th>
					<th>liked</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty datas}">
					<c:forEach items="${datas}" var="data">
						<c:url var="boardDetailUrl" value="/board/detail">
							<c:param name="id">${data.dataNum}</c:param>
						</c:url>
						<tr onclick="location.href='${boardDetailUrl}'">
							<td>${data.dataNum}</td>
							<td>${data.title}</td>
							<td>${data.writer}</td>
							<td>${data.conut}</td>
							<td>${data.recommned}</td>
							<td>${data.liked}</td>
							<td>${data.writedate}</td>
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
							<a class="page-link" href="${boardUrl}?page=${pageData.prevPageNumber}">Prev</a>
						</li>
					</c:if>
					<c:forEach items="${pageData.getPageNumberList(pageData.currentPageNumber - 2, pageData.currentPageNumber + 2)}" var="num">
						<li class="page-item ${pageData.currentPageNumber eq num ? 'active' : ''}">
							<a class="page-link" href="${boardUrl}?page=${num}">${num}</a>
						</li>
					</c:forEach>
					<c:if test="${pageData.hasNextPage()}">
						<li class="page-item">
							<a class="page-link" href="${boardUrl}?page=${pageData.nextPageNumber}">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
		</nav>
	</section>
</body>
</html>