<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../module/head.jsp" %>
</head>
<body>
	<c:if test="${category eq 'ALL' }">
		<div>
			전체 게시판 검색
			<form action="./search" method="get">
				<div>
					<input type="hidden" name="category" value="ALL"> 
					<select name="type">
						<option value="title" ${type eq 'title' ? 'selected' : '' }>제목+내용</option>
						<option value="id" ${type eq 'id' ? 'selected' : '' }>아이디</option>
						<option value="tag" ${type eq 'tag' ? 'selected' : '' }>태그</option>
					</select>
					<input type="text" name="keyword">
					<button type="submit">전송</button>
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
	<section>	
		<form action="./search" method="get">			
			<div>
			검색
				<select name="type">
						<option value="title" ${type eq 'title' ? 'selected' : '' }>제목+내용</option>
						<option value="id" ${type eq 'id' ? 'selected' : '' }>아이디</option>
						<option value="tag" ${type eq 'tag' ? 'selected' : '' }>태그</option>
					</select>
				<input type="hidden" name="category" value="${category}">					
				<input type="text" name="keyword" value="${keyword}">
				<button type ="submit">전송</button>
			</div>
		</form>
		<table>
			<colgroup>
				<col class="col-1">
				<col class="col-4">
				<col class="col-2">
				<col class="col-1">
				<col class="col-1">
				<c:if test="${category eq 'ALL'}">
					<col class="col-3">
				</c:if>
			</colgroup>
			<thead> 
				<tr>
					<td colspan="6">
						<div>    
							<c:choose>  
								<c:when test="${category eq 'R'}">
									트레이너
								</c:when>
								<c:otherwise>
								&nbsp;
								</c:otherwise>
							</c:choose>		
						</div>
					</td>
				</tr>
				<tr>
					<th>&nbsp;</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
					<c:if test="${category eq 'ALL'}">
					<th>게시판위치</th></c:if>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty datas}">
					<c:forEach items="${datas}" var="data">
						<c:url var="boardListUrl" value="/board/detail">
							<c:param name="category">${category}</c:param>
							<c:param name="dataNum">${data.dataNum}</c:param>
						</c:url>
						<c:url var="userBoard" value="/board/search">
							<c:param name="category">ALL</c:param>
							<c:param name="type">id</c:param>
							<c:param name="keyword">${data.writer}</c:param>
						</c:url>
						<tr>
							<td>${data.dataNum}</td>
							<td onclick="location.href='${boardListUrl}'">
								${data.title}
								<c:if test="${data.recommend >0}">
									<i>[${data.recommend}]<i></i>
								</c:if>
							</td>
							<td onclick="location.href='${userBoard}'">${data.writer}</td>
							<td>${data.conut}</td>
							<td>${data.writedate}</td>
							<c:if test="${category eq 'ALL'}">
								<td onclick="location.href='${boardsURL}${data.category}'">
									<c:choose>
										<c:when test="${data.category eq 'I'}">
												정보게시판
										</c:when>
										<c:when test="${data.category eq 'N'}">
												공지게시판
										</c:when>
										<c:when test="${data.category eq 'R'}">
												리뷰게시판
										</c:when>
										<c:when test="${data.category eq 'C'}">
												문의게시판
										</c:when>
									</c:choose>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<nav>
		<div>
			<ul class="pagination justify-content-center">
				<c:if test="${pageData.hasPrevPage()}">
					<c:url var="boardPagingUrl" value="/board/search">
						<c:param name="category">${category}</c:param>
						<c:param name="type">${type}</c:param>
						<c:param name="keyword">${keyword}</c:param>
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
							<c:url var="boardPagingUrl" value="/board/search">>
								<c:param name="category">${category}</c:param>
								<c:param name="type">${type}</c:param>
								<c:param name="keyword">${keyword}</c:param>
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
							<c:url var="boardPagingUrl" value="/board/search">>
								<c:param name="category">${category}</c:param>
								<c:param name="type">${type}</c:param>
								<c:param name="keyword">${keyword}</c:param>	
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
								<c:url var="boardPagingUrl" value="/board/search">>
								<c:param name="category">${category}</c:param>
								<c:param name="type">${type}</c:param>
								<c:param name="keyword">${keyword}</c:param>
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
								<c:url var="boardPagingUrl" value="/board/search">>
									<c:param name="category">${category}</c:param>
									<c:param name="type">${type}</c:param>
									<c:param name="keyword">${keyword}</c:param>
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
								<c:url var="boardPagingUrl" value="/board/search">>
								<c:param name="category">${category}</c:param>
								<c:if test="${category eq 'ALL'}">
									<c:param name="type">${type}</c:param>
									<c:param name="keyword">${keyword}</c:param>
								</c:if>	
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