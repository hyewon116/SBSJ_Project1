<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<html>
	<head>
	
		<title>상부상酒  |  19세 미만 가입불가</title>
				<!-- CDN -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
		<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet" />
		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
		<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
		<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
		
<style type="text/css">
	
body {
        height: 100vh;
        width: 100vw;
        background-image: url('${pageContext.request.contextPath}/resources/login/img/19.png');
        background-repeat : no-repeat;
        background-size : cover;
      }

#center {
		height: 100px;
        width: 100px;
		margin-top: 300px;
	}    
      
</style>	
		
	
	
	<script type="text/javascript">
	
	
		
	
		let popup_19;
		 //pop=window.open('https://nid.naver.com/nidlogin.logout?returl=http://localhost:8081/sbsj/');
		 
		setTimeout(function () { // 팝업열어서 로그 아웃 실행 함
			popup_19 = window.open("https://nid.naver.com/nidlogin.logout?returl=http://localhost:8081/sbsj/","popup", "width=1, height=1, left=0, top=0");
		}, 1000);
		
	</script> 
	
	
	
	
		
	</head>
		<body>
		
			<main style="height:700px">
			
			</main>
			<footer>
			
				<center>
								<a href="${pageContext.request.contextPath}/">
										<img align="bottom" src="${pageContext.request.contextPath}/resources/login/img/home.png" style="cursor:pointer" onclick="popup_19.close();" > 
								</a>
				</center>
			
			</footer>
			
			
			
			
			
			
			
			
		</body>

</html>

