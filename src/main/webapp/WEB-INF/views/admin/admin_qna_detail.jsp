<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>상부상酒 | 관리자 페이지</title>

<!-- CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- CSS 파일 -->




<style type="text/css">

/* Style the navigation menu */
#myMenu {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

/* Style the navigation links */
#myMenu li a {
	padding: 12px;
	text-decoration: none;
	color: black;
	display: block
}

#myMenu li a:hover {
	background-color: #eee;
}

#disable_btn {
	margin-right: 30px;
}

#insert {
	margin-right: 30px;
}
</style>


</head>


<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>
	<br>
	<br>

	<div class="container">

		<!-- nav 시작 -->
		<nav>
			<jsp:include page="/WEB-INF/views/admin/admin_nav.jsp"></jsp:include>
			<br> <br>
		</nav>

		<!-- nav 끝 -->
		<main class="clearfix mt-1" style="height: 500px">
			<!--  aside 시작 -->
			<aside class="col-2 h-100 bg-white float-left">


				<jsp:include page="/WEB-INF/views/admin/admin_aside.jsp"></jsp:include>
				<br> <br>



			</aside>

			<!--  aside 끝 -->


			<!-- section 시작--------------------------------------------------------------------------------- -->
			<section class="col-10 h-100 bg-white float-left">
				<hr>
				<h3> 1:1 문의 </h3>
				<hr>
				<table class="table table-hover">
					<input type="hidden" id="member_id" name="member_id" class="form-control" value="${detail_dto.member_id}">
					<tbody>

						<tr>
							<th>번호</th>
							<td>${detail_dto.qa_question_id}</td>
							<th>문의유형</th>
							<td>${detail_dto.qa_question_category}</td>
							<th>제목</th>
							<td>${detail_dto.qa_question_title}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${detail_dto.member_nick}</td>
							<th>작성일</th>
							<td>${detail_dto.qa_question_date}</td>
							
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">${detail_dto.qa_question_content}</td>
						</tr>
					</tbody>
				</table>
				<hr>
				<!-- 목록으로 가기 버튼 : 누구나 보임 -->
				<div>
					<a href="${pageContext.request.contextPath}/admin/admin_qna_list">
						<button type="button" class="btn btn-info float-left" id="list">
							목록으로 가기</button>
					</a>

					<!-- 수정&삭제 버튼 : 내 게시글에서만 보임 -->
					<c:if
						test="${login_info.member_id == detail_dto.member_id || login_info.admin_yn eq 'Y'}">
						<div class="float-right">
							<c:if test="${login_info.admin_yn eq 'Y'}">
								<a
									href="${pageContext.request.contextPath}/admin/admin_qna_rform?qa_question_id=${detail_dto.qa_question_id}">
									<button type="button" class="btn btn-info" id="update">
										답변</button>
								</a>
							</c:if>
							<a
								href="${pageContext.request.contextPath}/admin/admin_qna_uform?qa_question_id=${detail_dto.qa_question_id}">
								<button type="button" class="btn btn-warning" id="update">
									수정</button>
							</a>
							<button type="button" class="btn btn-danger" id="delete_btn">
								삭제</button>
						</div>
					</c:if>
			</section>
			<!-- section 끝---------------------------------------------------------------------------- -->
		</main>

</body>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#delete_btn").click(function() {
			if(confirm("삭제 하시겠습니까?")) {
				$.get(
						"${pageContext.request.contextPath}/admin/admin_qna_delete"
						, {
							qa_question_id : ${detail_dto.qa_question_id}
						}
						, function(data, status) {
							if( data >= 1 ){
								alert("게시글이 삭제 되었습니다.");
								location.href="${pageContext.request.contextPath}/admin/admin_qna_list";
							} else if( data <= 0 ) {
								alert("게시글 삭제를 실패 하였습니다.");
							} else {
								alert("잠시 후 다시 시도해 주세요.");
							}
						}//call back
				);//get
			}//if
		});//click
	}); //ready
	</script>
</html>