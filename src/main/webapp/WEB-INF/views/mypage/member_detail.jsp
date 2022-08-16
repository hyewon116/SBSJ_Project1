<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상부상酒  |  회원정보 수정</title>
		
		<!-- CDN -->
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
		
		/* update from */
		
			#service_agree_label, #info_agree_label, #member_pwd_label, #remember_pwd_label, #member_nick_label, #member_addr1_label {
				color : red;
			}
		
		
		/* 개인정보 수정 */
		.member_info li {
					list-style: none;
					text-align: right;
					margin-right: 20px;
				}
		.update_btn{
					text-align: right;
				}
		.member_info {
					margin-left: 20px;
				}


	</style>	

		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			$("#addr_btn").click(function() {

			    new daum.Postcode({
			        oncomplete: function(data) {//data : 다음에서 주는 결과 값.
			        	$("#member_addr1").val(data.zonecode);
			        	$("#member_addr2").val(data.address);
			        }//call back function
			    }).open();

			});//click
		});//ready
		</script>

	</head>
	
	
	<body>
	<!-- header -->
		<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>
		<br>
		<br>
		
		<div class="container">
			
			<!-- nav 시작 -->
			<nav>
				<jsp:include page="/WEB-INF/views/mypage/navMypage.jsp"></jsp:include>
				<br>
				<br>			
			</nav>
			
			<!-- nav 끝 -->
			<main class="clearfix mt-1" style="height:500px">
			
			<!--  aside 시작 -->	
				<aside class="col-3 h-100 bg-white float-left">
					
					
				<jsp:include page="/WEB-INF/views/mypage/asideMypage.jsp"></jsp:include>
				<br>
				<br>			
				
				
				
				</aside>
				
			<!--  aside 끝 -->	
				
				
				<!-- section 시작--------------------------------------------------------------------------------- -->
				<section class="col-9 h-100 bg-white float-left">
					<h1>개인정보 수정</h1>
					  <hr style="width:100%;height:5px;border:none;background-color:black;">
					  
					  
					  
		<div class="member_info">			  
		 <h5>이름</h5>
			<ul>
				<li><u>${login_info.member_name}</u></li>
			</ul>
					  
		 <h5>이메일</h5>
			<ul>
				<li><u>${login_info.member_email}</u></li>
			</ul>
			
		 <h5>닉네임</h5>
			<ul>
				<li><u>${login_info.member_nick}</u></li>
			</ul>
			
		 <h5>전화번호</h5>
			<ul>
				<li><u>${login_info.member_phone}</u></li>
			</ul>
			
		 <h5>주소</h5>
			<ul>
				<li><u>${login_info.member_addr1}</u></li>
				<li><u>${login_info.member_addr2}</u></li>
				<li><u>${login_info.member_addr3}</u></li>
			</ul>
			
		 <h5>Email 수신동의</h5>
			<ul>
				<li><u>${login_info.email_agree}</u></li>
			</ul>
			
		 <h5>SMS 수신동의</h5>
			<ul>
				<li><u>${login_info.sms_agree}</u></li>
			</ul>
		</div>				
				<div class="update_btn">
					<button id="update_btn" class="btn btn-primary float-info"> 수 정 하 러 가 기 </button>
				</div>
			
					  
				</section>
				<!-- section 끝---------------------------------------------------------------------------- -->
			</main>
			
		</div><!-- container -->
		
	</body>
	<script type="text/javascript">
	
	
	
	$(document).ready(function() {
		
		/* 수정하러 가기 */			
		$("#update_btn").click(function() {

			
			
		location.href="${pageContext.request.contextPath}/mypage/member_update_form";
		
		
		
		});//click
			
	});//ready
	</script>
	
	
</html>