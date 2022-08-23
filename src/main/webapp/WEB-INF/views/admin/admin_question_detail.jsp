<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	
		<title>상부상酒  |  관리자 페이지 </title>
		
		<!-- CDN -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

		<!-- CSS 파일 -->
		
		
		
		
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

#disable_btn {
	margin-right : 30px;
}
#insert {
	margin-right : 30px;
}
.write_label {
	font-size : 0.7em;
	color : red;
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
				<jsp:include page="/WEB-INF/views/admin/admin_nav.jsp"></jsp:include>
				<br>
				<br>			
			</nav>
			
			<!-- nav 끝 -->
			<main class="clearfix mt-1" style="height:500px">
				<!--  aside 시작 -->	
				<aside class="col-2 h-100 bg-white float-left">
					
					
				<jsp:include page="/WEB-INF/views/admin/admin_aside.jsp"></jsp:include>
				<br>
				<br>			
				
				
				
				</aside>
				
			<!--  aside 끝 -->	
				
				
				<!-- section 시작--------------------------------------------------------------------------------- -->
				<section class="col-10 h-100 bg-white float-left">
					<h3> 상 품 문 의 관 리</h3>
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
					<th> 문의 유형 </th>
					<td colspan="3">${detail_dto.md_question_type}</td>
				</tr>
				<tr>
					<th> 문의 제목 </th>
					<td colspan="3">${detail_dto.md_question_title}</td>
				</tr>
				<tr>
					<th> 문의 내용 </th>
					<td colspan="3">${detail_dto.md_question_content}</td>
				</tr>
			</tbody>
		</table>
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
		
		<!-- 문의 목록가기 버튼 -->
		<div class="text-center">
			<a href="${pageContext.request.contextPath}/admin/admin_question_list">
				<button type="button" class="btn btn-info float-left" id="back"> 뒤로 가기  </button> 
			</a>
		</div>
		<br>
		<br>
		
		
		<!-- 답변 작성 폼 -->
		<c:if test="${detail_dto.md_question_answer == '답변대기'}"> 
		<form id="reply_form">
			<br>
			<h5><b>관리자 답변</b></h5>
			<hr><br>
			<!-- 질문자 닉네임, 제목, 내용, 이메일, 아이디 넘기기 -->
			<input id="member_nick" name="member_nick" type="hidden" 
					value="${detail_dto.member_nick}">

			<input id="md_question_title" name="md_question_title" type="hidden" 
					value="${detail_dto.md_question_title}">
			
			<input id="member_email" name="member_email" type="hidden" 
					value="${detail_dto.member_email}">
					
			<input id="md_question_content" name="md_question_content" type="hidden" 
					value="${detail_dto.md_question_content}">

			<input id="md_question_id" name="md_question_id" type="hidden" 
					value="${detail_dto.md_question_id}">
			작성자 <br>
				<input id="md_answer_member" name="md_answer_member" type="text" readonly="readonly"
					value="관리자" cols="100" style="width:500px;">
				<br><br>
				
				내용 작성<br>
				<textarea id="md_answer_content" name="md_answer_content" 
					placeholder="답변 내용을 입력하세요." rows="8" cols="100" style="resize:none;"></textarea><br>
				<label for="md_answer_content" id="md_answer_content_label" class="write_label"></label><br>
		</form>
		
		<button id="reply_btn" class="btn btn-warning float-right"> 답변 완료 </button>
		</c:if>
		<br><br><br><br><br>
		</div>
		
	</div>
		  	  
			</section>
			<!-- section 끝---------------------------------------------------------------------------- -->
		</main>
			
		</div><!-- container -->
	</body>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#reply_btn").click(function() {
			
			//내용 작성 유효성 검사 
			if( $.trim( $("#md_answer_content").val() ) == "" ){
				$("#md_answer_content_label").text("내용을 입력하세요.");
				return;
			} else { $("#md_answer_content_label").text(""); }
			
			let form = new FormData( document.getElementById( "reply_form" ) );
			
			//문의 작성 내용 ajax 전송
			$.ajax({
				type : "POST"
				, encType : "form-data"
				, url : "${pageContext.request.contextPath}/admin/questionReply"
				, data : form
				, processData : false
				, contentType : false
				, cache : false
				, success : function(result) {
					alert("답변이 등록되었습니다.");
					location.href = "${pageContext.request.contextPath}/admin/question_detail?md_question_id=${detail_dto.md_question_id}";
				}//call back function
				, error : function(xhr) {
					alert("잠시 후 다시 시도해 주세요.");
				}//call back function//xhr : xml http request/response
			});//ajax
		});//click
	});//ready
			
	</script>
	
</html>