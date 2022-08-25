<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 구매 내역 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
/* 	.modal-dialog { */
/*   width: 1250px; */
/*   height: 100%; */
/*   margin: 0; */
/*   padding: 0; */
/* } */
/* .modal-content { */
/*   height: auto; */
/*   min-height: 100%; */
/*   border-radius: 0;  */
/* } */
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
	margin-right : 30px;
}
#insert {
	margin-right : 30px;
}

.update_btn{
	text-align: right;
}
#admin_order th, #admin_order td {
	vertical-align : middle; !important;

	
}

th {
	background: rgba(231,231,231,0.4)
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
				<br>
				<br>			
			</nav>
			<!-- nav 끝 -->
			<main class="clearfix mt-1" style="height:500px">
				
				<!--  aside 시작 -->	
				<aside class="col-2 h-100 bg-white float-left">
					
					
				<jsp:include page="/WEB-INF/views/admin/admin_aside.jsp"></jsp:include>
				<br><br>			
				</aside>
				<!--  aside 끝 -->
					
	<!-- section 시작--------------------------------------------------------------------------------- -->
	<section class="col-10 h-100 bg-white float-left">
		<hr>
		<h3> 주문 관리 </h3>
		<hr>
		
		<!-- 검색창 비활성화 -->
		 <form action="${pageContext.request.contextPath}/admin/admin_order_list" method="get">
			<div class="input-group">
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption" name="searchOption">
						<option value="md_name"
							<c:if test="${search_dto.searchOption == 'md_name'}">selected="selected"</c:if>
						> 상 품 이 름 </option>
						<option value="order_id"
							<c:if test="${search_dto.searchOption == 'order_id'}">selected="selected"</c:if>
						> 주 문 번 호</option>
						<option value="order_status"
							<c:if test="${search_dto.searchOption == 'order_status'}">selected="selected"</c:if>
						> 주 문 상 태</option>
					</select>
				</div>
				<input type="text" class="form-control" id="searchWord" name="searchWord"
						value="${search_dto.searchWord}">
				<div class="input-group-append">
					<button type="submit" class="btn btn-primary"> 검 색 </button>
				</div>
			</div>
		</form> 
		
		<table class="table table-hover" id="admin_order">
			<col class="col-2">
			<col class="col-1">
			<col class="col-2">
			<col class="col-3">
			<col class="col-2">
			<col class="col-2">
			
			<thead>
				<tr>
					<th> 주문날짜 </th><th> 주문<br>번호 </th> <th>이름</th>
						<th>상품</th><th> 결제금액 </th> 
						<th> 주문상태 </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}" varStatus="status">

					<tr>
						<td>
							
							${dto.order_date}
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/admin/admin_order_detail?order_id=${dto.order_id}">
								${dto.order_id}
							</a>
						</td>
						<td>
							${dto.member_name}
						</td>
						<td>
							${dto.md_name}
						</td>
						<td>${dto.pay_amt}</td>
						<td>${dto.order_status_name}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
				<div class="update_btn">
					<button id="update_btn" name="update_btn" class="btn btn-warning float-info"> 뒤 로 가 기 </button>
				</div>
		<hr>
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/admin/admin_order_list?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
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
								href="${pageContext.request.contextPath}/admin/admin_order_list?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/admin/admin_order_list?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		</section>
				<!-- section 끝---------------------------------------------------------------------------- -->
<%-- 	<%@ include file="/WEB-INF/views/footer.jsp" %> --%>
	

	<script type="text/javascript">
	
	
	$(document).ready(function() {
		$("#update_btn").click(function() {
			location.href="${pageContext.request.contextPath}/admin/admin_member_list";
			
		});//click
	});//ready
	 </script>

	</body>
</html>