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


		#table1 img{ 
			height:450px; !important
		}
		#table2 img{ 
			height:500px; !important
		}
		#table1 {
			margin-top: 20px;
		}
		#table2 {
			margin-left: auto; 
  			margin-right: auto;
  			border-spacing: 2px;
  			text-align: center;
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
					<h3> 상 품 관 리</h3>
					  <!-- <hr style="width:100%;height:2px;border:none;background-color:black;"> -->
					  	
					  	
					  	
					  	
					
					
					
					<div class="container">
		
		<!-- 상품 정보 + 구매 버튼 -->		
		<table class="table" id="table1">
			<col class="w-25">
			<tbody>
				<tr>
					<td rowspan="5"><img src="${detail_dto.md_thumbnail_path}"></td>
					<td colspan="2"> 
						<p style="font-size:27px;"> 
						<b>${detail_dto.md_name}</b>
						</p>  
					</td>
					
					
					<!-- 찜 버튼 -->
					<td colspan="2">
						<button type="button" id="wish_btn" class="btn btn-danger btn-sm"> 
						♡
						</button>
					</td>
				</tr>
					<tr>
					<td>
						<h6>${detail_dto.md_oneline}</h6>
					</td>
					</tr>				
				<tr>
					<th> 판 매 가 </th>
					<td colspan="3">
						<fmt:formatNumber type="number" var="price" value="${detail_dto.md_price}" />
						<del>${price} 원</del>
						<fmt:formatNumber type="number" var="saleprice" value="${detail_dto.sale_price}" />
						<h3>${saleprice} 원</h3>
					</td>
				</tr>
					<th> 도 수 </th>
					<td> <b> <span> ${detail_dto.md_abv}</span> % </b></td>
				</tr>
			</tbody>
		</table>
		
		<!-- 상품 상세 설명 -->
		<br>
		<div style="text-align:center">
			<h6 style="color:dimgray;"><b>상품 상세 설명</b></h6> <br><br>
		</div>
		<table id="table2">
			<tbody>
				<tr>
					<th> </th>
					<td colspan="2"><img src="${detail_dto.md_detail_path}"></td>
				</tr>
				<tr>
					<th> </th>
					<td colspan="2"><br><br>${detail_dto.md_content}</td>
				</tr>
			</tbody>
		</table>
		<hr>
		<div class="clearfix">
			
			<a href="${pageContext.request.contextPath}/admin/admin_md_list"><!-- 컨트롤러의 RequestMapping 호출 -->
				<button class="btn btn-info"> 목 록 으 로 </button>
			</a>
			<a href="${pageContext.request.contextPath}/admin/update_form?md_id=${md_id}"><!-- 컨트롤러의 RequestMapping 호출 -->
				<button class="btn btn-warning float-right"> 수 정 하 기 </button>
			</a>
		</div>
		<br>
		
	</div>
					
					
					
					
					
					
					
					  	
					  	
					  	
					  	
					  	
					  
					  
					  
				</section>
				<!-- section 끝---------------------------------------------------------------------------- -->
			</main>
			
			
		</div><!-- container -->
	</body>
	<script type="text/javascript">
		$(function () {
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function() {
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});//click
			
			$("input[name='RowCheck']").click(function() {
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allcheck']")[0].checked = true;
				}
				else{
					
					$("input[name='allCheck']")[0].checked = false;
				}
			});//click
		});//function
		
		function deleteValue(){
			var url = "${pageContext.request.contextPath}/admin/delete"; // Controller로 보내고자하는 URL
			var valueArr = new Array();
			var list = $("input[name='RowCheck']");
			
			for(var i = 0; i < list.length; i++){
				if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
					valueArr.push(list[i].value);
				}
			}
		
			if (valueArr.length == 0){
				alert("선택된 상품이 없습니다.");
			}
			else{
				var chk = confirm("정말 삭제하시겠습니까?");
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/delete"//전송 URL
					, type : 'POST' //POST 방식
					, traditional : true
					, data : {
						valueArr : valueArr //보내고자 하는 data 변수 설정
					},
					success : function(jdata){
						if(jdata = 1) {
							alert("삭제 성공");
							location.href = "${pageContext.request.contextPath}/admin/admin_md_list";
						}
						else {
							alert("삭제 실패");
						}
					}
				});
				
			}//else
			
		}//deleteValue
		
		
		
		
		
		
		
	</script>
</html>