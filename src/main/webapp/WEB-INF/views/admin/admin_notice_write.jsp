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
	margin-right : 30px;
}
#insert {
	margin-right : 30px;
}

/* 경로 라벨 컬러 */
.write_label {
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
		<hr>
	<h3 class="text-center">공 지 사 항 작 성</h3>
	<form id="write_form">
		<table class="table table-boardered">
			<tbody>
				<tr>
					<th> 제목 </th>
					<td>
						<input type="text" id="notice_title" name="notice_title" maxlength="40"
								class="form-control">
						<label for="notice_title" id="notice_title_label" class="write_label"></label>
					</td>
				</tr>
				
					<!-- member_id 정보 넘기기 -->
					<input id="member_id" name="member_id" type="hidden" 
							value="${login_info.member_id}" cols="100" style="width:200px;">
				<tr>
					<th>내용</th>
					<td>
						<textarea id="notice_content" name="notice_content" class="form-control"></textarea>
						<script type="text/javascript">
						CKEDITOR.replace('notice_content');
						</script>	
						<label for="notice_content" id="notice_content_label" class="write_label"></label>
					</td>
				</tr>
			</tbody>
		</table>
	</form>	
			<div>
				<button id="write_btn" class="btn btn-info float-right">등록하기</button>
				<button class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/admin/admin_notice_list'">돌아가기</button>
			</div>
					  	
					  	
					  
					  
					  
				</section>
				<!-- section 끝---------------------------------------------------------------------------- -->
			</main>
			
			
		</div><!-- container -->
	</body>
	<script type="text/javascript">
		
	/* 등록하기 버튼 */
	$(document).ready(function() {
		$("#write_btn").click(function() {
			
			//내용 작성 유효성 검사 
			if( $.trim( $("#notice_title").val() ) == "" ){
				$("#notice_title_label").text("제목을 입력하세요.");
				return;
			} else { $("#notice_title_label").text(""); }
			
			if( CKEDITOR.instances.notice_content.getData() == "" ){
				$("#notice_content_label").text("내용을 입력하세요.");
				return;
			} else { $("#notice_content_label").text(""); }
			
			$.post(
					"${pageContext.request.contextPath}/admin/admin_notice_insert"
					, {
						notice_title : $("#notice_title").val()
						,member_id : $("#member_id").val()
						, notice_content : CKEDITOR.instances.notice_content.getData()
					}
					, function(data, status) {
						if(data >= 1){
							alert("공지 사항이 성공적으로 업로드 되었습니다.");
							location.href="${pageContext.request.contextPath}/admin/admin_notice_list";
						} else if(data <= 0){
							alert("공지 사항 작성을 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post
		});//click
	});//ready
	
		
	</script>
</html>