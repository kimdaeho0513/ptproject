<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<%@ include file="../module/nav.jsp"%>

<style>

.mb-1{
	color: white;
}
.table{
	color: white;
}
</style>
</head>
<body class="body">
<section class="container">
	<div class="mb-1">
		<c:if test="${category eq 'ALL' }">	
			<form action="./board/search" method="get">
				<div class="row g-1">
					<h1>전체 게시판 검색</h1>
					<div class="col-3">
						<input type="hidden" name="category" value="ALL"> 
							<select name="type" class="form-select">
								<option value="title">제목+내용</option>
								<option value="id">아이디</option>
								<option value="tag">태그</option>
							</select>
						</div>	
						<div class="input-group">	
							<input type="text" name="keyword">
							<button class="btn btn-secondary" type="submit">검색</button>
						</div>	
					</div>
				</form>
			</div>
			
		<div>
			<c:url value="/board?category=" var="boardsURL" />
			<table>
				<tr>
					<td onclick="location.href='${boardsURL}C'">문의</td>
					<td onclick="location.href='${boardsURL}N'">공지</td>
					<td onclick="location.href='${boardsURL}I'">정보</td>
					<td onclick="location.href='${boardsURL}R'">후기</td>
				</tr>
			</table>
		</div>
	</c:if>
	<div class="mb-1">
		<form action="./board/search" method="get">
			<h1>게시판 내 검색</h1>
				<div class="row g-1" >
					<div class="col-1" >
						<input type="hidden" name="category" value="${category}"> 
						<select name="type" class="form-select" >
							<option value="id">아이디</option>
							<option value="tag">태그</option>
							<option value="title">제목+내용</option>
						</select>
					</div>
						<div class="col-3">
							<div class="input-group">
					<input class="form-control" type="text" name="keyword">
					<button class="btn btn-secondary" type="submit">검색</button>
						</div>
					</div>
				</div>
				
				
				<!--  전체리뷰게시판 전부 주석처리 
		<c:choose>
				<c:when test="${category eq 'R'}">
					<table>
						<c:if test="${not empty Tdata}">
							<tr>	
								<td onclick="location.href='${boardsURL}R'">전체 리뷰게시판</td>
								<c:forEach items="${Tdata}" var="Tdata">							
									<c:url var="boardTranerUrl" value="/board">
										<c:param name="category">${category}</c:param>
										<c:param name="usersCode">${Tdata.userscode} </c:param>
									</c:url>
									<td onclick="location.href='${boardTranerUrl}'">${Tdata.name}</td>
								</c:forEach>								
							</tr>
								
						</c:if>
					</table>
					</c:when>
					<c:otherwise>
						&nbsp;
					</c:otherwise>
				</c:choose>
				-->
			</form>
		</div>
		<table class="table table-hover">
			<colgroup>
				<col class="col-1">
				<col class="col-4">
				<col class="col-2">
				<col class="col-1">
				<col class="col-1">
				
			</colgroup>
			<thead>
				<tr>
					<th>&nbsp;</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach items="${datas}" var="Rdata">
				<c:url var="boardListUrl" value="/board/detail">
					<c:param name="category">${category}</c:param>
					<c:param name="dataNum">${Rdata.dataNum}</c:param>
				</c:url>
				<c:url var="userBoard" value="/board/search">
					<c:param name="category">ALL</c:param>
					<c:param name="type">id</c:param>
					<c:param name="keyword">${Rdata.writer}</c:param>
				</c:url>
				<tr>
					<td>${Rdata.dataNum}</td>
					<td onclick="location.href='${boardListUrl}'">
						${Rdata.title}
						<c:if test="${Rdata.recommend >= 1}">
							<i>[${Rdata.recommend}]<i></i>
						</c:if>
					</td>
					<td onclick="location.href='${userBoard}'">${Rdata.writer}</td>
					<td>${Rdata.conut}</td>
					<td>${Rdata.writedate}</td>
				</tr>
			</c:forEach>
				
			</tbody>
		</table>
		<div class="row g-1">
				<div class="col-1">	
					<c:choose>
						<c:when test="${category ne 'N' or sessionScope.loginData.roles eq'A'}">
							<form action="./board/add" method="get">
								<div>
									<c:url var="boardUrl" value="./board"/>
									<c:if test="${not empty sessionScope.loginData.userid}">	
										<button class="btn btn-secondary" type="submit" onclick="location.href='${boardUrl}/add'"><input type="hidden" name="category" value="${category}">추가</button>
									</c:if>
								</div>
							</form>
						</c:when>
					</c:choose>
				</div>
			</div>
		<aside>
			
		</aside>
	<nav>
		<div>
			<ul class="pagination justify-content-center">
				<c:if test="${pageData.hasPrevPage()}">
					<c:url var="boardPagingUrl" value="/board">
						<c:param name="category">${category}</c:param>
						<c:if test="${not empty usersCode}">
							<c:param name="usersCode">${usersCode}</c:param>
						</c:if>							
					</c:url>
					<li class="page-item">
						<a class="page-link" href="${boardPagingUrl}&page=1"><<</a>
					</li>
					<li class="page-item"><a class="page-link"
						href="${boardPagingUrl}&page=${pageData.prevPageNumber}">Prev</a>
					</li>
				</c:if>
				<c:choose>
					<c:when test="${pageData.currentPageNumber eq 1}">
						<c:forEach
							items="${pageData.getPageNumberList(pageData.currentPageNumber - 3, pageData.currentPageNumber + 4)}"
							var="num">
							<c:url var="boardPagingUrl" value="/board">
								<c:param name="category">${category}</c:param>
								<c:if test="${not empty usersCode}">
									<c:param name="usersCode">${usersCode}</c:param>
								</c:if>						
							</c:url>
		
							<li
								class="page-item ${pageData.currentPageNumber eq num ? 'active' : ''}">
								<a class="page-link" href="${boardPagingUrl}&page=${num}">${num}</a>
							</li>
						</c:forEach>
					</c:when>
					
					
					<c:when test="${pageData.currentPageNumber eq 2}">
						<c:forEach
							items="${pageData.getPageNumberList(pageData.currentPageNumber - 3, pageData.currentPageNumber + 3)}"
							var="num">
							<c:url var="boardPagingUrl" value="/board">
								<c:param name="category">${category}</c:param>
								<c:if test="${not empty usersCode}">
									<c:param name="usersCode">${usersCode}</c:param>
								</c:if>						
							</c:url>
							<li
								class="page-item ${pageData.currentPageNumber eq num ? 'active' : ''}">
								<a class="page-link" href="${boardPagingUrl}&page=${num}">${num}</a>
							</li>
						</c:forEach>
					</c:when>
					
					<c:when test="${pageData.currentPageNumber eq pageData.lastPage}">
							<c:forEach
								items="${pageData.getPageNumberList(pageData.currentPageNumber - 4, pageData.currentPageNumber + 2)}"
								var="num">								
								<c:url var="boardPagingUrl" value="/board">
									<c:param name="category">${category}</c:param>
									<c:if test="${not empty usersCode}">
										<c:param name="usersCode">${usersCode}</c:param>
									</c:if>	
								</c:url>
								<li
									class="page-item ${pageData.currentPageNumber eq num ? 'active' : ''}">
									<a class="page-link" href="${boardPagingUrl}&page=${num}">${num}</a>
								</li>
							</c:forEach>
						</c:when>
					
						<c:when test="${pageData.currentPageNumber eq pageData.lastPage-1}">
							<c:forEach
								items="${pageData.getPageNumberList(pageData.currentPageNumber - 3, pageData.currentPageNumber + 2)}"
								var="num">			
								<c:url var="boardPagingUrl" value="/board">
									<c:param name="category">${category}</c:param>
									<c:if test="${not empty usersCode}">
										<c:param name="usersCode">${usersCode}</c:param>
									</c:if>	
								</c:url>
								<li
									class="page-item ${pageData.currentPageNumber eq num ? 'active' : ''}">
									<a class="page-link" href="${boardPagingUrl}&page=${num}">${num}</a>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach
								items="${pageData.getPageNumberList(pageData.currentPageNumber - 2, pageData.currentPageNumber + 2)}"
								var="num">
								<c:url var="boardPagingUrl" value="/board">
									<c:param name="category">${category}</c:param>
									<c:if test="${not empty usersCode}">
										<c:param name="usersCode">${usersCode}</c:param>
									</c:if>						
								</c:url>
								<li
									class="page-item ${pageData.currentPageNumber eq num ? 'active' : ''}">
									<a class="page-link" href="${boardPagingUrl}&page=${num}">${num}</a>
								</li>
							</c:forEach>
						</c:otherwise>			
					</c:choose>
				<c:if test="${pageData.hasNextPage()}">
					<li class="page-item"><a class="page-link"
						href="${boardPagingUrl}&page=${pageData.nextPageNumber}">Next</a>
					</li>
					<li class="page-item"><a class="page-link"
						href="${boardPagingUrl}&page=${pageData.lastPage}">>>></a>
					</li>
				</c:if>
			</ul>
		</div>
	</nav>
	</section>
</body>
</html>