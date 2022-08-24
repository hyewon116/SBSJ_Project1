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
			margin-top: 20px;
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
	<div class="btn-group">
	  <button type="button" class="btn text-black dropdown-toggle" style="background-color: tan;"
			data-toggle="dropdown">
	  	주종
	  </button>
	  <div class="dropdown-menu">
	    <a class="dropdown-item" id="md_category" href="${pageContext.request.contextPath}/md/list_cate?md_category=탁주">탁주</a>
	    <a class="dropdown-item" id="md_category" href="${pageContext.request.contextPath}/md/list_cate?md_category=약·청주">약·청주</a>
	    <a class="dropdown-item" id="md_category" href="${pageContext.request.contextPath}/md/list_cate?md_category=과실주">과실주</a>
	    <a class="dropdown-item" id="md_category" href="${pageContext.request.contextPath}/md/list_cate?md_category=증류주">증류주</a>
	    <a class="dropdown-item" id="md_category" href="${pageContext.request.contextPath}/md/list_cate?md_category=선물세트">선물세트</a>
	  </div>
	 </div>
	  
	 <div class="btn-group">
	  <button type="button" class="btn text-black dropdown-toggle" style="background-color: wheat;" 
	  	data-toggle="dropdown" >
	  	단맛
	  </button>
	  <div class="dropdown-menu">
	    <a class="dropdown-item" id="md_sweet" href="${pageContext.request.contextPath}/md/list_cate?md_sweet=약한">약한</a>
	    <a class="dropdown-item" id="md_sweet" href="${pageContext.request.contextPath}/md/list_cate?md_sweet=중간">중간</a>
	    <a class="dropdown-item" id="md_sweet" href="${pageContext.request.contextPath}/md/list_cate?md_sweet=강한">강한</a>
	  </div>
	 </div>
	  
	 <div class="btn-group">
	  <button type="button" class="btn text-black dropdown-toggle" style="background-color: wheat;" 
	  	data-toggle="dropdown">
	  	신맛
	  </button>
	  <div class="dropdown-menu">
	    <a class="dropdown-item" id="md_sour" href="${pageContext.request.contextPath}/md/list_cate?md_sour=약한">약한</a>
	    <a class="dropdown-item" id="md_sour" href="${pageContext.request.contextPath}/md/list_cate?md_sour=중간">중간</a>
	    <a class="dropdown-item" id="md_sour" href="${pageContext.request.contextPath}/md/list_cate?md_sour=강한">강한</a>
	  </div>
	 </div>
	 
	 <div class="btn-group">
	  <button type="button" class="btn text-black dropdown-toggle" style="background-color: wheat;" 
	  	data-toggle="dropdown">
	  	탄산
	  </button>
	  <div class="dropdown-menu">
	    <a class="dropdown-item" id="md_sparkling" href="${pageContext.request.contextPath}/md/list_cate?md_sparkling=약한">약한</a>
	    <a class="dropdown-item" id="md_sparkling" href="${pageContext.request.contextPath}/md/list_cate?md_sparkling=중간">중간</a>
	    <a class="dropdown-item" id="md_sparkling" href="${pageContext.request.contextPath}/md/list_cate?md_sparkling=강한">강한</a>
	  </div>
	 </div>
	 
	 <div class="btn-group">
	  <button type="button" class="btn btn-warning dropdown-toggle" style="background-color: coral;" 
	  	data-toggle="dropdown">
	  	상황별
	  </button>
	  <div class="dropdown-menu">
	    <a class="dropdown-item" id="md_use" href="${pageContext.request.contextPath}/md/list_cate?md_use=웃어른">웃어른</a>
	    <a class="dropdown-item" id="md_use" href="${pageContext.request.contextPath}/md/list_cate?md_use=연인">연인</a>
	    <a class="dropdown-item" id="md_use" href="${pageContext.request.contextPath}/md/list_cate?md_use=친구">친구</a>
	    <a class="dropdown-item" id="md_use" href="${pageContext.request.contextPath}/md/list_cate?md_use=혼자">혼자</a>
	    <a class="dropdown-item" id="md_use" href="${pageContext.request.contextPath}/md/list_cate?md_use=비지니스">비지니스</a>
	  </div>
	 </div>
	<br><br>
	
	
	<!-- 상품 목록 -->
		<table class="table table-hover" style="width:500px;">
			<tbody id="tbody_for_list">
			</tbody>
			<tr>
				<c:forEach var="md" items="${list}">
				<td>
					<div class="img-box"><a href="${pageContext.request.contextPath}/md/detail?md_id=${md.md_id}">
		                     <img src="${md.md_thumbnail_path}" alt=""></a></div>
						<div class="product-item">
			            	 <input type=hidden id="md_id" value="${md.md_id}">
		                   	 	<a href="${pageContext.request.contextPath}/md/detail?md_id=${md.md_id}">
		                     <h5>${md.md_name}</h5>
		                     </a>
		                     	<a><h6>${md.md_oneline}</h6></a>
		                     <h6><del><fmt:formatNumber value="${md.md_price}" pattern="#,###" />원</del></h6>
		                     <h6><b><fmt:formatNumber value="${md.sale_price}" pattern="#,###" />원</b></h6>
		            	</div>
				</td>
				</c:forEach>
			</tr>
		</table>
	</div>
	
	<!-- 페이징 부분 -->
    
	</body>

</html>




