<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>정기구독 설명</title>
		
		<style type="text/css">
		
		#onemonth {
			margin-top: 20px;
			margin-bottom: 50px;
			text-align: center; 
			font-size : 20px;
		}
		
		#subs_table {
			margin-left: auto;
  			margin-right: auto; 
  			border-spacing: 100px;
  			margin-bottom : 100px;
  			text-align: center;
		}
		
		#subs_table img {
			width: 250px; !important
		}
		
		#one_year {
			font-size : 15px;
		}
		
		#cost {
			font-size : 15px;
			color: dimgray;
		}
		</style>
	</head>
	<body>
		
		<div class="container" id="onemonth">
			<a id="onemonth">
			
			<br><br>
			상부상酒 구독은 <br>
			어떻게 구성되나요?
			</a>
		</div>
		
		<table class="subs_table" id="subs_table">
		<tr>
			<td>
				<a>
					<img src=${pageContext.request.contextPath}/resources/mdList/images/subs_detail.png>
				</a><br><br>
				<b><a id="one_year">
								1. 매월 컨셉에 맞춘 술 2~3개<br>
								2. 큐레이션 카드 <br>
								3. 랜덤 쿠폰</a></b><br><br><br>
				
				<a id="cost">매월 15일에 결제되고,<br>
							18일에 배송돼요.</a><br><br><br>
							
			<button class="btn btn-info" type="button"> 구독 신청하기 </button>
		</tr>
		</table>
				
		
		<hr class="my-150">
		
	</body>
</html>