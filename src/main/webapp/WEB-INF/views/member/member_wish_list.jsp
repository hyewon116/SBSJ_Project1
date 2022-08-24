<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상부상酒  |  찜 목록</title>
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
				
		<!-- section 시작---------------------------------------------------------------------------->
		<section class="col-9 h-100 bg-white float-left">
		<hr>
		<h3> 찜 목록 </h3>
		<hr>
					  	
		<table id="wish_table" class="text-center text-capitalize table table-hover">
			<thead>
 				<tr>
					<th><input id="allCheck" type="checkbox" name="allCheck"></th> 
					<th> image </th> <th> 상품명 </th> <th> 가격 </th>	
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td class="col-1">
							<input name="RowCheck" type="checkbox" value="${dto.wish_id}">
						</td>
						<td class="col-1">
							<a href="${pageContext.request.contextPath}/md/detail?md_id=${dto.md_id}">
							<img src="${dto.md_thumbnail_path}" class="img-thumbnail">
							</a>
						</td>
						<td class="col-2">
							<a href="${pageContext.request.contextPath}/md/detail?md_id=${dto.md_id}">
							${dto.wish_item}
							</a>
						</td>
						<td class="col-2">
							${dto.wish_price} 원
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		
		<!-- 삭제&장바구니 버튼 -->
		<div class="clearfix">
				<button id="delete_btn" class="btn btn-danger float-left" onclick="deleteValue();"> 상품 삭제 </button>
				<button id="jang_btn" class="btn btn-primary float-left" onclick="cartValue();"> 장바구니 담기 </button>
		</div>
		<hr>
		
		<!-- 페이징 부분 -->
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/member/member_wish_list?userWantPage=${startPageNum-1}">
						Previous
					</a>
				</li>
			</c:if>
			<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
				<c:choose>
					<c:when test="${page_no == userWantPage}">
						<li class="page-item active mx-auto">
							<a class="page-link">${page_no}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item mx-auto">
							<a class="page-link"
								href="${pageContext.request.contextPath}/member/member_wish_list?userWantPage=${page_no}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/member/member_wish_list?userWantPage=${endPageNum+1}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
							  
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
					if(chk == true) {
						
						$.ajax({
							url : "${pageContext.request.contextPath}/member/wish_delete"//전송 URL
							, type : 'POST' //POST 방식
							, traditional : true
							, data : {
								valueArr : valueArr //보내고자 하는 data 변수 설정
							},
							success : function(jdata){
								if(jdata = 1) {
									alert("삭제 성공");
									location.href = "${pageContext.request.contextPath}/member/member_wish_list";
								}
								else {
									alert("삭제 실패");
								}
							}
						});
					
					} else {
						alert("삭제를 취소하셨습니다.")
					}
				
			}//else
		}//deleteValue
	</script>
	
	
	<script type="text/javascript">
   	//장바구니 담기 
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
		
		function cartValue(){
			var url = "${pageContext.request.contextPath}/cart/wish_insert"; // Controller로 보내고자하는 URL
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
    	  	
				$.ajax({
					url : "${pageContext.request.contextPath}/cart/wish_insert"//전송 URL
					, type : 'POST' //POST 방식
					, traditional : true
					, data : {
						valueArr : valueArr //보내고자 하는 data 변수 설정
					},
					success : function(jdata){
						if(jdata = 1) {
							let tmp_bool = confirm("장바구니에 추가 하였습니다.\n장바구니로 이동 하시겠습니까?");
		                    if( tmp_bool == true ) location.href="${pageContext.request.contextPath}/cart/list";
						}
						else {
							alert("장바구니 담기 실패");
						}
					}
				});
			
		}//else
	}//deleteValue
   </script>
	
</html>