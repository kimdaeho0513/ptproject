<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게시글 등록</title>
	<%@ include file="../module/head.jsp" %>
	<c:url var="ckeditor" value="/static/ckeditor" />
	<script type="text/javascript" src="${ckeditor}/ckeditor.js"></script>
</head>
<script type="text/javascript">
	function formCheck(form) {
		if(form.title.value === undefined || form.title.value.trim() === "") {
			var modal = new bootstrap.Modal(document.getElementById("errorModal"), {
				keyboard: false
			});
			modal.show();
			return;
		}
		form.submit();
	}
	
	function uploadCheck(element) {
		var files = element.files;
		
		var modal = new bootstrap.Modal(document.getElementById("errorModal"), {
			keyboard: false
		});
		var title = modal._element.querySelector(".modal-title");
		var body = modal._element.querySelector(".modal-body");
		
		if(files.length > 3) {
			title.innerText = "파일 업로드 오류";
			body.innerText = "파일 업로드는 최대 3개로 제한되어 있습니다.";
			modal.show();
			element.value = "";
			return;
		}
		
		for(file of files) {
			if(file.size / 1000 / 1000 > 5.0) {
				title.innerText = "파일 업로드 오류";
				body.innerText = "파일당 최대 5MB 까지만 업로드 할 수 있습니다. 5MB 초과 용량에 대해서는 관리자에게 문의하세요.";
				modal.show();
				element.value = "";
				return;
			}
		}
	}
</script>
<body>
	<header></header>
	<section class="container">
		<div class="mt-3">
			<c:url var="boardModUrl" value="/board/modify" />
			<form action="${boardModUrl}" method="post" enctype="multipart/form-data">
				<c:choose>
					<c:when test="${category eq 'R'}">
						<table>
							<c:if test="${not empty Tdata}">
								<div>트레이너 후기</div>
									<input type ="radio" name="btrainer" Value="0">없음
								<c:forEach items="${Tdata}" var="Tdata">
									<input type ="radio" name="btrainer" value="${Tdata.usersCode}" ${Tdata.usersCode eq data.usersCode ? 'checked' : '' }>${Tdata.name}
								</c:forEach>								
							</c:if>
					</c:when>
					<c:otherwise>
						&nbsp;
					</c:otherwise>
				</c:choose>
				
				
				<div class="mb-3">
					<input class="form-control" type="text" name="title" value="${data.title}" placeholder="제목을 입력하세요.">
				</div>
				<div class="mb-3">
					<textarea class="form-control" name="content" rows="8"
						placeholder="내용을 입력하세요.">${data.contents}</textarea>
				</div>
				<div class="mb-3">
					<input class="form-control" type="file" onchange="uploadCheck(this);" name="fileUpload" multiple>
				</div>
				<div class="mb-3 text-end">
					<input type="hidden" name="category" value="${category}">
					<input type="hidden" name="dataNum" value="${dataNum}">
					<button class="btn btn-primary" type="button" onclick="formCheck(this.form);">
					저장</button>
				</div>
			</form>
		</div>
		
		<div class="modal fade" id="errorModal" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="modal-title">입력 오류</h6>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						제목은 공란을 입력할 수 없습니다.<br>
						반드시 제목을 입력하세요.
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-danger" data-bs-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer></footer>
	<c:url var="upload" value="/upload/image" />
	<script type="text/javascript">
		CKEDITOR.replace("content", {
			filebrowserUploadUrl: "${upload}?type=image"
		})
	</script>
	<c:if test="${not empty error}">
		<script type="text/javascript">
			alert("${error}");
		</script>
	</c:if>
</body>
</html>