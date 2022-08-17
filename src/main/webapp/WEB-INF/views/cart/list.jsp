<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>

        <head>
            <meta charset="UTF-8">
            <title> 장바구니 </title>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
            <style type="text/css">
                #table1 {
                    width: 800px;
                    margin-left: 10px;
                    margin-right: 10px;
                }

                #qty {
                    position: relative;
                    display: inline-block;
                    border: 1px solid #dfe4ec;
                    border-radius: 3px;
                    height: 28px;
                    vertical-align: top;
                }

                .minus_btn {
                    position: relative;
                    width: 25px;
                    height: 100%;
                    border-radius: 3px;
                    background-color: #ffffff;
                    vertical-align: top;
                }

                .quantity_input {
                    display: inline-block;
                    width: 31px;
                    height: 100%;
                    border: none;
                    border-radius: 0;
                    text-align: center;
                    color: #111111;
                    background-color: #ffffff;
                    font-weight: bold;
                    vertical-align: top;
                }

                .plus_btn {
                    position: relative;
                    width: 25px;
                    height: 100%;
                    border-radius: 3px;
                    background-color: #ffffff;
                    vertical-align: top;
                }

                .qty_chg_btn {
                    margin-left: 30px;
                }

                #total-table {
                    position: relative;
                    width: 290px;
                    right: 0;
                }
            </style>
        </head>

        <body>
            <%@ include file="/WEB-INF/views/headerMain.jsp" %>
                <hr>
                <h3> 장바구니 </h3>
                <hr>
                <table class="table table-hover" id="table1" align="left">
                    <col class="col-1">
                    <thead>
                        <tr>
                            <th> <input type="checkbox" id="cbx_chkAll" checked="checked">선택 </input> </th>
                            <th></th>
                            <th id="md"> 상품</th>
                            <th id="count"> 수량 </th>
                            <th id="price"> 가격</th>
                        </tr>
                    </thead>
                    <td>
                        <c:set var="sum_md_class_qty" value="0" />
                        <c:set var="sum_buy_amt" value="0" />
                        <c:set var="sum_discount_amt" value="0" />
                        <c:set var="delivery_cost" value="0" />
                        <c:forEach var="dto" items="${list}" varStatus="status">
                            <c:set var="sum_md_class_qty" value="${sum_md_class_qty + 1}" />
                            <c:set var="sum_buy_amt" value="${sum_buy_amt + (dto.md_price * dto.buy_qty)}" />
                            <c:set var="sum_discount_amt"
                                value="${sum_discount_amt + ( (dto.md_price - dto.sale_price) * dto.buy_qty )}" />
                            <tr>
                                <td width="8%">
                                    <input type="checkbox" class="order_check_box form-control" checked="checked"
                                        id="${dto.md_price}" name="${dto.sale_price}" value="${dto.buy_qty}">
                                    <input type="hidden" id="cart_id${status.index}" name="cart_id${status.index}"
                                        value="${dto.cart_id}">
                                </td>
                                <td width="20%">
                                    <img src="${dto.md_thumbnail_path}" class="img-thumbnail">
                                </td>
                                <td width="20%">
                                    <a href="${pageContext.request.contextPath}/md/detail?md_id=${dto.md_id}">
                                        ${dto.md_name}
                                    </a>
                                </td>
                                <td width="15%">
                                    <div id="qty_btn">
                                        <button class="minus_btn">-</button>
                                        <input type="text" value="${dto.buy_qty}" class="quantity_input" readonly>
                                        <button class="plus_btn" data-max-qty="${dto.md_stock}">+</button>
                                    </div>
                                    <a class="qty_chg_btn" data-cart_id="${dto.cart_id}">변경</a>
                                <td width="30%"> ${dto.md_price * dto.buy_qty - ( (dto.md_price - dto.sale_price) *
                                    dto.buy_qty )} 원 </td>
                                    <button style = "display:none;" class="cart_delete_btn "  value="${dto.cart_id}"> 
                                    </button>
                            </tr>
                        </c:forEach>
                        <c:choose>
                            <c:when
                                test="${(sum_buy_amt - sum_discount_amt) >= 30000 || sum_buy_amt - sum_discount_amt <= 0}">
                                <c:set var="delivery_cost" value="0" />
                            </c:when>
                            <c:otherwise>
                                <c:set var="delivery_cost" value="3000" />
                            </c:otherwise>
                        </c:choose>

                    <td colspan="6">
                        <button id="delete_btn" class="btn btn-large btn-default"> 선택상품 삭제 </button>
                    </td>
                    <tr>
                        <td colspan="6" class="text-center">
                            <button id="shop_btn" class="btn btn-danger btn-large"> 쇼핑 계속하기 </button>
                        </td>
                    </tr>
                </table>

                <table class="table table-hover" id="total-table">
                    <tr>
                        <th> 총구매금액 </th>
                        <td class="text-right"> <span id="span_sum_buy_amt">${sum_buy_amt}</span> 원 </td>
                    </tr>
                    <tr>
                        <th> 총할인금액 </th>
                        <td class="text-right text-danger"> -<span id="span_sum_discount_amt">${sum_discount_amt}</span>
                            원 </td>
                    </tr>
                    <tr>
                        <th> 배송비 </th>
                        <td class="text-right">
                            <span class="text-right" id="span_delivery_cost">${delivery_cost}</span>원
                        </td>
                    </tr>
                    <tr>
                        <th>
                            총결제금액
                        </th>
                        <td class="text-right">
                            <span id="span_sum_total_buy_amt">${sum_buy_amt - sum_discount_amt+delivery_cost}</span> 원

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <button id="order_btn" class="btn btn-danger btn-lg"> 주문하기 </button>
                        </td>
                    </tr>
                </table>
                <!-- <hr style="background-color:black; color:white; padding:10px;"> -->

                <!-- </hr> -->
<%--                 <%@ include file="/WEB-INF/views/footer.jsp" %> --%>


                    <script type="text/javascript">
                        $(document).ready(function () {
                            $(".plus_btn").click(function () {
                                let quantity = $(this).parent("div").find("input").val();
                                let maxQty = $(this).data("maxQty");
                                if (maxQty >= parseInt(quantity) + 1) {
                                    $(this).parent("div").find("input").val(++quantity);
                                }
                            });
                            $(".minus_btn").click(function () {
                                let quantity = $(this).parent("div").find("input").val();
                                if (1 < quantity) {
                                    $(this).parent("div").find("input").val(--quantity);
                                }
                            });
                            $(".qty_chg_btn").click(function () {
                                //alert( $(this).val() + " : " + $(this).prev().val() );
                                $.get(
                                    "${pageContext.request.contextPath}/cart/update_buy_qty"
                                    , {
                                        cart_id: $(this).data("cart_id")
                                        , buy_qty: $("#qty_btn").find("input").val()
                                    }
                                    , function (data, status) {
                                        if (data >= 1) {
                                            alert("구매 수량을 수정 하였습니다.");
                                            location.href = "${pageContext.request.contextPath}/cart/list";

                                        } else {
                                            alert("구매 수량 수정을 실패 하였습니다.");
                                        }
                                    }//call back function
                                );//get

                            });//click
                        });//ready
                    </script>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $("#cbx_chkAll").click(function () {
                            	var $checkBoxList = $(".order_check_box");
                                   if ($("#cbx_chkAll").is(":checked")) {
                                   	   $(".order_check_box").prop("checked", true);
                                   	$("#span_sum_md_class_qty").text(${sum_md_class_qty});
                                        $("#span_sum_buy_amt").text(${sum_buy_amt});
                                        $("#span_sum_discount_amt").text(${sum_discount_amt});                                    
                                        $("#span_delivery_cost").text(${delivery_cost});
                                        $("#span_sum_total_buy_amt").text(${sum_buy_amt - sum_discount_amt+delivery_cost});
                                   } else {
                                   	   $(".order_check_box").prop("checked", false);
                                   		$("#span_sum_md_class_qty").text(0);
                                        $("#span_sum_buy_amt").text(0);
                                        $("#span_sum_discount_amt").text(0);
                                        $("#span_delivery_cost").text(0);
                                        $("#span_sum_total_buy_amt").text(0);
                                   }
                            });

                            $(".order_check_box").click(function () {
                                var total = $(".order_check_box").length;
                                var checked = $(".order_check_box:checked").length;

                                if (total != checked) $("#cbx_chkAll").prop("checked", false);
                                else $("#cbx_chkAll").prop("checked", true);
                            });
                        });
                    </script>

                    <script type="text/javascript">
                        let arr_cart_id = new Array();
                        $(document).ready(function () {
                            $("#order_btn").click(function () {

                                let checks = $("input[type=checkbox]");
                                for (let i = 0; i < checks.length; i++) {

                                    if (checks[i].checked == true) {
                                        arr_cart_id.push($("#cart_id" + i).val());
                                    }//if

                                }//for

                                if (arr_cart_id.length <= 0) {
                                    alert("선택된 상품이 없습니다.");
                                    return;
                                }

                                location.href = "${pageContext.request.contextPath}/order/order_list?arr_cart_id=" + arr_cart_id;

                            });//click
                        });//ready
                    </script>

                    <script type="text/javascript">
                        $(document).ready(function () {
                            $(".cart_delete_btn").click(function () {

                                $.get(
                                    "${pageContext.request.contextPath}/cart/delete"
                                    , {
                                        cart_id: $(this).val()
                                    }
                                    , function (data, status) {
                                        if (data >= 1) {
                                            location.href = "${pageContext.request.contextPath}/cart/list";
                                        } else {
                                            alert("장바구니 삭제를 실패 하였습니다.");
                                        }
                                    }//call back function
                                );//get

                            });//click
                            $("#delete_btn").click(function () {

                                let checks = $("input[type=checkbox]");
                                for (let i = 0; i < checks.length; i++) {
                                	if(i == 0) continue;
                                    if (checks[i].checked == true) {
                                    	 $(".cart_delete_btn")[i-1].click();
                                    }//if

                                }//for

                            });//click
                        });//ready
                    </script>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $("#shop_btn").click(function () {
                                location.href = "${pageContext.request.contextPath}/md/list";
                            });//click
                        });//ready
                    </script>

                    <script type="text/javascript">
                        $(document).ready(function () {
                            $(".order_check_box").click(function () {
                                //alert($(this).val() + " : " + $(this).attr("name") + " : " + $(this).attr("id"));

                                if ($(this).prop("checked") == true) {
                                    $("#span_sum_md_class_qty").text(
                                        parseInt($("#span_sum_md_class_qty").text()) + 1
                                    );
                                    $("#span_sum_buy_amt").text(
                                        parseInt($("#span_sum_buy_amt").text()) + ($(this).attr("id") * $(this).val())
                                    );
                                    $("#span_sum_discount_amt").text(
                                        parseInt($("#span_sum_discount_amt").text())
                                        + (($(this).attr("id") - $(this).attr("name")) * $(this).val())
                                    );
                                    $("#span_sum_total_buy_amt").text(
                                        parseInt($("#span_sum_total_buy_amt").text())
                                        + ($(this).attr("name") * $(this).val())
                                    );
                                    let totalAmt = parseInt($("#span_sum_total_buy_amt").text());
                                    let deliveryCost = totalAmt >= 30000 || totalAmt <= 0 ? 0 : 3000;
                                    $("#span_delivery_cost").text(deliveryCost);
                                } else if ($(this).prop("checked") == false) {
                                    $("#span_sum_md_class_qty").text(
                                        $("#span_sum_md_class_qty").text() - 1
                                    );
                                    $("#span_sum_buy_amt").text(
                                        $("#span_sum_buy_amt").text() - ($(this).attr("id") * $(this).val())
                                    );
                                    $("#span_sum_discount_amt").text(
                                        parseInt($("#span_sum_discount_amt").text())
                                        - (($(this).attr("id") - $(this).attr("name")) * $(this).val())
                                    );
                                    $("#span_sum_total_buy_amt").text(
                                        $("#span_sum_total_buy_amt").text()
                                        - ($(this).attr("name") * $(this).val())
                                    );
                                    let totalAmt = parseInt($("#span_sum_total_buy_amt").text());
                                    let deliveryCost = totalAmt >= 30000 || totalAmt <= 0 ? 0 : 3000;
                                    $("#span_delivery_cost").text(deliveryCost);
                                }//if

                            });//click
                        });//ready
                    </script>


        </body>

        </html>