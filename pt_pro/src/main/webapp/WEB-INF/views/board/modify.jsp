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
<section class="container">
		<div>
			<div>
				<h1>${data.title}</h1>
			</div>
			<div>>
				<input>작성자 ${data.writer}
				<input>작성일자 ${data.writedate}
				<input>조회수: ${data.conut}
			</div>
			<div>
				<textarea>${data.contents}</textarea>
			</div>
			<div>
				<button type = "button" onclick="location.href=/board/modify?=${data.dataNum}">수정</button>
			</div>
			<!-- div>
				<div onclick="ajaxLike(id_like, ${data.dataNum});">
					<i class="bi bi-hand-thumbs-up text-secondary text-opacity-50"></i>
					<label id="id_like" class="text-secondary text-opacity-75">${data.liked}</label>
				</div>
			</div-->
		</div>
	</section>

</body>
</html>