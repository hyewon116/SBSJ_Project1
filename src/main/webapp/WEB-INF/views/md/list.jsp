<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 상품 목록 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		
		.product-item img{ 
			height:300px; !important
		}
		.product-item:hover { 
			cursor: pointer; !important
		}
		img {
			top: 6px;
			left: 7px;
			border-radius: 10px; 
			margin-bottom : 10px;
		}
		h5 {
			font-family : sans_serif;
			font-weight : bold;
			font-size : 18px;
		}
		h6 {
			font-size : 13px;	
		}
		</style>
	
	</head>
	<body>
	<div class="container">
		<hr>
		<h3> 상품 목록 </h3>
		<hr>
		<div class="col-md-12" id="responsive">
            <div class="filters-content">
                <div class="row" id="list-page">
                <div class="forEach d-flex">
                	<c:forEach var="md" items="${list}">
	                    <div class="col-lg-4 col-md-4 all des">
	                      <div class="product-item">
	                        <div class="img-box"><a href="${pageContext.request.contextPath}/md/detail?md_id=${md.md_id}">
	                        <img src="${md.md_thumbnail_path}" alt=""></a></div>
	                        <div class="down-content">
	                          <input type=hidden id="md_id" value="${md.md_id}">
	                          <a href="${pageContext.request.contextPath}/md/detail?md_id=${md.md_id}">
	                          <h5>${md.md_name}</h5></a>
	                          <a><h6>${md.md_oneline}</h6></a>
	                          <h6><del><fmt:formatNumber value="${md.md_price}" pattern="#,###" />원</del></h6>
	                          <h6><fmt:formatNumber value="${md.sale_price}" pattern="#,###" />원</h6>
	                        </div>
	                      </div>
	                    </div>
                   	</c:forEach>
                </div>
                </div>
            </div>
          </div>
      <hr>
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/md/list?userWantPage=${startPageNum-1}">
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
								href="${pageContext.request.contextPath}/md/list?userWantPage=${page_no}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/md/list?userWantPage=${endPageNum+1}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
	<hr>
	</div>
	</body>
</html>














