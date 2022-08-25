<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>

<!DOCTYPE html>
	<html>
		<title>상부상酒  |  로그인</title>
		<head>
		<!-- CDN -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
		<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
		<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
		<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet" />
		
		<!-- CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		#loginContainer { 
	        width: 100%;
	        flex-direction: column;
		    display: flex;
		    align-items: center;
		    padding: 20px 50px 30px;
		    margin-top: 10px;
      	}
		#loginBox { 
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    padding: 40px 50px 30px;
		    margin-top: 10px;
		    border-radius: 10px;
    		box-shadow: rgb(0 0 0 / 16%) 0px 0px 5px 0px;
      	}
    
		#loginBtn { 
			width: 190px;
    		height: 45px;
            margin-bottom: 10px;
      	}
      	
      	#loginLogo {
      		width: 59px;
    		height: 59px;
      		margin-left: auto;
  			margin-right: auto;
  			margin-bottom: 40px;
  			margin-top: 40px;
      	}
		</style>
		</head>
		
	<body>
		<div class="container" id="loginContainer">
	
				<div class="card"  style="height:390px; width:360px;" id="loginBox">
					<div class="card-body">
						<h5 class="card-title col-12 text-center" id="txt">SNS 간편 로그인</h5>
						<div class="logo">
							<img id="loginLogo" src=${pageContext.request.contextPath}/resources/login/img/logo.png />
						</div>
					
						<!-- 네이버 코드의 시작 -->
						<div class="naver">
							<%
							    String clientId = "hM6sBK_JUV8WoxnMmHzF";//애플리케이션 클라이언트 아이디값";
							    String redirectURI = URLEncoder.encode("http://localhost:8081/sbsj/login/naver_callback", "UTF-8");//CallBack URL";
							    SecureRandom random = new SecureRandom();
							    String state = new BigInteger(130, random).toString();
							    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
							    apiURL += "&client_id=" + clientId;
							    apiURL += "&redirect_uri=" + redirectURI;
							    apiURL += "&state=" + state;
							    session.setAttribute("state", state);
							%>
								<a href="<%=apiURL%>"><img id="loginBtn" src=${pageContext.request.contextPath}/resources/login/img/naver_login_btn.png/></a>
		
						</div>
						<!-- 네이버 코드의 끝 -->
	
						<!-- 카카오 코드의 시작 -->
		
						<div class="kakao">
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=cf8c2b8f99409406ce4505e3f2eb3c58&redirect_uri=http://localhost:8081/sbsj/login/kakao_login&response_type=code">
							<img id="loginBtn" src=${pageContext.request.contextPath}/resources/login/img/kakao_login_btn.png /></a>
						</div>
		
						<!-- 카카오 코드의 끝 -->						
					</div>
				</div>
	        </div>
	        
	        
	        
	        
	        
	     <br><br><br>    
	</body>
	<%@ include file="/WEB-INF/views/footerMain.jsp" %>
</html>


