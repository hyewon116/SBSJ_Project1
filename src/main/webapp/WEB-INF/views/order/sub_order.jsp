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
		th {
		background: rgba(231,231,231,0.4)
		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/headerMain.jsp" %>

<!-- 타이틀 -->	
	<div class="container col-sm-8">
		<hr>
		<h3> 주문  / 결제 </h3>
		<hr>
		
	</div>	
<!-- 상품 정보 시작 -->		
		<div class="container col-sm-8">
<!-- 		<div class="border rounded p-3 mb-3"></div>
 -->		<table class="table table-hover">
				<col class="col-1">
				<thead>
					<tr>
						<th><!-- 상품이미지 --></th>
						<th> 상품 </th>
						<th> </th>	
						<th> 가격 </th>
					</tr>
				</thead>
					<tbody> 
						<c:forEach var="sub" items="${subList}" varStatus="status">
							<c:set var="sub_price" value="${sub.sub_price}" />
							<tr>
								<!-- 상품 이미지 -->
								<td>
									<img src="${pageContext.request.contextPath}/resources/mdList/images/subs_thum.jpg"  width="130" height="200">
								</td>
								
								<!-- 상품 이름 -->
								<td>
									<a href="${pageContext.request.contextPath}/md/subs_list">
										${sub.sub_name}
									</a>
									<input type=hidden id="sub_name" value="${sub.sub_name}">
									<input type=hidden id="sub_id" value="${sub.sub_id}">
								</td>
								
								<!-- 수량 -->
		                        <td>한 달에 한 번, 인생술을 만나보세요.</td>
		                        
		                        <!-- 가격 -->
		                        <td> ${sub.sub_price} 원 </td>
							</tr>
						</c:forEach>
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
						<th  width="20%">이름  </th> <td>${memberdto.member_name} </td> 
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
				<div class="col-8" >
				
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
						<tr>
							<td>
								<a href="javascript:void(0);" onclick="goAddDelivery();">
									<button type="button" class="btn btn-primary btn-sm">
										배 송 지 추 가
									</button>
								</a>
								<button id="delivery_btn" type="button" class="btn btn-primary btn-sm"
								 		data-toggle="modal" data-target="#delivery_choice_modal">
									배 송 지 선 택
								</button>
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
		
			<div class="col-8">
				<table class="table table-hover">
					<tr>
						<th width="40%"> <h5>총 결제 금액</h5> </th>
						<td class="text-right"><span id="sub_price">${sub_price}</span>원</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<button id="kakao_btn" class="btn btn-warning btn-lg"> 카카오페이 </button>
						</td>
					</tr>
				</table>
			</div>
		</div>
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
		    ,pay_method: "card"
	        ,merchant_uid:'merchant_'+new Date().getTime() //상점에서 관리하는 주문 번호
	        ,name: $("#sub_name").val()			
	        ,amount: $("#sub_price").text()
	        ,buyer_name: '${login_info.member_name}'  			
	        ,buyer_tel:'${login_info.member_phone}' 		
	        ,buyer_email: '${login_info.member_email}'		
		    }
	        , function(rsp) { //callback
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
        					"${pageContext.request.contextPath}/order/sub_insert"
        					, {
        						delivery_id : $("#delivery_id").val()
        						, sub_price : rsp.paid_amount
        						, sub_name : rsp.name
        						, sub_id : $("#sub_id").val()
        						
        					},
        					function(data, status) {
        						if(data >= 1){
        							alert("주문 등록을 성공 하였습니다.");
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

<!-- delivery modal start -->

	<div class="modal" id="delivery_choice_modal">
		<div class="modal-dialog">
			<div class="modal-content" >

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"> 배 송 지 선 택 </h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table table-hover table-borderless">
						<col class="col-10">
						<tbody>
							<c:forEach var="dto" items="${deliverylist}" varStatus="status">
								<tr>
									<td id="td_delivery${status.index}">
										<div class="card">
											<div class="card-body">
												<h5 class="card-title">배송지 : ${dto.addr_name}</h5>
												<p class="card-text">받는 분 : ${dto.receiver} ( 연락처 : ${dto.member_phone} )</p>
												<p class="card-text">( ${dto.post_code} ) ${dto.delivery_addr1} ${dto.delivery_addr2}</p>
											</div>
										</div>
									</td>
									<td class="text-right">
										<c:if test = "${dto.isdefault == '0'}">
											<button class="addr_delete_btn btn btn-danger btn-sm mt-1 mb-1" value="${dto.delivery_id}"> 삭제 </button>
										</c:if>
										<button class="addr_choice_btn btn btn-primary btn-sm" value="${dto.delivery_id}" name="${status.index}"data-dismiss="modal"> 선택 </button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="javascript:void(0);" onclick="goAddDelivery();">
						<button type="button" class="btn btn-primary btn-sm">
							배 송 지 추 가
						</button>
					</a>
					<button type="button" class="btn btn-warning btn-sm" data-dismiss="modal"> 취 소 </button>
				</div>

			</div>
		</div>
	</div>
	<!-- delivery modal end -->


<!-- # 배송지 모달 선택 버튼  -->
<script type="text/javascript">
	$(document).ready(function() {
		$(".addr_choice_btn").click(function() {

			$("#td_delivery").html( $("#td_delivery" + $(this).attr("name") ).html() );
			$("#delivery_id").val( $(this).val() );
// 			$("#delivery_choice_modal").modal("hide");

		});//click
	});//ready
</script>

<!-- # 배송지 모달 주소 삭제 버튼 -->
<script type="text/javascript">
	$(document).ready(function() {
		$(".addr_delete_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/delivery/delete"
					, {
						delivery_id : $(this).val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("배송지 주소를 삭제 하였습니다.");
							location.href="${pageContext.request.contextPath}/order/order_list?arr_cart_id="+arr_cart_id;
						} else {
							alert("배송지 주소 삭제를 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	let arr_cart_id = ${arr_cart_id};
	let str_cart_id = "";
	$.each( ${arr_cart_id}, function(idx, str) {
		//alert(idx + " : " + str);
		if(idx == 0){
			str_cart_id = str_cart_id + str;
		} else {
			str_cart_id = str_cart_id + "," + str;
		}
	});//each
	let buy_now_md_id = "${list[0].md_id}";
	let buy_now_qty = "${list[0].buy_qty}";
    function goAddDelivery() {
        if(arr_cart_id.length > 0 && arr_cart_id[0] == "0") {   // 즉구
           location.href = "${pageContext.request.contextPath}/delivery/form?md_id=" + buy_now_md_id + "&buy_qty=" + buy_now_qty;
        } else {   // 장바구니
           location.href = "${pageContext.request.contextPath}/delivery/form?arr_cart_id=" + str_cart_id;
        }
     }
</script>


	</body>
</html>
