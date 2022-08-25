<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상부상酒 | 이벤트 리스트</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
		<style type="text/css">
		
		#coupon_title {
			margin-top: 20px;
			margin-bottom: 50px;
			text-align: center; 
			font-size : 25px;
			font-color : brown;
		}
		
		#event_table {
			margin-left: auto;
  			margin-right: auto; 
  			margin-bottom : 100px;
  			text-align: center; 
		}
		#event_table td{
			padding-right : 20px;
			padding-left : 20px;
		}
		
		#event_table div {
			border: 1px solid black;
			padding-top : 10px;
			padding-right : 10px;
			padding-left : 10px;
			padding-bottom : 10px;
		}
		
		
		#event_table img {
			width: 250px; !important
		}
		
		</style>
	</head>
	<body>
		
		<div class="container" id="coupon_title">
			<a id="coupon_title">
				<br><br>
				<b>상부상주의 가을맞이 쿠폰</b>
			</a>
		</div>
		
		<table id="event_table">
		<tr>	
			<td>	
				<div>
					<h4><b>30%</b></h4>
					<h5 style="color:brown;"><b>가입 축하 쿠폰</b></h5>
					<h6>사용기간 ~2022.09.30.</h6>
					<br><button id="coupon1" class="btn btn-warning" type="button"> 발급 받기 </button>
				</div>
			<td>
			<td>
				<div>
					<h4><b>10%</b></h4>
					<h5 style="color:brown;"><b>추천인 쿠폰</b></h5>
					<h6>사용기간 ~2022.09.30.</h6>
					<br><button id="coupon2" class="btn btn-warning" type="button"> 발급 받기 </button>
				</div>
			<td>
			<td>
				<div>
					<h4><b>10%</b></h4>
					<h5 style="color:brown;"><b>추석맞이 쿠폰</b></h5>
					<h6>사용기간 ~2022.09.30.</h6>
					<br><button id="coupon3" class="btn btn-warning" type="button"> 발급 받기 </button>
				</div>
			<td>
		</tr>
		</table>
		<br>
		
	</body>
	
	<script type="text/javascript">
   
   //쿠폰 발급받기 1
   $(document).ready(function() {
      $("#coupon1").click(function() {
    	  
    	 //로그인 체크
//     	  if("${login_info.member_id}" == ""){
//               alert("로그인 해주세요.");
//               return;
//     	  }   
           
	         $.post(
	               "${pageContext.request.contextPath}/md/coupon_insert"
	               , {
	                  member_id : ${login_info.member_id}
	               	  , coupon_name : "가입축하 쿠폰"
	               	  , coupon_dis : "30"
	               	  , coupon_end : "2022-09-30"
	               }
	               , function(data, status) {
	                  if(data >= 1){
	                     alert("쿠폰이 발급되었습니다.");
	                  } else {
	                	  alert("이미 발급된 쿠폰입니다.");
	                  }
	               }//call back function
	         );//post
      }); //click
   });//ready
   
   </script>
   
   
   <script type="text/javascript">
   
   //쿠폰 발급받기 1
   $(document).ready(function() {
      $("#coupon2").click(function() {
    	  
    	 //로그인 체크
//     	  if("${login_info.member_id}" == ""){
//               alert("로그인 해주세요.");
//               return;
//     	  }   
           
	         $.post(
	               "${pageContext.request.contextPath}/md/coupon_insert"
	               , {
	                  member_id : ${login_info.member_id}
	               	  , coupon_name : "추천인 쿠폰"
	               	  , coupon_dis : "10"
	               	  , coupon_end : "2022-09-30"
	               }
	               , function(data, status) {
	                  if(data >= 1){
	                     alert("쿠폰이 발급되었습니다.");
	                  } else {
	                	  alert("이미 발급된 쿠폰입니다.");
	                  }
	               }//call back function
	         );//post
      }); //click
   });//ready
   
   </script>
   
   <script type="text/javascript">
   
   //쿠폰 발급받기 1
   $(document).ready(function() {
      $("#coupon3").click(function() {
    	  
    	 //로그인 체크
//     	  if("${login_info.member_id}" == ""){
//               alert("로그인 해주세요.");
//               return;
//     	  }   
           
	         $.post(
	               "${pageContext.request.contextPath}/md/coupon_insert"
	               , {
	                  member_id : ${login_info.member_id}
	               	  , coupon_name : "추석맞이 쿠폰"
	               	  , coupon_dis : "10"
	               	  , coupon_end : "2022-09-30"
	               }
	               , function(data, status) {
	                  if(data >= 1){
	                     alert("쿠폰이 발급되었습니다.");
	                  } else {
	                	  alert("이미 발급된 쿠폰입니다.");
	                  }
	               }//call back function
	         );//post
      }); //click
   });//ready
   
   </script>
   
   <%@ include file="/WEB-INF/views/footerMain.jsp" %>
</html>