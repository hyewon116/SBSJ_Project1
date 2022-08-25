<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	
		<title>상부상酒  |  관리자 페이지 </title>
		
		<!-- CDN -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
	margin-right : 30px;
}
#insert {
	margin-right : 30px;
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
			<h3> 상품 후기 관리 </h3>
			<hr>
			<div class="container">
		
		<!-- 후기 디테일 -->
		<table class="table table-hover" id="table1">
			<col class="w-25">
			<tbody>
				<tr>
					<th>작성일자</th>
					<td>${detail_dto.review_date}</td>
					<th>작성자</th> 
					<td>${detail_dto.member_nick}</td>
				</tr>
				<tr>
					<th> 후기 제목 </th>
					<td colspan="3">${detail_dto.review_title}</td>
				</tr>
				<tr>
					<th> 내용 </th>
					<td colspan="3">${detail_dto.review_content}</td>
				</tr>
			</tbody>
		</table>
		
		<!-- 후기 목록가기 버튼  -->
		<div class="text-center">
			<a href="${pageContext.request.contextPath}/admin/admin_review_list">
				<button type="button" class="btn btn-info float-left" id="back"> 뒤로 가기  </button> 
			</a>
		</div>
		<br><br>
	</div>
					  
		</section>
		<!-- section 끝---------------------------------------------------------------------------- -->
	</main>
					
	</div><!-- container -->
	</body>
	
</html>