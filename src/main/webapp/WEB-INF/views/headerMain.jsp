<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상부상酒</title>

<!--CSS 파일-->
<link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/headerMain.css">

<!--CDN-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

</head>

<!-- 로그인, 회원가입, 고객센터 -->

<div id="loginBar">
	
	
	<c:choose>
		<c:when test="${login_info != null && login_info.member_name != null && login_info.admin_yn == 'N'}">
		${login_info.member_nick}님
			<a id="loginBarText" href="${pageContext.request.contextPath}/member/member"> 마이페이지 </a>
			<a id="loginBarText" href="${pageContext.request.contextPath}/login/logout"> 로그아웃 </a>
		</c:when>
		
		<c:when test="${login_info != null && login_info.member_name != null && login_info.admin_yn == 'Y'}">
		${login_info.member_nick}님
			<a id="loginBarText" href="${pageContext.request.contextPath}/admin/admin"> 관리자페이지 </a>
			<a id="loginBarText" href="${pageContext.request.contextPath}/login/logout"> 로그아웃 </a>
		</c:when>
		
		<c:otherwise>
		<a id="loginBarText" href="${pageContext.request.contextPath}/join/join"> 회원가입 </a>		
		<a id="loginBarText" href="${pageContext.request.contextPath}/login/login"> 로그인 </a>
		</c:otherwise>
	</c:choose>


</div>

<!-- 메인 로고 -->
<div id="mainLogo">
<center>
	<a href="${pageContext.request.contextPath}/">
		<img src="${pageContext.request.contextPath}/resources/home/img/logo_test2.jpg" id="logo">
	</a>
</center>
</div>

<!--nav 시작부분 -->

<div class="navScroll">
 <nav class="navbar navbar-expand-lg   navbar-light bg-white" id="navi">
<!--         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button> -->

        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
          <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
          <li class="nav-item dropdown dmenu">
            <a class="nav-link dropdown-toggle" href="/md/list" id="navbardrop" data-toggle="dropdown">
               전체상품
            </a>
            <div class="dropdown-menu sm-menu">
              <a class="dropdown-item" href="${pageContext.request.contextPath}/md/list_cate?md_category=탁주">탁주</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/md/list_cate?md_category=약·청주">약·청주</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/md/list_cate?md_category=과실주">과실주</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/md/list_cate?md_category=증류주">증류주</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/md/list_cate?md_category=선물세트">선물세트</a>
            </div>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="/event/toEvent">신상품</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="/event/toEvent">베스트</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/md/subs_list">정기구독</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="/event/toEvent">이벤트</a>
          </li>
          <li class="nav-item dropdown dmenu">
            <a class="nav-link dropdown-toggle" href="/md/list" id="navbardrop" data-toggle="dropdown">
              커뮤니티
            </a>
            <div class="dropdown-menu sm-menu">
              <a class="dropdown-item" href="/md/search?search=공지사항">공지사항</a>
              <a class="dropdown-item" href="/md/search?search=1:1문의">1:1문의</a>
            </div>
          </li>
</div>            

          </ul>
	<!-- searchbar 검색바 -->
	<div id="side_search" class="gnb_search">
		<input name="search" type="text" id="search" class="inp_search" value="" required label="검색어" placeholder="검색어를 입력 해주세요.">
		<a href="javascript:void(0);" id="search-button"><input type=image src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search"></a>
	</div>

	<!-- searchbar 아이콘 -->
	<div id="icon">
		<span >
	  		<a href="/mypage/myPageLike?cPage=1" id="heartbtn"><i class="far fa-heart"  style="font-size: 25px;"></i></a></span>
		<span style="margin:10px;margin-top: 15px;"><a href="${pageContext.request.contextPath}/cart/list" id="cartbtn"><i class="fas fa-shopping-cart" style="font-size: 22px;"></i></a> </span>          
	</div>

</div>
</nav>

</html>