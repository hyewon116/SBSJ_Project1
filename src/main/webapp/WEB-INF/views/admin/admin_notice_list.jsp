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
				<h3> 공지사항 관리 </h3>
				<hr>
				
				<form
					action="${pageContext.request.contextPath}/admin/admin_notice_list"
					method="get">
					<div class="input-group">
						<div class="input-group-prepend">
							<select class="form-control" id="searchOption"
								name="searchOption">
								<option value="title"
									<c:if test="${search_dto.searchOption == 'title'}">selected="selected"</c:if>>
									제목</option>
							</select>
						</div>

						<input class="form-control" type="text" id="searchWord"
							name="searchWord" value="${search_dto.searchWord}">
						<div class="input-group-append">
							<button type="submit" class="btn btn-info">검색</button>
						</div>
					</div>

				</form>

				<table class="table table-hover" style="text-align: center;">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>조회</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<td>${dto.notice_id}</td>
								<td><a
									href="${pageContext.request.contextPath}/admin/admin_notice_detail?notice_id=${dto.notice_id}">
										${dto.notice_title}</a></td>
								<td>${dto.notice_view_cnt}</td>
								<td>${dto.notice_write_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<hr>
				<!-- 작성 버튼 : 관리자만 보임 -->
				<div class="clearfix">
					<c:if test="${login_info.admin_yn eq 'Y'}">
						<div class="float-right">
							<c:if test="${login_info.admin_yn eq 'Y'}">
								<a
									href="${pageContext.request.contextPath}/admin/admin_notice_write_form"
									class="clearfix">
									<button type="button" class="btn btn-info float-right">
										작성 하기</button>
								</a>
							</c:if>
						</div>
					</c:if>
				</div>
				<hr>
				<!-- 페이징 -->
				<ul class="pagination">
					<c:if test="${startPageNum > 10}">
						<li class="page-item mx-auto"><a class="page-link"
							href="${pageContext.request.contextPath}/notice/list?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								Previous </a></li>
					</c:if>
					<c:forEach var="page_no" begin="${startPageNum}"
						end="${endPageNum}">
						<c:choose>
							<c:when test="${page_no == userWantPage}">
								<li class="page-item active mx-auto"><a class="page-link">${page_no}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item mx-auto"><a class="page-link"
									href="${pageContext.request.contextPath}/notice/list?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
										${page_no} </a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${lastPageNum > endPageNum}">
						<li class="page-item mx-auto"><a class="page-link"
							href="${pageContext.request.contextPath}/notice/list?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								Next </a></li>
					</c:if>
				</ul>
			</section>
			<!-- section 끝---------------------------------------------------------------------------- -->
		</main>

	</div>
	<!-- container -->
</body>
<script type="text/javascript">
		
		
	</script>
</html>