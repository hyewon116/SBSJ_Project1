<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>상부상酒 | 관리자 페이지</title>

<!-- CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="//cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>	

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
	margin-right: 30px;
}

#insert {
	margin-right: 30px;
}


write_label {
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
			<br> <br>
		</nav>

		<!-- nav 끝 -->
		<main class="clearfix mt-1" style="height: 500px">
			<!--  aside 시작 -->
			<aside class="col-2 h-100 bg-white float-left">


				<jsp:include page="/WEB-INF/views/admin/admin_aside.jsp"></jsp:include>
				<br> <br>



			</aside>

			<!--  aside 끝 -->


			<!-- section 시작--------------------------------------------------------------------------------- -->
			<section class="col-10 h-100 bg-white float-left">
				<hr>
				<h3> 1:1 문의 수정 </h3>
				<hr>
				
				<form id="write_form">
				<input type="hidden" id="qa_question_id" name="qa_question_id" value="${detail_dto.qa_question_id}">	
				<input type="hidden" id="member_id" name="member_id" value="${detail_dto.member_id}">
					<table class="table table-boardered">
						<tr>
							<th>문의 유형</th>
							<td>
								<select id="qa_question_category" name="qa_question_category">
									<option value="상품" <c:if test="${detail_dto.qa_question_category eq '상품'}">selected</c:if>>상품</option>
									<option value="배송" <c:if test="${detail_dto.qa_question_category eq '배송'}">selected</c:if>>배송</option>
									<option value="교환/반품" <c:if test="${detail_dto.qa_question_category eq '교환/반품'}">selected</c:if>>교환/반품</option>
									<option value="이벤트/쿠폰" <c:if test="${detail_dto.qa_question_category eq '이벤트/쿠폰'}">selected</c:if>>이벤트/쿠폰</option>
									<option value="기타" <c:if test="${detail_dto.qa_question_category eq '기타'}">selected</c:if>>기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" id="qa_question_title" name="qa_question_title" maxlength="20"
										class="form-control" value="${detail_dto.qa_question_title}">
								<label for="qa_question_title" id="qa_question_title_label" class="write_label"></label>
							</td>
						</tr>
						
						<tr>
							<th> 작성자 </th>
							<td><input id="member_nick" name="member_nick" type="text" readonly="readonly"
										value="${detail_dto.member_nick}" cols="100" style="width:200px;"></td>
							
							<!-- member_id 정보 넘기기 -->
							<td><input id="member_id" name="member_id" type="hidden" 
								value="${detail_dto.member_id}" cols="100" style="width:500px;"></td>
						</tr>
						<tr>
							<th>공개 여부&nbsp;</th>
							<td>
							<input class="form-check-input" type="checkbox" name="open_yn" id="open_yn" <c:if test="${detail_dto.open_yn eq 'true'}">checked</c:if>>
    						<label class="form-check-label">비밀글 설정</label>
    						</td>
						</tr>
						<tr>
							<th>내용 </th>
							<td>
								<div class="text-center">
			                    	※ 작성 전 유의 사항 ※<br><br>
			                    
			                   	 	반품/환불<br>
			                  		  - 제품 하자 혹은 이상으로 반품 및 환불이 필요한 경우 구체적인 내용을 남겨주세요. <br><br>
			
			                   		 배송<br>
			                   		 - 배송 및 배송시간 지정은 불가능합니다.<br>
			                    
			               		</div>
								<textarea class="form-contol" id="qa_question_content" name="qa_question_content">${detail_dto.qa_question_content}</textarea>
								<script type="text/javascript">
								CKEDITOR.replace("qa_question_content");
								</script>
								<label for="qa_question_content" id="qa_question_content_label" class="write_label"></label>
							</td>
						</tr>
					</table>
			</form>
			<!-- 수정 완료, 수정 취소 버튼 -->
			<div>
				<button id="write_btn" class="btn btn-info float-right"> 수정 완료 </button>
				<a href="${pageContext.request.contextPath}/admin//admin_qna_detail?qa_question_id=${detail_dto.qa_question_id}">
					<button class="btn btn-warning"> 돌아가기 </button>
				</a>
			</div>
				
				

			</section>
			<!-- section 끝---------------------------------------------------------------------------- -->
		</main>


	</div>
	<!-- container -->
</body>
<script type="text/javascript">
$(document).ready(function() {
	$("#write_btn").click(function() {
		let open_yn = null;

		if( $.trim( $("#qa_question_title").val() ) == "" ){
			$("#qa_question_title_label").text("제목을 입력 하세요.");
			return;
		} else { $("#qa_question_title_label").text(""); }

		if( CKEDITOR.instances.qa_question_content.getData() == "" ){
			$("#qa_question_content_label").text("내용을 입력 하세요.");
			return;
		} else { $("#qa_question_content_label").text(""); }

	let form = new FormData(document.getElementById("write_form"));
	form.append( "qa_question_content", CKEDITOR.instances.qa_question_content.getData() );
	
	$.post(
			"${pageContext.request.contextPath}/admin/admin_qna_update"
			, {
				qa_question_id : $("#qa_question_id").val()
				,qa_question_title : $("#qa_question_title").val()
				,qa_question_category : $("#qa_question_category").val()
				,member_id : $("#member_id").val()
				,member_nick : $("#member_nick").val()
				,open_yn: $("#open_yn").prop("checked")
				, qa_question_content : CKEDITOR.instances.qa_question_content.getData()
			}
			, function(data, status) {
				if(data >= 1){
					alert("문의글 수정이 완료 되었습니다.");
					location.href="${pageContext.request.contextPath}/admin/admin_qna_list?qa_question_id=${detail_dto.qa_question_id}";
				} else if(data <= 0){
					alert("문의글 수정 실패 하였습니다.");
				} else {
					alert("잠시 후 다시 시도해 주세요.");
				}
			}//call back function
	);//post
	
	});//click
});//ready
</script>
<%@ include file="/WEB-INF/views/footerMain.jsp" %>
</html>