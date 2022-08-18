<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 등록</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
		<style type="text/css">
		.write_label {
			font-size : 0.7em;
			color : red;
		}
		</style>
	</head>
	<body>
		<div class="container">
		<hr>
		<h3> 관리자 상품 등록 </h3>
		<hr>
		<form id="write_form">
			<table class="table table-hover">
				<tbody>
					<tr>
						<th> 상품 분류 </th>
						<td colspan="3">
						<select id="md_category" name="md_category">
							<option value="kind" selected disabled hidden>주종</option>
							<option value="탁주">탁주</option>
							<option value="약·청주">약·청주</option>
							<option value="과실주">과실주</option>
							<option value="과실주">과실주</option>
							<option value="선물세트">선물세트</option>
						</select>
					</tr>
					<tr>
						<th> 상품명 </th>
						<td colspan="3">
							<input type="text" id="md_name" name="md_name" maxlength="20"
									class="form-control">
							<label for="md_name" id="md_name_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 한 줄 설명 </th>
						<td colspan="3">
							<input type="text" id="md_oneline" name="md_oneline" maxlength="20"
									class="form-control">
							<label for="md_oneline" id="md_oneline_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 상품 단가 </th>
						<td>
							<input type="text" id="md_price" name="md_price" maxlength="20"
									class="form-control">
							<label for="md_price" id="md_price_label" class="write_label"></label>
						</td>
						<th> 기준 재고 </th>
						<td>
							<input type="text" id="md_standard_stock" name="md_standard_stock" maxlength="20"
									class="form-control">
							<label for="md_standard_stock" id="md_standard_stock_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 상품 도수 </th>
						<td>
							<input type="text" id="md_abv" name="md_abv" maxlength="20"
									class="form-control">
							<label for="md_abv" id="md_abv_label" class="write_label"></label>
						</td>
						<th> 할인율 </th>
						<td>
							<input type="text" id="md_discount" name="md_discount" maxlength="20"
									class="form-control">
							<label for="md_discount" id="md_discount_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 단맛 </th>
						<td>
							<select id="md_sweet" name="md_sweet">
								<option value="약한">약한</option>
								<option value="중간">중간</option>
								<option value="강한">강한</option>
							</select>
						</td>
						<th> 신맛 </th>
						<td>
							<select id="md_sour" name="md_sour">
								<option value="약한">약한</option>
								<option value="중간">중간</option>
								<option value="강한">강한</option>
							</select>
						</td>
					</tr>
					<tr>
						<th> 탄산 </th>
						<td>
							<select id="md_sparkling" name="md_sparkling">
								<option value="약한">약한</option>
								<option value="중간">중간</option>
								<option value="강한">강한</option>
							</select>
						</td>
						<th> 상황별 </th>
						<td>
							<select id="md_use" name="md_use">
								<option value="웃어른">웃어른</option>
								<option value="연인">연인</option>
								<option value="친구">친구</option>
								<option value="혼자">혼자</option>
								<option value="비지니스">비지니스</option>
							</select>
						</td>
					</tr>
					<tr>
						<th> 썸네일 이미지 </th>
						<td>
							<input type="file" id="md_thumbnail" name="md_thumbnail" class="form-control">
							<label for="md_thumbnail" id="md_thumbnail_label" class="write_label"></label>
						</td>
						<th> 상품 상세이미지 </th>
						<td>
							<input type="file" id="md_detail_image" name="md_detail_image" class="form-control">
							<label for="md_detail_image" id="md_detail_image_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 상품 정보 </th>
						<td colspan="3">
							<textarea class="form-contol" id="content" name="content"></textarea>
							<script type="text/javascript">
							CKEDITOR.replace("content");
							</script>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<button id="write_btn" class="btn btn-primary float-right"> 저장하기 </button>
		<a href="${pageContext.request.contextPath}/md/list">
			<button class="btn btn-warning"> 취소 </button>
		</a>
		<hr>
	<script type="text/javascript">
		let onlyNum = /^[0-9]+$/;
	
		$(document).ready(function() {
			$("#write_btn").click(function() {
	
				if( $.trim( $("#md_name").val() ) == "" ){
					$("#md_name_label").text("상품명을 입력 하세요.");
					return;
				} else { $("md_name_label").text(""); }
	
				if( $("#md_standard_stock").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
					$("#md_standard_stock_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
					return;
				} else { $("#md_standard_stock_label").text(""); }
	
				if( $("#md_price").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
					$("#md_price_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
					return;
				} else { $("#md_price_label").text(""); }
	
				if( $("#md_discount").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
					$("#md_discount_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
					return;
				} else { $("#md_discount_label").text(""); }
	
				let tmp1 = $("#md_thumbnail").val().substring($("#md_thumbnail").val().length-3);
				let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
									|| tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
				if( $.trim( $("#md_thumbnail").val() ) == "" || tmp1_boolean == false ){
					$("#md_thumbnail_label").text("필수 입력 사항이며, jpg/jpeg/gif/png 파일만 허용 됩니다.");
					return;
				} else { $("#md_thumbnail_label").text(""); }
	
				let tmp2 = $("#md_detail_image").val().substring($("#md_detail_image").val().length-3);
				let tmp2_boolean = (tmp2 == "jpg" || tmp2 == "jpeg" || tmp2 == "gif" || tmp2 == "png"
					|| tmp2 == "JPG" || tmp2 == "JPEG" || tmp2 == "GIF" || tmp2 == "PNG");
				if( $.trim( $("#md_detail_image").val() ) != "" && tmp2_boolean == false ){
					$("#md_detail_image_label").text("상품이미지는 jpg/jpeg/gif/png 파일만 허용 됩니다.");
					return;
				} else { $("#md_detail_image_label").text(""); }

				let form = new FormData( document.getElementById( "write_form" ) );
				form.append( "md_content", CKEDITOR.instances.content.getData() );
// 				form.append( "md_category", $('#md_category option:selected').val());
// 				form.append( "md_sweet", $('#md_sweet option:selected').val());
// 				form.append( "md_sour", $('#md_sour option:selected').val());
// 				form.append( "md_use", $('#md_use option:selected').val());

				$.ajax({
						type : "POST"
						, encType : "multipart/form-data"
						, url : "${pageContext.request.contextPath}/md/insert"
						, data : form
						, processData : false
						, contentType : false
						, cache : false
						, success : function(result) {
							alert("상품이 등록 되었습니다.");
							location.href = "${pageContext.request.contextPath}/md/list";
						}//call back function
						, error : function(xhr) {
							alert("잠시 후 다시 시도해 주세요.");
						}//call back function//xhr : xml http request/response
				});//ajax
			});//click
		});//ready
	</script>
	</div>
	</body>
</html>