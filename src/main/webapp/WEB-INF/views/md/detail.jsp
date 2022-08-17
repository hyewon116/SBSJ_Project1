<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 상품 상세 보기 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
		
		<style type="text/css">
		
		#table1 img{ 
			height:450px; !important
		}
		#table2 img{ 
			height:500px; !important
		}
		#table1 {
			margin-top: 20px;
		}
		#table2 {
			margin-left: auto; 
  			margin-right: auto;
  			border-spacing: 2px;
  			text-align: center;
		}
		#review {
			margin-right : 30px;
		} 
		#question {
			margin-right : 30px;
		} 
		#heart {
			height:10px; !important
		}

		</style>
	
	</head>
	<body>
		<div class="container">
		
		<!-- 상품 정보 + 구매 버튼 -->		
		<table class="table" id="table1">
			<col class="w-25">
			<tbody>
				<tr>
					<td rowspan="5"><img src="${detail_dto.md_thumbnail_path}"></td>
					<td colspan="2"> 
						<p style="font-size:27px; color:dimgray;"> 
						<b>${detail_dto.md_name}</b>
						</p>  
					</td>
					
					<!-- 찜 버튼 -->
					<td colspan="2">
						<button type="button" id="wish_btn" class="btn btn-danger btn-sm"> 
						♡
						</button>
					</td>
				</tr>
					<tr>
					<td>
						<h6>${detail_dto.md_oneline}</h6>
					</td>
					</tr>				
				<tr>
					<th> 판 매 가 </th>
					<td colspan="3">
						<fmt:formatNumber type="number" var="price" value="${detail_dto.md_price}" />
						<del>${price} 원</del>
						<fmt:formatNumber type="number" var="saleprice" value="${detail_dto.sale_price}" />
						<h3>${saleprice} 원</h3>
					</td>
				</tr>
				<tr>
					<th> 도 수 </th>
					<td> <b> <span> ${detail_dto.md_abv}</span> % </b></td>
				</tr>
				<tr>
					<th> 구 매 수 량 </th>
					<td>
						<form id="buy_now_form">
						<input type="hidden" id="md_id" name="md_id" value="${detail_dto.md_id }">
						<select id="buy_qty" name="buy_qty">
							<option value="0"> 선 택 </option>
							<c:forEach var="tmp_qty" begin="1" end="10">
								<option value="${tmp_qty}"> ${tmp_qty} </option>
							</c:forEach>
						</select>
						</form>
					</td>
					<th> 구 매 가 격 </th>
					<td><span id="tot_price_span"> 0 </span> 원 </td>
				</tr>
				<tr>
					<td colspan="4" class="text-right">
						<button type="button" id="jang_btn" class="btn btn-primary btn-lg"> 장바구니 담기 </button>
						<button type="button" id="buy_now_btn" class="btn btn-primary btn-lg"> 바로 구매하기 </button>
					</td>
				</tr>
			</tbody>
		</table>
		
		<!-- 상품 상세 설명 -->
		<br>
		<div style="text-align:center">
			<h6 style="color:dimgray;"><b>상품 상세 설명</b></h6> <br><br>
		</div>
		<table id="table2">
			<tbody>
				<tr>
					<th> </th>
					<td colspan="2"><img src="${detail_dto.md_detail_path}"></td>
				</tr>
				<tr>
					<th> </th>
					<td colspan="2"><br><br>${detail_dto.md_content}</td>
				</tr>
			</tbody>
		</table>
		<br>
		<hr>
		<br>
		
		<!-- 후기/문의/교환 버튼 -->
		<div class="text-center">
			<button type="button" class="btn btn-info" id="review"> 상품 후기 </button> 
			<button type="button" class="btn btn-warning" id="question"> 상품 문의 </button>
			<button type="button" class="btn btn-success" id="exchange"> 교환/반품 </button>
		</div>
		<br>
		<br>
		
		<div class="iframebox">
			<!-- 후기 페이지 -->
			<div id="review_list">
				<iframe src="${pageContext.request.contextPath}/mdreview/review_list?md_id=${md_id}"
				width="100%" height=700px frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
			</div>
			
			<!-- 문의 페이지 -->
			<div id="question_list">
				<iframe src="${pageContext.request.contextPath}/mdquestion/question_list?md_id=${md_id}"
				width="100%" height=700px frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
			</div>
			
			<!-- 교환/환불 페이지 -->
			<div id="exchange_list">
				<iframe src="${pageContext.request.contextPath}/mdreview/exchange"
				width="100%" height=700px frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
			</div>
		</div>
		
	<script type="text/javascript">
	
	//찜 목록 추가하기 
	$(document).ready(function() {
		$("#wish_btn").click(function() {
			
			//if로 찜목록 중복 체크하기!!! (같은 제품 또 안 넣도록)
			 //ex. 이미 찜 목록에 있는 아이템입니다.
			 // 아이디(member id) 체크 + md_id 체크 하면 될듯...?
			
			$.post(
					"${pageContext.request.contextPath}/md/wish_insert"
					, {
						md_id : ${detail_dto.md_id}
					}
					, function(data, status) {
						if(data >= 1){
							alert("찜 목록에 추가되었습니다.");
						} else {
							alert("찜 목록 추가를 실패 하였습니다.");
						}
					}//call back function
			);//post
		}); //click
	});//ready
	
	</script>
	
	<script type="text/javascript">
	</script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#buy_now_btn").click(function() {

			if("${login_info.member_id}" == ""){
				alert("로그인 해주세요.");
				return;
			}

			if( $("#buy_qty").val() == 0 ){
				alert("구매 수량을 선택 하세요.");
				return;
			}

			$("#buy_now_form").attr("action", "${pageContext.request.contextPath}/order/order_list");
			$("#buy_now_form").submit();
		});//click
	});//ready
	</script>
	<script type="text/javascript">
	
	//장바구니 담기 
	$(document).ready(function() {
		$("#jang_btn").click(function() {

			if("${login_info.member_id}" == ""){
				alert("로그인 해주세요.");
				return;
			}

			if( $("#buy_qty").val() == 0 ){
				alert("구매 수량을 선택 하세요.");
				return;
			}

			$.post(
					"${pageContext.request.contextPath}/cart/insert"
					, {
						md_id : ${detail_dto.md_id}
						, buy_qty : $("#buy_qty").val()
					}
					, function(data, status) {
						if(data >= 1){
							let tmp_bool = confirm("장바구니에 추가 하였습니다.\n장바구니로 이동 하시겠습니까?");
							if( tmp_bool == true ) location.href="${pageContext.request.contextPath}/cart/list";
						} else {
							alert("장바구니 추가를 실패 하였습니다.");
						}
					}//call back function
			);//post

		});//click
	});//ready
	</script>
	
	<script type="text/javascript">
	
	//하단 후기&문의&교환 페이지 설정
	$(document).ready(function() {

		//문의&교환 페이지 숨겨놓기
		$("#question_list").hide(); 
		$("#exchange_list").hide(); 
		
		//문의 페이지 보이기
		$("#question").click(function() {
					$("#question_list").show(10); //10ms = 0.01초
					$("#review_list").hide(); //나머지는 숨기기
					$("#exchange_list").hide(); 
			
		});//click

		//리뷰 페이지 보이기
		$("#review").click(function() {
				$("#review_list").show(10); 
				$("#question_list").hide();
				$("#exchange_list").hide(); 
		});//click
		
		//교환 페이지 보이기
		$("#exchange").click(function() {
				$("#exchange_list").show(10); 
				$("#question_list").hide();
				$("#review_list").hide();
		});//click
			
	}); //ready
	
	</script>

	</div>
	</body>
</html>














