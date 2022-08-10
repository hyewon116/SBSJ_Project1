<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 후기</title>
		</head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<body>
		<div class="container">
			<h3>상품 후기</h3>
			<br>
			
			<div>
				
			<input type="hidden" id="md_id" value="${md_id}">	
			<!-- login_info 정보 추가 -->
			
			글 제목 
			<br>
			<input id="review_title" type="text" placeholder="제목을 입력하세요." cols="100" style="width:500px;">
			<br><br>
			내용 작성
			<br>
			<textarea id="review_content" placeholder="내용을 입력하세요." rows="8" cols="100" style="resize:none;">
			</textarea>
			</div>
			
			<br>
			<input type="radio" id="rdo1" name="star" value="1"> 1점
			<input type="radio" id="rdo2" name="star" value="2"> 2점
			<input type="radio" id="rdo3" name="star" value="3"> 3점
			<input type="radio" id="rdo4" name="star" value="4"> 4점
			<input type="radio" id="rdo5" name="star" value="5"> 5점
			<br>
			<br>
			
			<button class="btn btn-primary float-right"> 작성 완료 </button>
		</div>
	</body>
</html>