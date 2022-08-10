<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>



<!DOCTYPE html>
	<html>
		<head>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
		<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
		<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
		<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet" />
		
		</head>
		
		<body>
			
			<div class="container">
				<div class="v48_73">
					<div class="v342_41"></div>
					
					
					
					
					<!-- 네이버 코드의 시작 -->
					<div class="v342_45">
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
					 <a href="<%=apiURL%>"><img height="80" width="600" src=${pageContext.request.contextPath}/resources/image/member/naver.png/></a>
					</div>
					<!-- 네이버 코드의 끝 -->
					
					
					<!-- 카카오 코드의 시작 -->
					<div class="v342_47">
					
	                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=cf8c2b8f99409406ce4505e3f2eb3c58&redirect_uri=http://localhost:8081/sbsj/login/kakao_login&response_type=code">
						<img height="80" width="600" src=${pageContext.request.contextPath}/resources/image/member/kakao.png /></a>
					
					</div>
					<!-- 카카오 코드의 끝 -->
					
					
					
					<span class="v342_54">SNS 간편 로그인</span>
					<div class="v339_13"></div>
				</div>
			</div>
		</body>
	</html>
		<br/>
		<br/> 
	
		<style>* {
				  box-sizing: border-box;
				}
				body {
				  font-size: 14px;
				}
				.v48_73 {
				  width: 100%;
				  height: 1080px;
				  background: rgba(255,255,255,1);
				  opacity: 1;
				  position: absolute;
				  top: 0px;
				  left: 0px;
				  overflow: hidden;
				}
				.v342_41 {
				  width: 600px;
				  height: 80px;
				  background: url("${pageContext.request.contextPath}/resources/image/member/google.png");
				  background-repeat: no-repeat;
				  background-position: center center;
				  background-size: cover;
				  opacity: 1;
				  position: absolute;
				  top: 546px;
				  left: 660px;
				  overflow: hidden;
				}
				.v342_45 {
				  width: 600px;
				  height: 80px;
				  background: url("${pageContext.request.contextPath}/resources/image/member/naver.png");
				  background-repeat: no-repeat;
				  background-position: center center;
				  background-size: cover;
				  opacity: 1;
				  position: absolute;
				  top: 650px;
				  left: 660px;
				  overflow: hidden;
				}
				.v342_47 {
				  width: 600px;
				  height: 80px;
				  background: url("${pageContext.request.contextPath}/resources/image/member/kakao.png");
				  background-repeat: no-repeat;
				  background-position: center center;
				  background-size: cover;
				  opacity: 1;
				  position: absolute;
				  top: 444px;
				  left: 660px;
				  overflow: hidden;
				}
				.v342_54 {
				  width: 300px;
				  color: rgba(0,0,0,1);
				  position: absolute;
				  top: 329px;
				  left: 833px;
				  font-family: Roboto;
				  font-weight: Bold;
				  font-size: 36px;
				  opacity: 1;
				  text-align: left;
				}
				.v339_13 {
				  width: 69px;
				  height: 69px;
				  background: url("${pageContext.request.contextPath}/resources/image/member/logo.png");
				  background-repeat: no-repeat;
				  background-position: center center;
				  background-size: cover;
				  opacity: 1;
				  position: absolute;
				  top: 217px;
				  left: 925px;
				  overflow: hidden;
				}
		</style>