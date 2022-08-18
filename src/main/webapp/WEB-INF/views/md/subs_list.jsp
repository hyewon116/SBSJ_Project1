<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>정기구독 리스트</title>
		
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
			한 달에 한 번,<br>
			인생술을 만나보세요.
			</a>
		</div>
		
		<table class="subs_table" id="subs_table">
		<tr>
			<td>
				<a>
					<img src=${pageContext.request.contextPath}/resources/mdList/images/subs_thum.jpg>
				</a><br><br>
				<b><a id="one_year">상부상酒 한 달 체험권</a></b>
					<br>
				<a id="cost">36,000원 / 월</a>
			<td>
				<div class="subs_box">
				<a>
					<img src=${pageContext.request.contextPath}/resources/mdList/images/subs_thum.jpg>
				</a><br><br>
				<b><a id="one_year"> 상부상酒 일 년 구독권 </a></b>
					<br>
				<a id="cost">390,000원 / 년 </a>
			</td>
		</tr>
		</table>
		
		<hr class="my-150">
		
	</body>
</html>