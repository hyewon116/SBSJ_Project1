<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>

<html>
	<head>
		<meta charset="UTF-8">
		<title> 1:1 문의 </title>
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
		<h3 class="text-center">1:1 맞춤상담</h3>
		<hr>
	<form action="${pageContext.request.contextPath}/qna/list" method="get">
		<div class="input-group">
			<div class="input-group-prepend">
				<select class="form-control" id="searchOption" name="searchOption">
					<option value="qa_question_title"
							<c:if test="${search_dto.searchOption == 'qa_question_title'}">selected="selected"</c:if>
						> 제목 </option>
						<option value="writer"
							<c:if test="${search_dto.searchOption == 'writer'}">selected="selected"</c:if>
						> 작성자 </option>
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
			<tr>
				<th>번호</th>
				<th>문의 유형</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회</th>
				<th>작성일</th>
			</tr>
		</thead>
		
		<tbody>
			
			<c:forEach var="dto" items="${list}" varStatus="status">
			<tr>
				<td><c:out value="${dto.qa_question_id}"/></td> 
				<td><c:out value="${dto.qa_question_category}"/></td> 
				<td>
				<c:if test="${dto.open_yn eq 'true'}">
				<img src="${pageContext.request.contextPath}/resources/cs/padlock.png" width="16" height="16" alt="비밀글" />
					<c:choose>
						<c:when test="${dto.member_id eq login_info.member_id|| login_info.admin_yn eq 'Y'}">
							<a href="${pageContext.request.contextPath}/qna/detail?qa_question_id=${dto.qa_question_id}"><c:out value="${dto.qa_question_title}"/></a>
						</c:when>
						<c:otherwise>비밀글은 작성자와 관리자만 볼 수 있습니다.</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${dto.open_yn eq 'false'}">
					<a href="${pageContext.request.contextPath}/qna/detail?qa_question_id=${dto.qa_question_id}"><c:out value="${dto.qa_question_title}"/></a>
				</c:if>
				</td>
				
				 <td><c:out value="${dto.member_nick}"/></td> 
				 <td><c:out value="${dto.qa_question_viewcnt}"/></td> 
				 <td><c:out value="${dto.qa_question_date}"/></td> 
			</tr>			
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 작성 버튼 -->
			<div>
				<a href="${pageContext.request.contextPath}/qna/write_form" class="clearfix">
					<button type="button" class="btn btn-info float-right"> 작성 하기 </button>
				</a>
			</div>
			
	<!-- 페이징 -->
			<div>
				<ul class="pagination">
					<c:if test="${startPageNum > 10}">
						<li class="page-item mx-auto">
							<a class="page-link"
								href="${pageContext.request.contextPath}/qna/list?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
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
										href="${pageContext.request.contextPath}/qna/list?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
										${page_no}
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${lastPageNum > endPageNum}">
						<li class="page-item mx-auto">
							<a class="page-link"
								href="${pageContext.request.contextPath}/qna/list?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								Next
							</a>
						</li>
					</c:if>
				</ul>
			</div>
	</div>
	
</body>
</html>