<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 문의 수정</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		.write_label {
			font-size : 0.7em;
			color : red;
		}
		</style>
		</head>
	<body>

	<!-- body 시작 부분 -->
		<div class="container">
			<h3>상품 문의 수정 </h3>
			<hr><br>
			
			<!-- 수정 내용 작성 폼 시작 -->
			<form id="write_form">
			
				<input type="hidden" id="md_id" name="md_id" value="${detail_dto.md_id}">	
				<input type="hidden" id="md_question_id" name="md_question_id" value="${detail_dto.md_question_id}">

				문의 유형
				<select id="md_question_type" name="md_question_type">
					<option value="상품 문의">상품 문의</option>
					<option value="배송 문의">배송 문의</option>
					<option value="결제 문의">결제 문의</option>
					<option value="교환&반품 문의">교환&반품 문의</option>
				</select><br><br>

				글 제목 <br>
				<input id="md_question_title" name="md_question_title" type="text" cols="100" style="width:500px;"
						value="${detail_dto.md_question_title}"><br>
				<label for="md_question_title" id="md_question_title_label" class="write_label"></label>
				<br>
				
				작성자<br>
				<input id="member_nick" name="member_nick" type="text" readonly="readonly"
					value="${login_info.member_nick}" cols="100" style="width:500px;">
				<br><br>
				
				<!-- member_id 정보 넘기기 -->
				<input id="member_id" name="member_id" type="hidden" 
					value="${login_info.member_id}" cols="100" style="width:500px;">
				
				내용 작성<br>
				<textarea id="md_question_content" name="md_question_content" 
						rows="8" cols="100" style="resize:none;">${detail_dto.md_question_content}</textarea><br>
				<label for="md_question_content" id="md_question_content_label" class="write_label"></label><br>
					
			</form>
			
			<!-- 수정 완료, 수정 취소 버튼 -->
			<button id="write_btn" class="btn btn-primary float-right"> 수정 완료 </button>
			<a href="${pageContext.request.contextPath}/mdquestion/question_list?md_id=${detail_dto.md_id}">
				<button class="btn btn-warning"> 상품 수정 취소 </button>
			</a>
		</div>
	</body>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#write_btn").click(function() {
			
			//내용 작성 유효성 검사 
			 if( $.trim( $("#md_question_title").val() ) == "" ){
				$("#md_question_title_label").text("제목을 입력하세요.");
				return;
			} else { $("#md_question_title_label").text(""); }
			
			if( $.trim( $("#md_question_content").val() ) == "" ){
				$("#md_question_content_label").text("내용을 입력하세요.");
				return;
			} else { $("#md_question_content_label").text(""); } 
			
			let form = new FormData( document.getElementById( "write_form" ) );
			
			//수정 내용 ajax 전송
			$.ajax({
				type : "POST"
				, encType : "form-data"
				, url : "${pageContext.request.contextPath}/mdquestion/update"
				, data : form
				, processData : false
				, contentType : false
				, cache : false
				, success : function(result) {
					alert("문의가 수정되었습니다.");
					location.href = "${pageContext.request.contextPath}/mdquestion/question_list?md_id=${detail_dto.md_id}";
				}//call back function
				, error : function(xhr) {
					alert("잠시 후 다시 시도해 주세요.");
				}//call back function//xhr : xml http request/response
			});//ajax
		});//click
	});//ready
			
	</script> 
	
</html>