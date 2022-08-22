<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상부상酒</title>

<!--CSS 파일-->
<%-- <link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/mypage/css/asideMypage.css"> --%>

<!--CDN-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

</head>

<!--  aside 시작 -->	
					
					
					
					<ul id="myMenu">
					  <li ><h4>관리자 페이지</h4></li>
					  <br>
					  <li><a href="${pageContext.request.contextPath}/admin/admin_member_list">회원 관리</a></li>
					  <li><a href="${pageContext.request.contextPath}/admin/admin_notice_list">공지사항 관리</a></li>
					  <li><a href="#">1:1 문의 관리</a></li>
					  <li><a href="${pageContext.request.contextPath}/admin/admin_review_list">상품후기 관리</a></li>
					  <li><a href="#">상품문의 관리</a></li>
					  <li><a href="${pageContext.request.contextPath}/admin/admin_md_list">상품 관리</a></li>
					  <li><a href="#">주문 관리</a></li>
					  <li><a href="#">쿠폰 관리</a></li>
					</ul>
				
				
				
				
			<!--  aside 끝 -->	
