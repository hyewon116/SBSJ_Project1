<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 배 송 지 추 가 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			$("#addr_btn").click(function() {

			    new daum.Postcode({
			        oncomplete: function(data) {//data : 다음에서 주는 결과 값.
			        	$("#post_code").val(data.zonecode);
			        	$("#delivery_addr1").val(data.address);
			        }//call back function
			    }).open();

			});//click
		});//ready
		</script>
		<style type="text/css">
		.write_label {
			font-size : 0.7em;
			color : red;
		}
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

#disable_btn {
	margin-right : 30px;
}
#insert {
	margin-right : 30px;
}
		</style>
	</head>
	<body>
	<!-- header -->
			<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>
			<br>
			<br>
	
	
		<div class="container">
			
			<!-- nav 시작 -->
			<nav>
				<jsp:include page="/WEB-INF/views/member/mypage_nav.jsp"></jsp:include>
				<br>
				<br>			
			</nav>
			<!-- nav 끝 -->
			<main class="clearfix mt-1" style="height:500px">
				
				<!--  aside 시작 -->	
				<aside class="col-3 h-100 bg-white float-left">
					
					
				<jsp:include page="/WEB-INF/views/member/mypage_aside.jsp"></jsp:include>
				<br>
				<br>			
				
				
				
				</aside>
				
			<!--  aside 끝 -->	
			<!-- section 시작--------------------------------------------------------------------------------- -->
				<section class="col-9 h-100 bg-white float-left">
		<hr>
		<h3> 배 송 지 관 리 </h3>
		<hr>
		<div class="row">
			<div class="col-6">
				<table class="table table-hover">
					<tbody>
						<c:forEach var="dto" items="${list}">
						
							<tr>
								<td>
									<h5> 배송지 : ${dto.addr_name} </h5>
									<h6> 받으시는 분 : ${dto.receiver} ( 연락처 : ${dto.member_phone} ) </h6>
									<h6> ( ${dto.post_code} ) ${dto.delivery_addr1} ${dto.delivery_addr2} </h6>
								</td>
								<td class="text-right">
								<c:if test = "${dto.isdefault == '0'}">
											<button class="addr_delete_btn btn btn-danger btn-sm mt-1 mb-1" value="${dto.delivery_id}"> 삭제 </button>
										</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-6">
				<table class="table table-hover">
					<tbody>
						<tr>
							<th> 배 송 지 명 </th>
							<td>
								<input type="text" class="form-control" id="addr_name" name="addr_name" maxlength="20">
								<label for="addr_name" id="addr_name_label" class="write_label"></label>
							</td>
						</tr>
						<tr>
							<th> 받 는 분 </th>
							<td>
								<input type="text" class="form-control" id="receiver" name="receiver" maxlength="20">
								<label for="receiver" id="receiver_label" class="write_label"></label>
							</td>
						</tr>
						<tr>
							<th> 연 락 처 </th>
							<td>
								<input type="text" class="form-control" id="member_phone" name="member_phone" placeholder="'-' 를 제외한 숫자만 입력해 주세요." maxlength="15">
								<label for="member_phone" id="member_phone_label" class="write_label"></label>
							</td>
						</tr>
						<tr>
							<th> 주 소 </th>
							<td>
								<div class="form-inline">
									<input type="text" id="post_code" name="post_code" readonly="readonly" class="form-control mb-1 mr-1">
									<button id="addr_btn" type="button" class="btn btn-info btn-sm mb-1">
										주 소 찾 기
									</button>
								</div>
								<input type="text" id="delivery_addr1" name="delivery_addr1" readonly="readonly" class="form-control mb-1">
								<input type="text" id="delivery_addr2" name="delivery_addr2" class="form-control" maxlength="50">
								<label for="post_code" id="post_code_label" class="write_label"></label>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center">
								<button id="write_btn" type="button" class="btn btn-info btn-block"> 배송지 추가 </button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		</section>
				<!-- section 끝---------------------------------------------------------------------------- -->
<%-- 	<%@ include file="/WEB-INF/views/footer.jsp" %> --%>

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
							location.href="${pageContext.request.contextPath}/delivery/form2";
						} else {
							alert("배송지 주소 삭제를 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	let onlyNum = /^[0-9]+$/;

	$(document).ready(function() {
		$("#write_btn").click(function() {

			if( $.trim( $("#addr_name").val() ) == "" ){
				$("#addr_name_label").text("배송지명을 입력 하세요.");
				return;
			} else { $("#addr_name_label").text(""); }

			if( $.trim( $("#receiver").val() ) == "" ){
				$("#receiver_label").text("받는 분 이름을 입력 하세요.");
				return;
			} else { $("#receiver_label").text(""); }

			if( $("#member_phone").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
				$("#member_phone_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#member_phone_label").text(""); }

			if( $.trim( $("#post_code").val() ) == ""
					|| $.trim( $("#delivery_addr1").val() ) == ""
					|| $.trim( $("#delivery_addr2").val() ) == "" ){
				$("#post_code_label").text("주소를 입력 하세요.");
				return;
			} else { $("#post_code_label").text(""); }

			$.post(
					"${pageContext.request.contextPath}/delivery/insert"
					, {
						addr_name : $("#addr_name").val()
						, receiver : $("#receiver").val()
						, member_phone : $("#member_phone").val()
						, post_code : $("#post_code").val()
						, delivery_addr1 : $("#delivery_addr1").val()
						, delivery_addr2 : $("#delivery_addr2").val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("주소를 성공적으로 등록 하였습니다.");
							location.href="${pageContext.request.contextPath}/delivery/form2";
						} else if(data <= 0){
							alert("주소 등록을 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
	});//ready
	</script>

	</body>
</html>
