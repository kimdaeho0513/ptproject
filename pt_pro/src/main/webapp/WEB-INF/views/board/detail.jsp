<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../module/head.jsp"%>

</head>
<body>
	<section class="container">
		<div>
			<div>
				<h1>${data.title}<c:if test="${not empty data.btrainer}">
						<h6>관련 트레이너 : ${data.btrainer}</h6>
					</c:if>
				</h1>

			</div>
			<div>
				> <label>작성자 ${data.writer}</label> <label>작성일자
					${data.writedate}</label> <label">조회수: ${data.conut+1}</label>
			</div>
			<div>
				<p>${data.contents}</p>
			</div>
			<div onclick="ajaxLike(id_like, ${data.dataNum});">
				<i class="bi bi-hand-thumbs-up text-secondary text-opacity-50"></i>
				<label id="id_like" class="text-secondary text-opacity-75">${data.liked}</label>
			</div>
		</div>
		<div>
			<c:url var="boardUrl" value="/board" />
			<form action="./delete" method="post">
				<c:if
					test="${(data.writer eq sessionScope.loginData.id) or sessionScope.loginData.roles == 'A'}">
					<!-- 병합시 sessionScope.roles->sessionScope.loginData.roles -->
					<button type="button"
						onclick="location.href='${boardUrl}/modify?category=${data.category}&dataNum=${data.dataNum}'">수정</button>
					<input name="dataNum" type="hidden" value="${data.dataNum}">
					<button class="btn btn-danger" type="button" data-bs-toggle="modal"
						data-bs-target="#removeModal">삭제</button>
				</c:if>
				<button type="button"
					onclick="location.href='${boardUrl}?category=${data.category}'">목록</button>
			</form>
		</div>
		<c:if test="${category ne 'N'}">
			<div class="mt-3 mb-3">
				<c:forEach items="${comment}" var="comment">
					<div class="mb-1">
						<div class="card border-light">
							<div class="card-header">
								<div class="d-flex justify-content-between">
									<span><small>${comment.commentWriter}</small></span> <span><small>${comment.commentDate}</small></span>
								</div>
							</div>
							<div class="card-body">
								<input type="hidden" value="${comment.commentNum}">
								<c:choose>
									<c:when test="${comment.deleted eq 'Y'}">
										<p class="text-muted">삭제된 댓글 입니다.</p>
									</c:when>
									<c:otherwise>
										<p class="card-text">${comment.commentContents}</p>
									</c:otherwise>
								</c:choose>
								<div class="text-end">
									<button class="btn btn-sm btn-outline-dark" type="button"
										onclick="changeEdit(this);">수정</button>
									<button class="btn btn-sm btn-outline-dark" type="button"
										onclick="commentDelete(this, ${comment.commentNum})">삭제</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="mb-1">
					<form action="${boardUrl}/comment/add" method="post">
						<input type="hidden" name="bid" value="">
						<div class="input-group">
							<textarea class="form-control" name="content" rows="2"></textarea>
							<input type="hidden" name="dataNum" value="${data.dataNum}">
							<input type="hidden" name="category" value="${category}">							
							<button class="btn btn-outline-dark" type="button"
								onclick="formCheck(this.form);">등록</button>
						</div>
					</form>
				</div>
		</c:if>
		</div>

		<div class="modal fade" id="removeModal" tabindex="-1"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="modal-title">삭제 확인</h6>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">해당 데이터를 삭제하겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-danger"
							data-bs-dismiss="modal" onclick="deleteBoard(${data.dataNum})">확인</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
<c:url var="boardUrl" value="/board" />

		function changeEdit(element) {
			element.innerText = "확인";
			element.nextElementSibling.remove();
			
			var value = element.parentElement.previousElementSibling.innerText;
			var textarea = document.createElement("textarea");
			textarea.setAttribute("class", "form-control");
			textarea.value = value;
			
			element.parentElement.previousElementSibling.innerText = "";
			element.parentElement.previousElementSibling.append(textarea);
			
			element.setAttribute("onclick", "commentUpdate(this);");
		}
		
		function changeText(element) {
			element.innerText = "수정";
			var cid = element.parentElement.parentElement.children[0].value;
			var value = element.parentElement.previousElementSibling.children[0].value;
			element.parentElement.previousElementSibling.children[0].remove();
			element.parentElement.previousElementSibling.innerText = value;
			
			var btnDelete = document.createElement("button");
			btnDelete.innerText = "삭제";
			btnDelete.setAttribute("class", "btn btn-sm btn-outline-dark");
			btnDelete.setAttribute("onclick", "commentDelete(this, " + cid + ");");
			
			element.parentElement.append(btnDelete);
			element.setAttribute("onclick", "changeEdit(this);");
		}
		
		function commentUpdate(element) {
			var cid = element.parentElement.parentElement.children[0].value;
			var value = element.parentElement.previousElementSibling.children[0].value;
			
			$.ajax({
				url: "/comment/modify",
				type: "post",
				data: {
					id: cid,
					content: value
				},
				success: function(data) {
					element.parentElement.previousElementSibling.children[0].value = data.value
					changeText(element);
				}
			});
		}
		
		function commentDelete(element, id) {
			$.ajax({
				url: "/comment/delete",
				type: "post",
				data: {
					id: id
				},
				success: function(data) {
					if(data.code === "success") {
						element.parentElement.parentElement.parentElement.parentElement.remove();
					}
				}
			});
		}
		function formCheck(form) {
			if(form.content.value.trim() === "") {
				alert("댓글 내용을 입력하세요.");
			} else {
				form.submit();
			}
		}
		function deleteBoard(dataNum) {
			$.ajax({
				url: "${boardUrl}/delete",
				type: "post",
				data: {
					dataNum: dataNum
				},
				dataType: "json",
				success: function(data) {
					if(data.code === "success") {
						alert("삭제 완료");						
							location.href = "${boardUrl}?category=${category}";
					} else if(data.code === "permissionError") {
						alert("권한이 오류");
					} else if(data.code === "notExists") {
						alert("이미 삭제되었습니다.")
					}
				}
			});
		}
		function ajaxLike(element, userid) {
			$.ajax({
				type: "post",
				url: "${boardUrl}/like",
				data: {
					id: dataNum
				},
				success: function(data) {
					if(data.code === "success") {
						element.innerText = data.liked;
					} else if(data.code === "noData") {
						alert(data.message);
						location.href = "${boardUrl}";
					}
				}
			});
		}
	</script>
</body>
</html>