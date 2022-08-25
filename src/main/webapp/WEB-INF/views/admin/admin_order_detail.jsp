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
				<br>
				<br>			
				
				
				
				</aside>
				
			<!--  aside 끝 -->	
			<!-- section 시작--------------------------------------------------------------------------------- -->
				<section class="col-10 h-100 bg-white float-left">
		<hr>
		<h3> 주문 관리 </h3>
		<hr>
		
		<!-- 검색창 비활성화 -->
<%-- 		 <form action="${pageContext.request.contextPath}/admin/admin_order_list" method="get"> --%>
<!-- 			<div class="input-group"> -->
<!-- 				<div class="input-group-prepend"> -->
<!-- 					<select class="form-control" id="searchOption" name="searchOption"> -->
<!-- 						<option value="md_name" -->
<%-- 							<c:if test="${search_dto.searchOption == 'md_name'}">selected="selected"</c:if> --%>
<!-- 						> 상 품 이 름 </option> -->
<!-- 					</select> -->
<!-- 				</div> -->
<!-- 				<input type="text" class="form-control" id="searchWord" name="searchWord" -->
<%-- 						value="${search_dto.searchWord}"> --%>
<!-- 				<div class="input-group-append"> -->
<!-- 					<button type="submit" class="btn btn-primary"> 검 색 </button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</form>  -->
		<table class="table table-hover">
						<c:set var="dto" value="${list[0]}" />
						<tr>
							<th>주문번호  </th> <td>${dto.order_id}</td> 
							<th>주문날짜  </th> <td>${dto.order_date} </td> 
						</tr>
						<tr>
							<th>주문회원</th> <td>${dto.member_name}</td> 
							<th>이메일  </th> <td>${dto.member_email} </td> 
						</tr>
						<tr>
							<th> 배송지 번호 </th>	<td>${dto.delivery_id}  </td>
							<th>배송지  </th> <td>(${dto.post_code})${dto.delivery_addr1}${dto.delivery_addr2} </td>  
						</tr>
						<tr>
							<td>
			                  <form id="change_status_form">
			                  	<input type="hidden" id="order_id" name="order_id" value="${dto.order_id }">
									<select class="form-control" id= "order_status" name="order_status">
										<option value="1"
											<c:if test="${dto.order_status == '1'}">selected="selected"</c:if>
											> 주 문 완 료 </option>
											<option value="3"
											<c:if test="${dto.order_status == '3'}">selected="selected"</c:if>
											> 결 제 완 료 </option>
											<option value="5"
											<c:if test="${dto.order_status == '3'}">selected="selected"</c:if>
											> 발 송 대 기 </option>
											<option value="7"
											<c:if test="${dto.order_status == '3'}">selected="selected"</c:if>
											> 발 송 완 료 </option>
											<option value="9"
											<c:if test="${dto.order_status == '3'}">selected="selected"</c:if>
											> 배 송 완 료 </option>
										<option value="11"
											<c:if test="${dto.order_status == '11'}">selected="selected"</c:if>
											> 구매확정완료 </option>
										
									</select>
								</form>
							</td>
							<td><button class="status_update_btn">수정</button></td>
						</tr>
				</table>
				
		<table class="table table-hover">
			<col class="col-1">
			<col class="col-1">
			<col class="col-1">
			<col class="col-1">
			<col class="col-1">
			<col class="col-2">
			
			
			<thead>
				<tr>
					<th> 상품명 </th> <th></th>
					<th> 주문수량 </th>	<th>주문단가</th><th>할인금액</th> <th> 결제금액 </th> 
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}" varStatus="status">

					<tr>
						<td>
							${dto.md_name}
						</td>
						<td>
							<img src="${dto.md_thumbnail_path}" class="img-thumbnail">
						</td>
						<td>
							${dto.order_detail_qty}개
						</td>
						<td>
							${dto.order_detail_price}
						</td>
						<td>
						${dto.order_detail_discount_amt}
						</td>
						<td>
						${dto.order_detail_pay_amt}
						</td>
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
						href="${pageContext.request.contextPath}/admin/admin_order_detail?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
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
								href="${pageContext.request.contextPath}/admin/admin_order_detail?order_id=${list[0].order_id}&userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/admin/admin_order_detail?order_id=${list[0].order_id}&userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
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
				location.href="${pageContext.request.contextPath}/admin/admin_order_list";
			});//click
		});//ready
	</script>
	 <script type="text/javascript">
	   $(document).ready(function() {
	  	 $(".status_update_btn").click(function() {
	         $("#change_status_form").attr("action","${pageContext.request.contextPath}/admin/admin_change_status");
	         $("#change_status_form").attr('method', 'post');
	         $("#change_status_form").submit();
	      });//click
	   });//ready
   </script>
		
	</body>
	
</html>