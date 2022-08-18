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
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
					<th>작성일자 </th> <th>글 제목</th> <th>작성자</th> <th> 문의유형 </th> <th> 답변상태 </th>
					</tr>
				</thead>
					<c:forEach var="question" items="${list}">
						<tr>
							<td>${question.md_question_date}</td>
							<td>
								<a href="${pageContext.request.contextPath}/mdquestion/detail?md_question_id=${question.md_question_id}">
								${question.md_question_title}
								</a>
							</td>
							<td>${question.member_nick}</td>
							<td>${question.md_question_type}</td>
							<td>${question.md_question_answer}</td>
						</tr>
					</c:forEach>
			</table>
		
		<!-- 문의 작성 버튼 -->
		<c:if test="${login_info.member_id != null}"> <!-- 비회원은 글 작성 불가 -->
			<div class="clearfix">
				<a href="${pageContext.request.contextPath}/mdquestion/write?md_id=${md_id}">
					<button class="btn btn-info float-right"> 문의 작성 </button>
				</a>
			</div>	
		</c:if>
		
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/mdreview/question_list?userWantPage=${startPageNum-1}">
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
								href="${pageContext.request.contextPath}/mdreview/question_list?userWantPage=${page_no}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/mdreview/question_list?userWantPage=${endPageNum+1}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		</div>
	</body>
</html>