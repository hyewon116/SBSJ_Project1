<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상부상酒  |  회원정보 확인</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

	
	<style type="text/css">

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
		
		
		/* password comfirm */
		
		.submit_button{
			text-align: center;
		}
		
		
		.submit_button .submit{
		    border-color: #0185da;
		    color: #fff;
		    background-color: #0e9ae9;
		    background-image: linear-gradient(#20b3f8,#0185d8);
		}
	

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
				<jsp:include page="/WEB-INF/views/mypage/navMypage.jsp"></jsp:include>
				<br>
				<br>			
			</nav>
			<!-- nav 끝 -->
			<main class="clearfix mt-1" style="height:500px">
				
				<!--  aside 시작 -->	
				<aside class="col-3 h-100 bg-white float-left">
					
					
				<jsp:include page="/WEB-INF/views/mypage/asideMypage.jsp"></jsp:include>
				<br>
				<br>			
				
				
				
				</aside>
				
			<!--  aside 끝 -->	
				
				<!-- section 시작--------------------------------------------------------------------------------- -->
				<section class="col-9 h-100 bg-white float-left">
					<h1>개인정보 수정</h1>
					  <hr style="width:100%;height:5px;border:none;background-color:black;">
					  	
		           	<h3>회원정보확인</h3>
		            <p>
		                <strong class="usermodify-auth-mail" style="color: #0185da;">${login_info.member_nick}</strong>님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.
		            </p>
		            	<table class="table table-hover">
		               		<tbody>
		                		<tr>
		                    		<th scope="row">이메일</th>
		                    		<td>
		                        	${login_info.member_email}
		                   			</td>
		               			</tr>
		                		<tr>
		                    		<th scope="row">
		                       			 비밀번호
		                    		</th>
				                    <td>
				                        <input type="password" id="member_pwd" name="member_pwd" maxlength="20" class="form-control">
										<label for="pwd" id="member_pwd_label"></label>
				                    </td>
		                		</tr>
	                		</tbody>
		            	</table>
		            	<br>
		            
		            	<div class="submit_button">
			               	<button id="pwd_btn" name="pwd_btn" class="submit">확인</button>
			               	<a href="${pageContext.request.contextPath}/mypage/member">
			               	<button type="button" class="cancel">취소</button></a>
		            	</div>
		        	</form>
		    	</section>
							  
				<!-- section 끝---------------------------------------------------------------------------- -->
			
			</main>
			
			
		</div><!-- container -->
	</body>
	<script type="text/javascript">
		$(document).ready(function() {
			/* 비밀번호 일치여부 확인 */
			$("#pwd_btn").click(function() {

				if( $.trim( $("#member_pwd").val() ) == "" || $.trim( $("#member_pwd").val() ) == null){//
					$("#member_pwd_label").text("비밀번호를 입력하세요.");
					return;
				} else { $("#member_pwd_label").text(""); }

				$.get(
						"${pageContext.request.contextPath}/mypage/pwd_chk"
						, { member_pwd : $("#member_pwd").val() 
							, member_email : "${login_info.member_email}"	
						}
						, function(data, status) {
							if(data == 0){// 중복되는 닉네임이 없을 경우
								$("#member_pwd_label").text("비밀번호가 틀렸습니다.");
								$("#member_pwd_label").css("color", "red");
							
							} else if(data >= 1){ // 중복되는 닉네임이 있을경우
								location.href="${pageContext.request.contextPath}/mypage/member_detail"
								return;
							} else {
								alert("잠시 후 다시 시도해 주세요.");
							}
						}//call back function
				);//get
			});//click
		});//ready
	</script>
	
</html>