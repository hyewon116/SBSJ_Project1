<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 후기 상세 보기 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
		<div class="container">
		
		<!-- 후기 디테일 -->
		<table class="table table-hover" id="table1">
			<col class="w-25">
			<tbody>
				<tr>
					<th>작성일자</th>
					<td>${detail_dto.review_date}</td>
					<th>작성자</th> 
					<td>${detail_dto.member_nick}</td>
				</tr>
				<tr>
					<th> 후기 제목 </th>
					<td colspan="3">${detail_dto.review_title}</td>
				</tr>
				<tr>
					<th> 내용 </th>
					<td colspan="3">${detail_dto.review_content}</td>
				</tr>
			</tbody>
		</table>
		
		<!-- 후기 목록가기 버튼 : 누구나 보임 -->
		<div class="text-center">
			<a href="${pageContext.request.contextPath}/mdreview/review_list?md_id=${detail_dto.md_id}">
				<button type="button" class="btn btn-info float-left" id="list"> 후기 목록 </button> 
			</a>
		<!-- 후기 수정&삭제 버튼 : 내 게시글에서만 보임 -->
			<c:if test="${login_info.member_id == detail_dto.member_id}"> <!-- 내 게시글만 수정&삭제 -->
				<a href="${pageContext.request.contextPath}/mdreview/uform?review_id=${review_id}">
					<button type="button" class="btn btn-warning" id="update"> 수정 </button> 
				</a>
				<button type="button" class="btn btn-danger" id="delete_btn"> 삭제 </button>
			</c:if>
		</div>
		<br>
		<br>
	</div>
	</body>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#delete_btn").click(function() {
			
			//삭제 버튼 get 전송
			$.get(
					"${pageContext.request.contextPath}/mdreview/delete"
					, {
						review_id : ${review_id}
					}
					, function(data, status) {
						if( data >= 1 ){
							alert("후기가 삭제 되었습니다.");
							location.href="${pageContext.request.contextPath}/mdreview/review_list?md_id=${detail_dto.md_id}";
						} else if( data <= 0 ) {
							alert("후기 삭제를 실패하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get
		});//click
	});//ready
	
	</script>
	
</html>



