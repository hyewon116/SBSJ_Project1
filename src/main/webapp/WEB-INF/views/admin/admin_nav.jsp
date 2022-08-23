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
	let chkQnaNcnt = "";
	$.post(
			"${pageContext.request.contextPath}/admin/admin_nav_qnaNcnt"
			, function(data, status) {
				if(data == 0){
					alert("미답변 문의가 없습니다.")
					
				} else if(data >= 1){
					alert(data);
					$("#qna_reply").attr("value", data);
					$("#data_small1").text(data);
					
				} else {
					alert("잠시 후 다시 시도해 주세요.");
				}
			}//call back function
	);//get
	
	
	
	
	
	
});//ready 






</script>
</head>

<nav>

	<dl class= "nav_total">
				
					<dd class="nav_menu">
						<strong class="nav_menu_name">1:1 미답변 게시글</strong>
						<div class="nav_menu_data">
							<a href="#" data-clicklog-type="/click_side_menu_1911" data-log-type="click" data-log-id="1911" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;ticket_unused&quot;, &quot;currentPage&quot;: &quot;&quot; }">
								<span class="i18n-wrapper">
									<span class="data_big" id="unusedTicketCount"></span>
									<span class="data_small1">개</span>
									 
									<input id="qna_reply" class="data_small">개
								</span>
							</a>
						</div>
					</dd>
					<dd class="nav_menu">
						<strong class="nav_menu_name">배송중</strong>
						<div class="nav_menu_data">
							<a href="#" data-clicklog-type="/click_side_menu_1912" data-log-type="click" data-log-id="1912" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;myorders_count&quot;, &quot;currentPage&quot;: &quot;&quot;}">
								<span class="i18n-wrapper">
									<span class="data_big" id="deliveringBoxCount">0</span>
									<span class="data_small">개</span>
								</span>
							</a>
						</div>
					</dd>
						
					<dd class="nav_menu">
						<strong class="nav_menu_name">할인쿠폰</strong>
						<div class="nav_menu_data">
							<a href="#" data-clicklog-type="/click_side_menu_1913" data-log-type="click" data-log-id="1913" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;coupons_count&quot;, &quot;currentPage&quot;: &quot;&quot;}">
								<span class="i18n-wrapper">
									<span class="data_big" id="usableDiscountCouponCount">0</span>
									<span class="data_small">장</span>
								</span>
							</a>
						</div>
					</dd>
						
					<dd class="nav_menu4">
					<div class="nav_menu2">
						<span class="nav_menu2_name">쿠페이 머니</span>
						<a href="#" data-clicklog-type="/click_side_menu_2206" data-log-type="click" data-log-id="2206" data-log-version="1" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;rocketmoney_count&quot;, &quot;currentPage&quot;: &quot;&quot;}" class="nav_menu2_data">
							<span class="i18n-wrapper">
								<span class="data_big" id="coupayMoneyBalance">40</span>
								<span class="data_small">원</span>
							</span>
						</a>
					</div>
					<div class="nav_menu2">
					<span class="nav_menu2_name">쿠팡캐시</span>
					<a href="#" data-clicklog-type="/click_side_menu_1914" data-log-type="click" data-log-id="1914" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;cash_count&quot;, &quot;currentPage&quot;: &quot;&quot;}" class="nav_menu2_data">
						<span class="i18n-wrapper">
							<span class="data_big" id="coupangCashBalance">4,390</span>
							<span class="data_small">원</span>
						</span>
					</a>
					</div>
					</dd>
				</dl>

	</nav>

