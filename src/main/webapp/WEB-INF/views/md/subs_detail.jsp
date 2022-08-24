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
			width: 500px; !important
		}
		
		#one_year {
			font-size : 20px;
		}
		
		#cost {
			font-size : 20px;
			color: dimgray;
		}
		</style>
	</head>
	<body>
		
		<div class="container" id="onemonth">
			<a id="onemonth">
				<br><br>
				<b>상부상酒 구독은 <br>
				어떻게 구성되나요?</b>
			</a>
		</div>
		
		<table class="subs_table" id="subs_table">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/md/subs_detail">
					<img src=${pageContext.request.contextPath}/resources/mdList/images/subs_thum.jpg>
				<br><br></a>
				<b><a id="one_year">
								1. 매월 컨셉에 맞춘 술 2~3개<br>
								2. 큐레이션 카드 <br>
								3. 랜덤 쿠폰</a></b><br><br><br>
				
							
		
<%-- 			<button class="yearbtn btn-info" type="button" onclick="location.href='${pageContext.request.contextPath}/order/sub_order?sub_id=1' ">한달체험</button> --%>
			
			<button class="yearbtn btn-info" type="button" onclick="location.href='${pageContext.request.contextPath}/order/sub_order?sub_id=2' ">결제하기</button>
		</tr>
		</table>
				
		
		<hr class="my-150">
		
	</body>
</html>