<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>

<html>
	<head>
		<meta charset="UTF-8">
		<title> 공지 사항 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>	
		<style type="text/css">
		.write_label {
			font-size : 0.7em;
			color : red;
		}
		</style>
	</head>
<body>

<!-- body 시작 -->

<div class="container col-sm-8">
		<h3 class="text-center">공 지 사 항</h3>
		<hr>
	<form action="${pageContext.request.contextPath}/notice/list" method="get">
		<div class="input-group">
			<div class="input-group-prepend">
				<select class="form-control" id="searchOption" name="searchOption">
					<option value="title"
							<c:if test="${search_dto.searchOption == 'title'}">selected="selected"</c:if>
						> 제목 </option>
				</select>
			</div>
			
			<input class="form-control" type="text" id="searchWord" name="searchWord"
					value="${search_dto.searchWord}">
			<div class="input-group-append">
				<button type="submit" class="btn btn-info"> 검색 </button>
			</div>
		</div>
		
	</form>
	<hr>
	
	<table class="table table-hover" style="text-align: center;">
		<thead>
			<tr >
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
				<td>
				<a href="${pageContext.request.contextPath}/notice/detail?notice_id=${dto.notice_id}">
						${dto.notice_title}</a>
				</td> 
				<td>${dto.notice_view_cnt}</td> 
				<td>${dto.notice_write_date}</td> 
			</tr>			
			</c:forEach>
		</tbody>
	</table>
	

	<!-- 작성 버튼 : 관리자만 보임 -->
		<div class="clearfix">
			<c:if test="${login_info.admin_yn eq 'Y'}"> 
				<div class="float-right">
					<c:if test="${login_info.admin_yn eq 'Y'}"> 
						<a href="${pageContext.request.contextPath}/notice/write_form" class="clearfix">
						<button type="button" class="btn btn-info float-right"> 작성 하기 </button>
						</a>
					</c:if>
				</div>
			</c:if>
	</div>
	<hr>
	<!-- 페이징 -->
				<ul class="pagination">
					<c:if test="${startPageNum > 10}">
						<li class="page-item mx-auto">
							<a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								Previous
							</a>
						</li>
					</c:if>
					<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
						<c:choose>
							<c:when test="${page_no == userWantPage}">
								<li class="page-item active mx-auto">
									<a class="page-link">${page_no}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item mx-auto">
									<a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
										${page_no}
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${lastPageNum > endPageNum}">
						<li class="page-item mx-auto">
							<a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								Next
							</a>
						</li>
					</c:if>
				</ul>
					  	
			</div>
	</div>
	
</body>
</html>