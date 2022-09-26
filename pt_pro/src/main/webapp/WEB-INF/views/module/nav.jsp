<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:url var="base" value="/static/base" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Agency - Start Bootstrap Theme</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="${base}/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${base}/css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top"
				onclick="location.href='/pt'">KH fitness</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars ms-1"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
					<li class="nav-item"><a class="nav-link"
						href="/pt/board?category=N">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="#portfolio">트레이너
							정보</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/pt/board?category=R">후기 게시판 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="/pt/board?category=I">정보공유 게시판</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/pt/board?category=C">문의 게시판</a></li>
					<c:if test="${not empty sessionScope.loginData}">
						<c:if test="${sessionScope.loginData.roles eq 'M'}">
							<li class="nav-item"><a class="nav-link" href="/pt/login">pt 예약조회</a></li>
						</c:if>
						<c:if test="${sessionScope.loginData.roles eq 'T'}">
							<li class="nav-item"><a class="nav-link" href="/pt/login">회원 pt조회</a></li>
						</c:if>
					</c:if>
					<li class="nav-item"><a class="nav-link" href="/pt/pay">pt 회원권 구매</a></li>
				</ul>
			</div>
		</div>
	</nav>