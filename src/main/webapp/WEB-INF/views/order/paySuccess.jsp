<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
<body>
<br><br>
<div class="container h-100">
	<div class="row d-flex justify-content-center align-items-center h-100">
		<div class="col-3"></div>
	        <div class="col-6 text-center">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">결제완료</h5>
						<p class="card-text">
							요청하신 주문이 완료되었습니다
						</p>
						<a href="${pageContext.request.contextPath}/history/my_order_list" class="btn btn-success">주문내역</a>
						<a href="${pageContext.request.contextPath}/" class="btn btn-primary">홈으로</a>
					</div>
				</div>
	        </div>
		<div class="col-3"></div>       
	</div>
</div>

</body>
</html>