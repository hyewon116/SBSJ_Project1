<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>리뷰 목록</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
	<body>
	<!-- body 시작 부분 -->
	
		<div class="container">
			
			<!-- 후기 리스트 -->
			<table class="table table-hover">
				<thead>
					<tr>
					<th>작성일자 </th> <th>글 제목</th> <th>작성자 </th> <th> 별점 </th> <th>조회수</th> 
					</tr>
				</thead>
					<c:forEach var="review" items="${list}">
						<tr>
							<td>${review.review_date}</td>
							<td>
								<a href="${pageContext.request.contextPath}/mdreview/detail?review_id=${review.review_id}">
								${review.review_title}
								</a>
							</td>
							<td>${review.member_id}</td>
							<td>${review.review_star}</td>
							<td>${review.review_viewcnt}</td>
						</tr>
					</c:forEach>
			</table>
			
		<!-- 후기 작성 버튼 -->
		<div class="clearfix">
			<a href="${pageContext.request.contextPath}/mdreview/write?md_id=${md_id}">
				<button class="btn btn-info float-right"> 후기 작성 </button>
			</a>
		</div>
			
			
		<!-- 페이징 부분 -->
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/mdreview/review_list?userWantPage=${startPageNum-1}">
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
								href="${pageContext.request.contextPath}/mdreview/review_list?userWantPage=${page_no}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/mdreview/review_list?userWantPage=${endPageNum+1}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		</div>
	</body>
</html>