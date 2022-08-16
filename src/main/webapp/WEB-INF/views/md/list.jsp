<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 상품 목록 </title>
		
		<!-- bootstrap cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- Additional CSS Files -->
		<link rel="stylesheet" href="/resources/mdList/assets/css/fontawesome.css">
		<link rel="stylesheet" href="/resources/mdList/assets/css/templatemo-sixteen.css">
		<link rel="stylesheet" href="/resources/mdList/assets/css/owl.css">
		
		<style type="text/css">

		.img-box {
			overflow: hidden;
		}
		
		/* 마우스 오버시 이미지 확대 */
		.img-box:hover img{ 
			transform:scale(1.2);
			transition:.3s;
		}
		
		/* 마우스 오버시 커서모양 변경 */
		.product-item:hover { 
			cursor: pointer; !important
		}
		
		/* 이미지 모양 조정 */
		table img {
			width: 250px;
			top: 6px;
			left: 7px;
			border-radius: 10px; 
			margin-bottom : 10px;
			transition: all 0.2s linear;
		}
		
		/* 상품명 */
		h5 { 
			font-family : sans_serif;
			font-weight : bold;
			font-size : 18px;
		}
		
		/* 상품 한 줄 설명 */
		h6 { font-size : 13px; }
		
		/* 상품 리스트 가운데 정렬 */
		table { margin : auto; }
		
		/* 하이퍼링크 색깔 없애기 */
		a { color:black; }
		
		/* 하이퍼링크 밑줄 없애기 */
     	a:hover { text-decoration:none !important }

		</style>
	
	</head>
	<body>
	
	<hr class="my-50">
	<div class="container">

	<!-- 필터링 버튼 -->
	
	<div class="dropdown">
	  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
	  	주종
	  </button>
	  <div class="dropdown-menu">
	    <a class="dropdown-item" href="#">탁주</a>
	    <a class="dropdown-item" href="#">약청주</a>
	    <a class="dropdown-item" href="#">과실주</a>
	    <a class="dropdown-item" href="#">증류주</a>
	    <a class="dropdown-item" href="#">선물세트</a>
	  </div>
	</div>
	
	<!-- 상품 목록 -->
		<table class="table table-hover" style="width:500px;">
			<tr>
				<c:forEach var="md" items="${list}">
				<td>
				 <div class="img-box"><a href="${pageContext.request.contextPath}/md/detail?md_id=${md.md_id}">
	                        <img src="${md.md_thumbnail_path}" alt=""></a></div>
				<div class="product-item">
	            	<div class="img-box">
		            	 <input type=hidden id="md_id" value="${md.md_id}">
		           	</div>
	                     <a href="${pageContext.request.contextPath}/md/detail?md_id=${md.md_id}">
	                     <h5>${md.md_name}</h5>
	                     </a>
	                     <a><h6>${md.md_oneline}</h6></a>
	                     <h6><del><fmt:formatNumber value="${md.md_price}" pattern="#,###" />원</del></h6>
	                     <h6><fmt:formatNumber value="${md.sale_price}" pattern="#,###" />원</h6>
	            	</div>
				</td>
				</c:forEach>
			</tr>
		</table>
	</div>
	
	<!-- 페이징 부분 => 간격 조정 필요 -->
      <div class="container">
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/md/list?userWantPage=${startPageNum-1}">
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
								href="${pageContext.request.contextPath}/md/list?userWantPage=${page_no}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/md/list?userWantPage=${endPageNum+1}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
	<hr>
	</div>
	</body>
</html>




