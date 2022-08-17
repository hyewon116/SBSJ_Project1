<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>23layout.html</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

		
		<style type="text/css">
		
.nav_total {
    background-color: rgb(130, 188, 226);
    color: rgb(255, 255, 255);
    border-width: 1px 1px 1px 0px;
    border-top-style: solid;
    border-right-style: solid;
    border-bottom-style: solid;
    border-top-color: rgb(119, 174, 209);
    border-right-color: rgb(119, 174, 209);
    border-bottom-color: rgb(119, 174, 209);
    border-image: initial;
    border-left-style: initial;
    border-left-color: initial;
    height: 122px;
    font-weight: 100;
    font-style: normal;
    box-sizing: border-box;
    font-family: robotoThinNumber, roboto, "Courier New", Tahoma, NanumGothic, MalgunGothic, 돋움, dotum, sans-serif;
}

.nav_menu {
    position: relative;
    float: left;
    min-width: 200px;
    height: 120px;
    padding: 19px 0px 0px 30px;
    border-right: 1px solid rgb(155, 201, 232);
    border-left: 1px solid rgb(120, 173, 208);
    box-sizing: border-box;
}

.nav_menu4 {
    border-right: 0px;
    padding-left: 0px;
    padding-top: 0px;
    height: 118px;
}


.nav_menu_name {
    display: block;
    margin-bottom: 13px;
    height: 21px;
    color: rgb(255, 255, 255);
    font-size: 15px;
    font-weight: bold;
    text-shadow: rgb(0 0 0 / 20%) 0px 1px 0px;
    font-family: AppleSDGothicNeo;
}


.nav_menu_data {
    display: block;
    margin-top: -5px;
    text-shadow: rgb(0 0 50 / 15%) 0px 1px 1px;
}

.nav_menu_data > a {
    color: rgb(51, 51, 51);
    cursor: pointer;
    text-decoration: none;
}

.nav_menu_data span {
    color: rgb(255, 255, 255);
}

.nav_menu_data .data_big {
    color: rgb(255, 255, 255);
    font-size: 50px;
    line-height: 60px;
    cursor: pointer;
}


.nav_menu_data .data_small {
    margin-left: 5px;
    vertical-align: 2px;
    font-size: 12px;
}



.nav_menu2 {
    
    height: 62px;
    border-bottom: 1px solid rgb(120, 173, 208);
    box-sizing: border-box;
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
}

.nav_menu2_name {
    float: left;
    margin: 0px 0px 0px 30px;
    height: 21px;
    color: rgb(255, 255, 255);
    font-size: 15px;
    font-weight: bold;
    text-shadow: rgb(0 0 0 / 20%) 0px 1px 0px;
    font-family: AppleSDGothicNeo;
}


.nav_menu2 span {
    color: rgb(255, 255, 255);
}


.nav_menu2:nth-child(2) {
    height: 50%;
    border-bottom: 0px solid rgb(120, 173, 208);
    border-top: 1px solid rgb(155, 201, 232);
}

.__next-wrap a, .__next button { 
    -webkit-touch-callout: none; 
    user-select: none; 
    -webkit-user-select: none;
    cursor: pointer; 
    text-decoration: none; 
    outline: none; 
 } 

.data_big {
    margin: 0px 2px 0px 0px;
    color: rgb(255, 255, 255);
    font-size: 28px;
    line-height: 35px;
    text-shadow: rgb(0 0 0 / 20%) 0px 1px 0px;
}


.nav_menu2_data .data_small {
    margin: 12px 30px 0px 2px;
    vertical-align: 2px;
    font-size: 12px;
    text-shadow: rgb(0 0 0 / 20%) 0px 1px 0px;
}


.nav_menu2_data .data_big {
    margin: 0px 2px 0px 0px;
    color: rgb(255, 255, 255);
    font-size: 28px;
    line-height: 35px;
    text-shadow: rgb(0 0 0 / 20%) 0px 1px 0px;
}

/* test================================================================= */

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

/* update from */

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
							
				<dl class= "nav_total">
				
					<dd class="nav_menu">
						<strong class="nav_menu_name">미사용티켓</strong>
						<div class="nav_menu_data">
							<a href="https://mc.coupang.com/ssr/desktop/order/list?orderType=TRAVEL" data-clicklog-type="/click_side_menu_1911" data-log-type="click" data-log-id="1911" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;ticket_unused&quot;, &quot;currentPage&quot;: &quot;&quot; }">
								<span class="i18n-wrapper">
									<span class="data_big" id="unusedTicketCount">0</span>
									<span class="data_small">장</span>
								</span>
							</a>
						</div>
					</dd>
					<dd class="nav_menu">
						<strong class="nav_menu_name">배송중</strong>
						<div class="nav_menu_data">
							<a href="https://mc.coupang.com/ssr/desktop/order/list?orderType=DELIVERY" data-clicklog-type="/click_side_menu_1912" data-log-type="click" data-log-id="1912" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;myorders_count&quot;, &quot;currentPage&quot;: &quot;&quot;}">
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
							<a href="https://mc.coupang.com/ssr/desktop/discount-coupon" data-clicklog-type="/click_side_menu_1913" data-log-type="click" data-log-id="1913" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;coupons_count&quot;, &quot;currentPage&quot;: &quot;&quot;}">
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
						<a href="https://payment.coupang.com/rocketpay/mypage" data-clicklog-type="/click_side_menu_2206" data-log-type="click" data-log-id="2206" data-log-version="1" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;rocketmoney_count&quot;, &quot;currentPage&quot;: &quot;&quot;}" class="nav_menu2_data">
							<span class="i18n-wrapper">
								<span class="data_big" id="coupayMoneyBalance">40</span>
								<span class="data_small">원</span>
							</span>
						</a>
					</div>
					<div class="nav_menu2">
					<span class="nav_menu2_name">쿠팡캐시</span>
					<a href="https://cash.coupang.com/coupang-cash/home" data-clicklog-type="/click_side_menu_1914" data-log-type="click" data-log-id="1914" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;cash_count&quot;, &quot;currentPage&quot;: &quot;&quot;}" class="nav_menu2_data">
						<span class="i18n-wrapper">
							<span class="data_big" id="coupangCashBalance">4,390</span>
							<span class="data_small">원</span>
						</span>
					</a>
					</div>
					</dd>
				</dl>

			</nav>
			
			<!-- nav 끝 -->
			<main class="clearfix mt-1" style="height:500px">
				<aside class="col-3 h-100 bg-white float-left">
					
					
					
					<ul id="myMenu">
					  <li ><h1>My Page</h1></li>
					  <li><a href="#">주문내역</a></li>
					  <li><a href="#">찜한상품</a></li>
					  <li><a href="#">배송지 관리</a></li>
					  <li><a href="#">쿠폰</a></li>
					  <li><a href="#">상품문의</a></li>
					  <li><a href="#">상품후기</a></li>
					  <li><a href="#">개인정보 수정</a></li>
					</ul>
				
				
				
				</aside>
				
				
				<!-- section 시작--------------------------------------------------------------------------------- -->
				<section class="col-9 h-100 bg-white float-left">
					<h1>개인정보 수정</h1>
					  <hr style="width:100%;height:5px;border:none;background-color:black;">
					  
					  
					  
					  
					  
			<table class="table table-hover">
					<tbody>
						<tr>
						<br>
							<th> 이 름  </th>
							<td>
								<div class="input-group">
									<input type="text" id="member_name" name="member_name" maxlength="20" class="form-control" value="${naver_login_info.name}" readonly="readonly">
								</div>
							</td>
						</tr>
						<tr>
							<th> 이 메 일 </th>
							<td>
								<div class="input-group">
									<input type="text" id="member_email" name="member_email" maxlength="25" class="form-control" value="${naver_login_info.email}" readonly="readonly">
									<div class="input-group-append">
										<button id="email_btn" class="btn btn-primary"> email 중 복 체 크 </button>
									</div>
								</div>
										<label id="member_email_label"></label>
							</td>
						</tr>
						<tr>
							<th> 비 밀 번 호 </th>
							<td>
								<input type="password" id="member_pwd" name="member_pwd" maxlength="20" class="form-control">
								<label for="pwd" id="member_pwd_label"></label>
							</td>
						</tr>
						<tr>
							<th> 비 밀 번 호 확 인 </th>
							<td>
								<input type="password" id="remember_pwd" name="remember_pwd" maxlength="20" class="form-control">
								<label for="rempwd" id="remember_pwd_label"></label>
							</td>
						</tr>
						<tr>
							<th> 닉 네 임  </th>
							<td>
								<div class="input-group">
									<input type="text" id="member_nick" name="member_nick" maxlength="20" class="form-control" value="${login_info.nickname}">
									<div class="input-group-append">
										<button id="nick_btn" class="btn btn-primary"> 닉 네 임 중 복 체 크 </button>
									</div>
								</div>
								<label id="member_nick_label"></label>
							</td>
						</tr>
						<tr>
							<th> 전 화 번 호 </th>
							<td>
								<div class="input-group">
									<input type="text" id="member_phone" name="member_phone" maxlength="11" class="form-control" value="${login_info.mobile}" readonly="readonly">
									<div class="input-group-append">
										<button id="phone_btn" class="btn btn-primary"> 전 화 번 호 중 복 체 크 </button>
									</div>
								</div>
								<label id="member_phone_label"></label>
							</td>
						</tr>
						<tr>
							<th> 주 소 </th>
							<td>
								<div class="input-group">
									<div class="input-group">
										<span class="input-group-text"> 우 편 번 호 </span>
										<input type="text" id="member_addr1" name="member_addr1" readonly="readonly"
												class="form-control">
										<button id="addr_btn" class="btn btn-primary"> 주 소 검 색 </button>
									</div>
									
									<div class="input-group">
										<span class="input-group-text"> 주 소 </span>
										<input type="text" id="member_addr2" name="member_addr2" readonly="readonly"
												class="form-control">
									</div>
									<div class="input-group">
										<span class="input-group-text"> 상 세 주 소 </span>
										<input type="text" id="member_addr3" name="member_addr3" class="form-control">
									</div>
									
									<label for="addr1" id="member_addr1_label"></label>
								</div>
							</td>
						</tr>
						<tr>
							<th> 수 신 동 의 </th>
							<td>
								<div class="input-group mr-1">
									<div class="input-group-text">
										<input type="checkbox" id="email_agree" name="email_agree" class="mr-1"
												checked="checked"> EMAIL 수신을 동의 합니다.
									</div>
									
									
									<div class="input-group-text">
										<input type="checkbox" id="sms_agree" name="sms_agree" class="mr-1"
												checked="checked"> SMS 수신을 동의 합니다.
									</div>
									<div class="clearfix">
										<button id="join_btn" class="btn btn-primary float-right"> 회 원 가 입 </button>
									</div>
								</div>
							</td>
						</tr>
						
					</tbody>
				</table>
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
				</section>
				<!-- section 끝---------------------------------------------------------------------------- -->
			</main>
			
			
		</div><!-- container -->
	</body>
</html>