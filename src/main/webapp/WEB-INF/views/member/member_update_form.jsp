<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상부상酒  |  회원정보 수정</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

		
		<style type="text/css">
		


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
					<h1>개인정보 수정</h1>
					  <hr style="width:100%;height:5px;border:none;background-color:black;">
					  
					  
					  
					  
					  
			<table class="table table-hover">
					<tbody>
						<c:forEach var="dto" items="${list}">
								<tr>
								<br>
									<th> 이 름  </th>
									<td>
										<div class="input-group">
											<a href="#"><p onclick="alert('SNS 간편 회원가입시 입력된 정보는 수정 할 수 없습니다.')">
											<input type="text" id="member_name" name="member_name" maxlength="20" class="form-control" value="${dto.member_name}" readonly="readonly">
											<input type="hidden" id="member_id" name="member_id" maxlength="20" class="form-control" value="${dto.member_id}" readonly="readonly">
											</p></a>
										</div>
									</td>
								</tr>
								<tr>
									<th> 이 메 일 </th>
									<td>
										<div class="input-group">
											<a href="#"><p onclick="alert('SNS 간편 회원가입시 입력된 정보는 수정 할 수 없습니다.')">
											<input type="text" id="member_email" name="member_email" maxlength="25" class="form-control" value="${dto.member_email}" readonly="readonly">
											<input type="hidden" id="member_email" name="member_email" maxlength="25" class="form-control" value="${dto.member_email}" readonly="readonly">
											</p></a>
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
											<input type="text" id="member_nick" name="member_nick" maxlength="20" class="form-control" value="${dto.member_nick}">
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
											<a href="#"><p onclick="alert('SNS 간편 회원가입시 입력된 정보는 수정 할 수 없습니다.')">
											<input type="text" id="member_phone" name="member_phone" maxlength="11" class="form-control" value="${dto.member_phone}" readonly="readonly">
											</p></a>
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
												<input type="text" id="member_addr1" name="member_addr1" value="${dto.member_addr1}" readonly="readonly"
														class="form-control">
												<button id="addr_btn" class="btn btn-primary"> 주 소 검 색 </button>
											</div>
											
											<div class="input-group">
												<span class="input-group-text"> 주 소 </span>
												<input type="text" id="member_addr2" name="member_addr2" value="${dto.member_addr2}" readonly="readonly"
														class="form-control">
											</div>
											<div class="input-group">
												<span class="input-group-text"> 상 세 주 소 </span>
												<input type="text" id="member_addr3" name="member_addr3" class="form-control" value="${dto.member_addr3}">
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
										</div>
									</td>
								</tr>
								<tr>
									<th> 개인정보 수정 </th>
									<td>
										<div class="clearfix">
												<button id="update_btn" class="btn btn-primary float-right"> 수 정 하 기 </button>
											</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
				</table>
					  
				</section>
				<!-- section 끝---------------------------------------------------------------------------- -->
			</main>
			
		</div><!-- container -->
		
	</body>
	<script type="text/javascript">
	
	let checkedNICK = "";
	let checkResult = null;
	let onlyPwd = /^[a-z0-9~!@#$%^&*().]+$/;
	
	
	$(document).ready(function() {
		
		/* 닉네임 중복여부  */
		$("#nick_btn").click(function() {
			if( $.trim( $("#member_nick").val() ) == "" || $.trim( $("#member_nick").val() ) == null){//
				$("#member_nick_label").text("닉네임을 입력하세요.");
				return;
			} else if( $.trim( $("#member_nick").val() ) == "${login_info.member_nick}"){// 현재 닉네임과 같은 경우
				$("#member_nick_label").text("현재 설정된 닉네임과 같습니다.");
				$("#member_nick_label").css("color","blue");
				checkResult = 0;
				return;
			} else { $("#member_nick_label").text(""); }

			$.get(
					"${pageContext.request.contextPath}/member/nick_chk"
					, { member_nick : $("#member_nick").val() }
					, function(data, status) {
						if(data == 0){
							$("#member_nick_label").text("사용 가능한 닉네임 입니다. / 변경하신 닉네임은 재로그인 시 적용됩니다.");
							$("#member_nick_label").css("color", "blue");
							checkedNICK = $("#member_nick").val();
							checkResult = 0;
							
						} else if(data >= 1){
							$("#member_nick_label").text("이미 사용 중인 닉네임 입니다.");
							$("#member_nick_label").css("color", "red");
							checkResult = 1;
							return;
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get

		});//click
		
		
		
		/* 회원 정보 수정 */
	$("#update_btn").click(function() {
			
			/* 비밀번호 유효성  */
			if( $("#member_pwd").val().match(onlyPwd) == null ){//허용되지 않은 글자는 null.
				$("#member_pwd_label").text("영문 소문자, 숫자, 특수 문자만 허용 됩니다.");
				return;
			} else { $("#member_pwd_label").text(""); }

			if( $("#member_pwd").val() != $("#remember_pwd").val() ){
				$("#remember_pwd_label").text("비밀번호와 비밀번호 확인이 서로 다릅니다.");
				return;
			} else { $("#remember_pwd_label").text(""); }

			
			/* 닉네임 중복체크 결과에 따른 적용 */
			
			if( $("#member_nick").val() == "" || $("#member_nick").val() == null){// 닉네임창의 값이 없을경우
				$("#member_nick_label").text("닉네임을 입력하세요."); // 메세지 출력
				return;
			} else { $("#member_nick_label").text(""); }
			
			
			if(checkResult >= 1){// 닉네임 중복 확인결과 1이상일경우 
				$("#member_nick_label").text("이미 사용 중인 닉네임 입니다.");
				$("#member_nick_label").css("color", "red");
				return;
			} else if(checkResult == null) {// 중복체크를 하지 않은경우 
				$("#member_nick_label").text(" 닉네임 중복체크를 해주세요. ");
				$("#member_nick_label").css("color", "red");
				return;
			} 
			
			
						
			/* 상세 주소 확인 */
			if( $("#member_addr3").val() == null || $("#member_addr3").val() == "" ){
				$("#member_addr1_label").text("상세주소를 입력해 주세요");
				return;//진행 중지
			} else { $("#member_addr1_label").text(""); }
			

			$.post(
					"${pageContext.request.contextPath}/member/member_update"
					, {
						member_id : $("#member_id").val()
						,member_name : $("#member_name").val()
						, member_email : $("#member_email").val()
						, member_pwd : $("#member_pwd").val()
						, member_nick : $("#member_nick").val()
						, member_phone : $("#member_phone").val()
						, member_addr1 : $("#member_addr1").val()
						, member_addr2 : $("#member_addr2").val()
						, member_addr3 : $("#member_addr3").val()
						, email_agree : $("#email_agree").prop("checked")
						, sms_agree : $("#sms_agree").prop("checked")
					}
					, function(data, status) {
						if(data == 1){
							alert("회원 정보가 수정되었습니다.");
							location.href="${pageContext.request.contextPath}/member/member_detail?member_email=${login_info.member_email}";
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
		
		
		
		
		
		
	});//ready
	</script>
	
	
</html>