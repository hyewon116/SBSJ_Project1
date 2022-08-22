<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상부상酒  |  개인 문의 디테일</title>
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
		
		#wish_table img {
			width : 70px;
		}
		#delete_btn {
			margin-right : 30px;
		}
		
	</style>	
	</head>
	
	<!-- body 시작 -->
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
				<br><br>			
				</aside>
				<!--  aside 끝 -->
				
				
				<!-- section 시작--------------------------------------------------------------------------------- -->
				<section class="col-9 h-100 bg-white float-left">
					<h3> 상품 문의 관리 </h3>
					  <hr style="width:100%;height:1px;border:none;background-color:black;">
					  	
			<div class="container">
		
		<!-- 문의 디테일 -->
		<table class="table table-hover" id="table1">
			<col class="w-25">
			<tbody>
				<tr>
					<th>작성일자</th>
					<td>${detail_dto.md_question_date}</td>
					<th>작성자</th> 
					<td>${detail_dto.member_nick}</td>
				</tr>
				<tr>
					<th> 문의 제목 </th>
					<td colspan="3">${detail_dto.md_question_title}</td>
				</tr>
				<tr>
					<th> 내용 </th>
					<td colspan="3">${detail_dto.md_question_content}</td>
				</tr>
			</tbody>
		</table>
		
		<!-- 문의 목록가기 버튼 : 누구나 보임 -->
		<div class="text-center">
			<a href="${pageContext.request.contextPath}/member/member_question_list">
				<button type="button" class="btn btn-info float-left" id="back"> 뒤로 가기  </button> 
			</a>
		<!-- 문의 삭제 버튼 : 내 게시글에서만 보임 -->
			<c:if test="${login_info.member_id == detail_dto.member_id}"> <!-- 내 게시글만 삭제 -->
				<button type="button" class="btn btn-danger" id="delete_btn"> 삭제 </button>
			</c:if>
		</div>
		<br>
		<br>
		
		<!-- 관리자 답변 출력 (답변 완료일 때만) -->
		<c:if test="${detail_dto.md_question_answer == '답변완료'}"> 
		
			<br>
			<h5><b> ▶ 답변 내역</b></h5>
			<br>
			<div style = "background-color: whitesmoke;"> 
			<table class="table table-hover" id="table2">
			<col class="w-25">
				<tbody>
					<tr>
						<th>답변일자</th>
						<td>${reply_dto.md_answer_date}</td>
						<th>답변자</th> 
						<td>${reply_dto.md_answer_member}</td>
					</tr>
					<tr>
						<th> 답변 내용 </th>
						<td colspan="3">${reply_dto.md_answer_content}</td>
					</tr>
				</tbody>
			</table>
			</div>
		</c:if>
		<br>
		<br>
	</div>
 					  
				</section>
				<!-- section 끝---------------------------------------------------------------------------- -->
			</main>
			
		</div><!-- container -->
	</body>
	
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#delete_btn").click(function() {
			
			//삭제 버튼 get 전송
			$.get(
					"${pageContext.request.contextPath}/mdquestion/delete"
					, {
						md_question_id : ${md_question_id}
					}
					, function(data, status) {
						if( data >= 1 ){
							alert("문의가 삭제 되었습니다.");
							location.href="${pageContext.request.contextPath}/member/member_question_list";
						} else if( data <= 0 ) {
							alert("문의 삭제를 실패하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get
		});//click
	});//ready
	
		
	</script>
</html>