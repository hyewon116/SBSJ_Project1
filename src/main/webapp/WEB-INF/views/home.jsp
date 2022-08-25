<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>상부상酒</title>
	
	<!-- CSS 파일 -->	
	<link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/home.css">
	<link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/headerMain.css">
<%-- 	<link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/homeFooter.css"> --%>
	
	<!-- CDN -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>

<body>
<!-- body container -->

	<div class="container-fluid" id="container">
	
	<!--Main 내용 시작 부분-->
	
	<div class="row">
	<div class="col" id="carousel">
	
	<!-- 메인 이벤트 carousel -->
	
	<div id="carouselExampleFade" class="carousel slide carousel-fade mb-10" data-bs-ride="carousel">
	    <div class="carousel-inner">
	      <div class="carousel-item active">
	        <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/home/img/main_1.jpg" class="d-block w-100" alt="1"></a>
	      </div>
	      <div class="carousel-item">
	        <a href="${pageContext.request.contextPath}/md/subs_list"><img src="${pageContext.request.contextPath}/resources/home/img/main_new_2.jpg" class="d-block w-100" alt="2"></a>
	      </div>
	    </div>
	    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
	      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	      <span class="visually-hidden"></span>
	    </button>
	    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
	      <span class="carousel-control-next-icon" aria-hidden="true"></span>
	      <span class="visually-hidden"></span>
	    </button>
	  </div>
	</div>
	</div>
	
	<!-- 주종별 메뉴 -->
	
	<div class="row justify-content-md-center main-md">
		<div class="col-3.5">
		</div>
		<div class="col-1">
	                <a href="${pageContext.request.contextPath}/md/list_cate?md_category=탁주">
	                    <img class="hover:grow hover:shadow-lg" src="${pageContext.request.contextPath}/resources/home/img/takju.jpg" width="80px">
	                </a>
	            </div>
		<div class="col-1">
	                <a href="${pageContext.request.contextPath}/md/list_cate?md_category=약·청주">
	                    <img class="hover:grow hover:shadow-lg" src="${pageContext.request.contextPath}/resources/home/img/yakju.jpg" width="80px">
	                </a>
		</div>
		<div class="col-1">
	                <a href="${pageContext.request.contextPath}/md/list_cate?md_category=과실주">
	                    <img class="hover:grow hover:shadow-lg" src="${pageContext.request.contextPath}/resources/home/img/fruit.jpg" width="80px">
	                </a>
		</div>
		<div class="col-1">
	                <a href="${pageContext.request.contextPath}/md/list_cate?md_category=증류주">
	                    <img class="hover:grow hover:shadow-lg" src="${pageContext.request.contextPath}/resources/home/img/jeungryu.jpg" width="80px">
	                </a>
		</div>
		<div class="col-1">
	                <a href="${pageContext.request.contextPath}/md/list_cate?md_category=선물세트">
	                    <img class="hover:grow hover:shadow-lg" src="${pageContext.request.contextPath}/resources/home/img/giftset.jpg" width="80px"> 
	                </a>
		</div>		
		<div class="col-3.5">        
		</div>
	</div>
	
	<hr class="my-3">
	
	
	<!--이달의 상품 소개-->
	
	<div class="row" id="main_title">
		<div class="col-2">
		</div>
		<div class="col">
			상부상酒의 추천 상품
		</div>
		<div class="col-2">
		</div>
	</div>
	 
	<div class="row justify-content-md-center main-md">
		<div class="col-2">
		</div>
		<div class="col-2">
	                <a href="/md/detail/page?md_id=60">
	                    <img class="hover:grow hover:shadow-lg" src="${pageContext.request.contextPath}/resources/home/img/mark_1.jpg">
	                    <p class="pt-3" style="text-align:center; text-decoration:none !important" id="main-md-name">마크 홀리</p>
	                    <p class="pt-1" style="text-align:center; text-decoration:none !important" id="main-md-price">11,500원</p>
	               
	                </a>
	            </div>
		<div class="col-2">
	                <a href="/md/detail/page?md_id=17">
	                    <img class="hover:grow hover:shadow-lg" src="${pageContext.request.contextPath}/resources/home/img/dam_1.jpg">
	                 <p class="pt-3" style="text-align:center; text-decoration:none !important" id="main-md-name">담은</p>
	                 <p class="pt-1" style="text-align:center; text-decoration:none !important" id="main-md-price">12,000원</p>
	                </a>
		</div>
		<div class="col-2">
	                <a href="/md/detail/page?md_id=6">
	                    <img class="hover:grow hover:shadow-lg" src="${pageContext.request.contextPath}/resources/home/img/straw_1.jpg">
	                 <p class="pt-3" style="text-align:center; text-decoration:none !important" id="main-md-name">편백숲 딸기 스파클링</p>
	                 <p class="pt-1" style="text-align:center; text-decoration:none !important" id="main-md-price">14,000원</p>
	                </a>
		</div>
		<div class="col-2">
	                <a href="/md/detail/page?md_id=29">
	                    <img class="hover:grow hover:shadow-lg" src="${pageContext.request.contextPath}/resources/home/img/boksun_1.jpg">
	                 <p class="pt-3" style="text-align:center; text-decoration:none !important" id="main-md-name">복순도가 손 막걸리</p>
	                 <p class="pt-1" style="text-align:center; text-decoration:none !important" id="main-md-price">13,000원</p>
	                </a>
		</div>	
		<div class="col-2">
		</div>
	</div>
	<div class="row" id="interval">
	</div>

</body>
<%@ include file="/WEB-INF/views/footerMain.jsp" %>
</html>