<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상부상酒</title>

<!--CSS 파일-->
<link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/mypage/css/navMypage.css">

<!--CDN-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	$.post(// 1:1 문의 답변대기 수
			"${pageContext.request.contextPath}/admin/admin_nav_qnaNcnt"
			, function(data, status) {
				if(data == 0){
					$("#qna_answer").text(0);
				} else if(data >= 1){
					$("#qna_answer").text(data);
				} else {
					alert("nav_잠시 후 다시 시도해 주세요.");
				}
			}//call back function
	);//post

	$.post(// 상품문의 답변대기 수
			"${pageContext.request.contextPath}/admin/admin_nav_questionNcnt"
			, function(data, status) {
				if(data == 0){
					$("#question_answer").text(0);
				} else if(data >= 1){
					$("#question_answer").text(data);
				} else {
					alert("nav_잠시 후 다시 시도해 주세요.");
				}
			}//call back function
	);//post
	
	$.post(// 상품 발송대기 수
			"${pageContext.request.contextPath}/admin/admin_order_NsendCnt"
			, function(data, status) {
				if(data == 0){
					$("#Nsend_order_list").text(0);
				} else if(data >= 1){
					$("#Nsend_order_list").text(data);
				} else {
					alert("nav_잠시 후 다시 시도해 주세요.");
				}
			}//call back function
	);//post
	
	$.post( // 이번달 총 매출금액 조회
			"${pageContext.request.contextPath}/admin/admin_order_Total_amt"
			, function(data, status) {
				if(data == 0){
					$("#total_amt_month").text(0);
				} else if(data >= 1){
					var tmp = data.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						$("#total_amt_month").text(tmp);
				} else {
					alert("nav_잠시 후 다시 시도해 주세요.");
				}
			}//call back function
	);//post
	
	$.post( // 금일 총 매출금액 조회
			"${pageContext.request.contextPath}/admin/admin_order_TodayAmt"
			, function(data, status) {
				if(data == 0){
					$("#total_amt_today").text(0);
				} else if(data >= 1){
					var tmp = data.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						$("#total_amt_today").text(tmp);
				} else {
					alert("nav_잠시 후 다시 시도해 주세요.");
				}
			}//call back function
	);//post
	
});//ready 

</script>
</head>

<nav>

	<dl class= "nav_total">
				
					<dd class="nav_menu">
						<strong class="nav_menu_name">1:1 문의 답변대기</strong>
						<div class="nav_menu_data">
							<a href="${pageContext.request.contextPath}/admin/admin_qna_answerN_list" data-clicklog-type="/click_side_menu_1911" data-log-type="click" data-log-id="1911" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;ticket_unused&quot;, &quot;currentPage&quot;: &quot;&quot; }">
								<span class="i18n-wrapper">
									<span id="qna_answer" class="data_big" id="unusedTicketCount"></span>
									<span class="data_small1">개</span>
								</span>
							</a>
						</div>
					</dd>
					<dd class="nav_menu">
						<strong class="nav_menu_name">상품문의 답변대기</strong>
						<div class="nav_menu_data">
							<a href="${pageContext.request.contextPath}/admin/admin_question_answerN_list" data-clicklog-type="/click_side_menu_1912" data-log-type="click" data-log-id="1912" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;myorders_count&quot;, &quot;currentPage&quot;: &quot;&quot;}">
								<span class="i18n-wrapper">
									<span id="question_answer" class="data_big" id="deliveringBoxCount"></span>
									<span class="data_small">개</span>
								</span>
							</a>
						</div>
					</dd>
						
					<dd class="nav_menu">
						<strong class="nav_menu_name">결제 완료</strong>
						<div class="nav_menu_data">
							<a href="${pageContext.request.contextPath}/admin/admin_order_NsendList" data-clicklog-type="/click_side_menu_1913" data-log-type="click" data-log-id="1913" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;coupons_count&quot;, &quot;currentPage&quot;: &quot;&quot;}">
								<span class="i18n-wrapper">
									<span id="Nsend_order_list" class="data_big" id="usableDiscountCouponCount"></span>
									<span class="data_small">건</span>
								</span>
							</a>
						</div>
					</dd>
						
					<dd class="nav_menu4">
					<div class="nav_menu2">
						<span class="nav_menu2_name">오늘의 총 매출</span>
						<a href="#" data-clicklog-type="/click_side_menu_2206" data-log-type="click" data-log-id="2206" data-log-version="1" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;rocketmoney_count&quot;, &quot;currentPage&quot;: &quot;&quot;}" class="nav_menu2_data">
							<span class="i18n-wrapper">
								<span id="total_amt_today" type="number" class="data_big" id="coupayMoneyBalance"></span>
								<span class="data_small">원</span>
							</span>
						</a>
					</div>
					<div class="nav_menu2">
					<span class="nav_menu2_name">이번달 총 매출</span>
					<a href="#" data-clicklog-type="/click_side_menu_1914" data-log-type="click" data-log-id="1914" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;cash_count&quot;, &quot;currentPage&quot;: &quot;&quot;}" class="nav_menu2_data">
						<span class="i18n-wrapper">
							<span id="total_amt_month" type="number" class="data_big" id="coupangCashBalance"></span>
							<span class="data_small">원</span>
						</span>
					</a>
					</div>
					</dd>
				</dl>

	</nav>

