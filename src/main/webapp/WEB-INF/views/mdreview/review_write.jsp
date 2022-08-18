<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 후기</title>
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
			<h3>상품 후기</h3>
			<hr><br>
			
		<!-- 후기 작성 폼 시작 -->
			<form id="write_form">
				<input type="hidden" id="md_id" name="md_id" value="${md_id}">	
			
				글 제목 <br>
				<input id="review_title" name="review_title" type="text" 
					placeholder="제목을 입력하세요." cols="100" style="width:500px;">
				<br><label for="review_title" id="review_title_label" class="write_label"></label>
				<br>
				
				작성자<br>
				<input id="member_nick" name="member_nick" type="text" readonly="readonly"
					value="${login_info.member_nick}" cols="100" style="width:500px;">
				<br><br>
				
				<!-- member_id 정보 넘기기 -->
				<input id="member_id" name="member_id" type="hidden" 
					value="${login_info.member_id}" cols="100" style="width:500px;">
				
				내용 작성<br>
				<textarea id="review_content" name="review_content" 
					placeholder="내용을 입력하세요." rows="8" cols="100" style="resize:none;"></textarea><br>
				<label for="review_content" id="review_content_label" class="write_label"></label><br>
			
			<!-- 별점 선택란 -->
				<input type="radio" id="rdo1" name="review_star" value="1"> 1점
				<input type="radio" id="rdo2" name="review_star" value="2"> 2점
				<input type="radio" id="rdo3" name="review_star" value="3"> 3점
				<input type="radio" id="rdo4" name="review_star" value="4"> 4점
				<input type="radio" id="rdo5" name="review_star" value="5"> 5점
				<br>
				<label for="review_star" id="review_star_label" class="write_label"></label><br>
			</form>
		
			<!-- 작성 완료, 취소 버튼 -->
			<button id="write_btn" class="btn btn-primary float-right"> 작성 완료 </button>
			<a href="${pageContext.request.contextPath}/mdreview/review_list?md_id=${md_id}">
				<button class="btn btn-warning"> 작성 취소 </button>
			</a>
		</div>
	</body>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#write_btn").click(function() {
			
			//내용 작성 유효성 검사 
			if( $.trim( $("#review_title").val() ) == "" ){
				$("#review_title_label").text("제목을 입력하세요.");
				return;
			} else { $("#review_title_label").text(""); }
			
			if( $.trim( $("#review_content").val() ) == "" ){
				$("#review_content_label").text("내용을 입력하세요.");
				return;
			} else { $("#review_content_label").text(""); } 
			
			if( $("input[name=review_star]:radio:checked").length < 1) {
				$("#review_star_label").text("별점을 선택하세요.");
				return;
			} else { $("#review_star_label").text(""); } 
			
			let form = new FormData( document.getElementById( "write_form" ) );
			
			//후기 작성 내용 ajax 전송
			$.ajax({
				type : "POST"
				, encType : "form-data"
				, url : "${pageContext.request.contextPath}/mdreview/insert"
				, data : form
				, processData : false
				, contentType : false
				, cache : false
				, success : function(result) {
					alert("후기가 등록되었습니다.");
					location.href = "${pageContext.request.contextPath}/mdreview/review_list?md_id=${md_id}";
				}//call back function
				, error : function(xhr) {
					alert("잠시 후 다시 시도해 주세요.");
				}//call back function//xhr : xml http request/response
			});//ajax
		});//click
	});//ready
			
	</script>
</html>