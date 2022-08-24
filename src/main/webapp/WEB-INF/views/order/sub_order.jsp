<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 주 문 서 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		
		<style type="text/css">
		ul {
		list-style-type:none 
		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/headerMain.jsp" %>

<!-- 타이틀 -->	
	<div class="container col-sm-8">
		<hr>
		<h3> 정기구독 결제 </h3>
		<hr>
	</div>	
<!-- 상품 정보 시작 -->		
		<div class="container col-sm-8">
<!-- 		<div class="border rounded p-3 mb-3"></div>
 -->		<table class="table table-hover">
				<col class="col-2">
				<col class="col-2">
				<thead>
				</thead>
					<td></td>
				<tbody>
						<c:set var="dto" value="${subList[0]}" />
						<tr>
							<!-- 상품 이미지 -->
							<td>
								<a>
									<img src=${pageContext.request.contextPath}/resources/mdList/images/subs_detail.png>
								</a>
							</td>
						</tr>
					
					
						</tbody>
				</table>
				<hr>
			</div>
<!-- 상품 정보 끝 -->		

<br><br>

<!-- 구매자 정보 시작 -->	
			<div class="container col-sm-8">	
				<h4>구매자 정보</h4>
				<table class="table table-hover">
						<tr>
						<th>이름  </th> <td>${memberdto.member_name} </td> 
						</tr>
						<tr>
						<th>이메일</th> <td>${memberdto.member_email}</td> 
						</tr>
						<tr>
						<th> 휴대폰 번호 </th>	<td>${memberdto.member_phone}  </td> 
						</tr>
				</table>
				<hr>
			</div>
<!-- 구매자 정보 끝 -->

<br><br>

<!-- 받는 사람 정보 시작 -->		
		<div class="container col-sm-8">
			<h4>받는 사람정보</h4> <hr>
				<div class="col-6">
				
					<table class="table table-hover table-borderless">
						<tr>
							<td id="td_delivery">
								<c:choose>
									<c:when test="${deliverylist != null && deliverylist[0] != null}">
										<div class="card">
											<div class="card-body">
												<h5 class="card-title">배송지 : ${deliverylist[0].addr_name}</h5>
												<p class="card-text">받는 분 : ${deliverylist[0].receiver} ( 연락처 : ${deliverylist[0].member_phone} )</p>
												<p class="card-text">( ${deliverylist[0].post_code} ) ${deliverylist[0].delivery_addr1} ${deliverylist[0].delivery_addr2}</p>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<h5> 등록된 배송지가 없습니다. </h5>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
					
						<input type="hidden" id="delivery_id" name="delivery_id"
							<c:if test="${deliverylist != null && deliverylist[0] != null}">
								value="${deliverylist[0].delivery_id}"
							</c:if>
						>
			</div>
			<hr>
		</div>
<!-- 받는 사람 정보 끝 -->

<br><br>



<!-- 결제 정보 시작 -->
 <div class="container col-sm-8">
		
			<div class="col-6">
				<table class="table table-hover">
					<th> <h3>총 결 제 금 액</h3> </th>

						<td class="text-right"> ${dto.sub_price}원</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<button id="kakao_btn" class="btn btn-warning btn-lg"> 카카오페이 </button>
						</td>
					</tr>
				
				</table>
			</div>
		</div>
		<hr>
<!-- 결제 정보 끝 -->		

<%-- 	<%@ include file="/WEB-INF/views/footer.jsp" %> --%>



<!-- # 카카오페이 -->
<script type="text/javascript">
	    $(document).ready(function(){
	    	$("#kakao_btn").click(function() {
	    	kakaoPay();
	     });
	    })
	    function kakaoPay() {
	    	IMP.init('imp82628187');
	    	
		    IMP.request_pay({
		    pg: "kakaopay"
		    ,pay_method: "card" //결제시 카드결제만 해야함. 카카오포인트로 결제 불가.
	        ,merchant_uid:'merchant_'+new Date().getTime() //상점에서 관리하는 주문 번호
	        ,name: $("#md_name").val()			
	        ,amount: $("#span_sum_total_buy_amt").val()
	        ,buyer_name: '${login_info.member_name}'  			
	        ,buyer_tel:'${login_info.member_phone}' 		
	        ,buyer_email: '${login_info.member_email}'		
		    }
	        , function(rsp) { //callback
                let _delivery_id = $("#delivery_id").val();

	        	if (rsp.success) {
	                var msg = '결제가 완료 되었습니다.';
                    msg += ' 고유ID : ' + rsp.imp_uid;
                    msg += ' 상점 거래ID : ' + rsp.merchant_uid;
                    msg += ' 결제 금액 : ' + rsp.paid_amount;
                    msg += ' 결제 수단 : ' + rsp.pay_method;
                    msg += ' 카드 승인번호 : ' + rsp.apply_num;
                    msg += ' 결제 승인 시간 : ' + rsp.paid_at;
                    msg += ' 구매자 이름 : ' + rsp.buyer_name;
                    msg += ' 구매자 전화번호 : ' + rsp.buyer_tel;
                    $.post(
        					"${pageContext.request.contextPath}/order/insert"
        					, {
        						delivery_id : $("#delivery_id").val()
        						, order_amt : $("#span_sum_buy_amt").val()
        						, pay_amt : rsp.paid_amount
        					},
        					function(data, status) {
        						if(data >= 1){
        							alert("주문을 성공적으로 등록 하였습니다.");
        							location.href="${pageContext.request.contextPath}/order/paySuccess";
        						} else if(data <= 0){
        							alert("주문 등록을 실패 하였습니다.");
        						} else {
        							alert("잠시 후 다시 시도해 주세요.");
        						}
        					}//call back function
        			);//post
                    
	            } else {
	            	var msg = '결제에 실패 하였습니다.';
                    msg += ' 에러내용 : ' + rsp.error_msg;
                    msg += ' 에러코드: ' + rsp.error_code;
	            }
	            alert(msg);
	        });
	    };
</script>





	</body>
</html>
