<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 
<%-- <link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/mainFooter.css"> --%>
<style>
* {
    margin: 0;
    padding: 0;
}

a {
    color: #333;
    text-decoration: none;
}

footer {
    color: #999;
    border-top: 2px solid #c7c7c7;
    background: #ffffff;
    margin-top:100px;
    
}
footer a {
    color: #999;
}

/* .info { */
/*     padding-left: 480px; */
/*     justify-content: flex-start;	 */
	
/* } */

.footer-inner {
    display: flex;
    justify-content: space-between;
    width: 1200px;
    font-size: 12px;
    margin: 0 auto;
    padding: 10px 0;
    box-sizing: border-box;
}
.footer-about {
    display: flex;
    justify-content: space-between;
    border-bottom: 1px solid #ddd;
}


.footer-copy .footer-inner {
    padding-left: 2px;
    justify-content: flex-start;
    font-size:15px;
}
.footer-copy .terms a {
    display: inline-block;
}
.footer-copy .terms a + a {
    margin-left: 10px;
    margin-top:20px;
}
.footer-copy .copy {
    margin-left: 400px;
    margin-top:20px;
}
.footer-copy .copy strong {
	font-weight: 500;
}



</style>


        <footer>
<!--             <div class="footer-about"> -->
<!--                 <div class="footer-inner"> -->
<!--    	                  	<div class="info"> -->
<!-- 	                        <ul style="font-size:15px;"> -->
<!-- 	                            <li>주식회사 상부상酒</li> -->
<!-- 	                            <li>(04108) 서울특별시 마포구 백범로 23</li> -->
<!-- 	                            <li><strong>통신판매업신고번호</strong> 2022-서울마포-0826</li> -->
<!-- 	                            <li><strong>이메일 </strong><a href="mailto:sbsj@sbsj.co.kr">sbsj@sbsj.co.kr</a></li> -->
<!-- 	                            <li><strong>개인정보보호책임자</strong> (주)상부상酒</li> -->
<!-- 	                        </ul> -->
<!-- 	                    </div> -->
<!--                 </div> -->
<!--             </div> // footer-about -->

            <div class="footer-copy">
                <div class="footer-inner">
                    <div class="terms">
<!--                         <a href="javascript:void(0);">이용약관</a> -->
<!--                         <a href="javascript:void(0);">개인정보처리방침</a> -->
                    </div>
                    <p class="copy">Copyright ©  <strong>상부상酒 Co.</strong> All rights reserved.</p>
                </div>
            </div>
        </footer>
    </div>
</body>

</html>