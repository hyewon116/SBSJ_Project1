<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상부상酒  | 내 쿠폰 목록</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

	
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
		
		#coupon_table td{
			padding-right : 20px;
			padding-left : 20px;
		}
		
		#coupon_table div {
			border: 1px solid lightgray;
			padding-top : 10px;
			padding-right : 150px;
			padding-left : 10px;
			padding-bottom : 10px;
		}
		
		#coupon_table h6 {
			font-size : 12px;
		}
		
		#coupon_name {
			font-size : 15px;
		}
		
	</style>	
	</head>
	
	<!-- body 시작 -->
	<body>
			<!-- header -->
			<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>
			<br>
			<br>
	
		<div class="container">
			
			<!-- nav 시작 -->
			<nav>
				<jsp:include page="/WEB-INF/views/member/mypage_nav.jsp"></jsp:include>
				<br>
				<br>			
			</nav>
			<!-- nav 끝 -->
			<main class="clearfix mt-1" style="height:500px">
				
				<!--  aside 시작 -->	
				<aside class="col-3 h-100 bg-white float-left">
					
				<jsp:include page="/WEB-INF/views/member/mypage_aside.jsp"></jsp:include>
				<br><br>			
				</aside>
				<!--  aside 끝 -->	
				
		<!-- section 시작---------------------------------------------------------------------------->
	<section class="col-9 h-100 bg-white float-left">
		<h1> 쿠폰 목록 </h1>
		<hr style="width:100%;height:5px;border:none;background-color:black;">
					 
		<hr> 	
		<table id="coupon_table">
		
		<c:forEach var="dto" items="${coupon_list}">
		<tr>
			<td>	
				<div>
					<h5><b><fmt:formatNumber value="${dto.coupon_dis}" pattern="#,###" />원</b></h5>
					<h5 style="color:brown;" id="coupon_name"><b>${dto.coupon_name}</b></h5>
					<h6>만료일자: ${dto.coupon_end}</h6><hr>
					<c:if test = "${dto.coupon_yn == 'N'}">
						<h6 style="color:blue;">사용가능</h6>
					</c:if>
					<c:if test = "${dto.coupon_yn == 'Y'}">
						<h6 style="color:red;">사용완료</h6>
					</c:if>
				</div>
			<td>
		</tr>
		</c:forEach>
		</table>
		
		<hr class="my-150">
		
							  
			</section>
		<!-- section 끝---------------------------------------------------------------------------- -->
			
			</main>			
		</div><!-- container -->
	</body>
	
</html>