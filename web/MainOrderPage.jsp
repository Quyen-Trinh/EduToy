<%-- 
    Document   : MainOrderPage
    Created on : Oct 19, 2024, 2:50:20 PM
    Author     : Quyền
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            body{
                background-color: #EAEAEA;
                width: 100%;
                height: 100%;
            }
            .content_order{
                margin-top: 120.3px;
                background-color: white; 
                box-shadow: 0 1px 0 2px rgba(0, 0, 0, 0.3);
                padding-top: 15px;
                height: 30px;
                width: 99%;
                position: fixed;
                overflow: auto;
            }
            .content_order a{
                margin-left: 100px;
                font-size: 17px;
                color: black;
                text-decoration: none;
            }
            .content_order a:hover{
                color: #209897;
                cursor: pointer;
                text-decoration: underline;
            }
            .content_order a.active { /* Thẻ được chọn sẽ có màu */
                color: #209897;
                text-decoration: underline;
            }
            .background_coler_Product{
                background-color: white;
                width: 80%;
                height: 100%;
                margin-left: 220px;
                position: fixed;
                z-index: -100;
                padding-top: 190px;
            }
            .backgrount_product{
                background-color: #E8E8E8;
                width: 80%;
                height: auto;
                margin-left: 130px;
            }
            .Shop_Order_product{
                display: flex;
                position: relative;
            }
            
            .Shop_Order_product img{
                width: 40px;
                height: 40px;
                border-radius: 20px;
                margin-left: 10px;
                margin-top: 10px;
            }
            .Shop_Order_product a{
                margin-left: 10px;
                margin-top: 10px;
                font-size: 15px;
                margin-right: 350px;
            }
            .Shop_Order_product p{
                right: 45px;
                position: absolute;
                bottom: -20px;
            }
            .line_order{
                background-color: #333;
                width: 100%;
                height: 1.5px;
                margin-top: 10px;
            }
            .product_order{
                margin-left: 20px;
                margin-top: 15px;
                display: flex;
                padding-bottom: 15px;
                position: relative;
            }
            .product_order img{
                width: 150px;
                height: 180px;
            }
            .content_product_order{
                position: absolute;
                margin-left: 170px;
            }
            .content_product_order a{
                font-size: 18px;
                padding-right: 20px;
                line-height: 1.3;
                display: -webkit-box;
                -webkit-line-clamp: 2; /* Hiển thị tối đa 2 dòng */
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis; 
            }
            .order_PriceAndQuantity a{
                font-size: 16px;
                margin-left: 200px;
                margin-top: 20px;
            }
        </style>
        
    </head>
    <body>
       
        <%@include  file="UserNavigation.jsp" %>
         <%--trạng thái đơn hàng xử lý txtcontent . xử lý MainController: action=InformationOrder --%>
        <div class="content_order">
            <a class="active" href="MainController?filter=all&action=InformationOrder&txtcontent=0">Tất cả</a>
            <a href="MainController?filter=pending&action=InformationOrder&txtcontent=1">Chờ vận chuyển</a>
            <a href="MainController?filter=shipping&action=InformationOrder&txtcontent=2">Đang vận chuyển</a>
            <a href="MainController?filter=rented&action=InformationOrder&txtcontent=3">Đang thuê</a>
            <a href="MainController?filter=review&action=InformationOrder&txtcontent=4">Cần đánh giá</a>
            <a href="MainController?filter=return&action=InformationOrder&txtcontent=5">Trả hàng</a>
            <a href="MainController?filter=canceled&action=InformationOrder&txtcontent=6">Hủy đơn</a>
            <a href="MainController?filter=history&action=InformationOrder&txtcontent=7">Lịch sử</a>
        </div>
        
        <c:choose>
            <c:when test="${not empty orderList}">
                <c:forEach var="order" items="${orderList}">
                    <c:forEach var="product" items="${product}">
                        <c:forEach var="pdetail" items="${pdetail}">
                            <c:if test="${order.odid == pdetail.odid}">
                                <c:forEach var="shop" items="${shop}">
                                    <c:if test="${shop.soid == order.soid}">
                                        <div class="background_coler_Product">
                                            <div class="backgrount_product">
                                                <div class="Shop_Order_product">
                                                    <img src="${shop.avatar}"/>
                                                    <a>${shop.name}</a>
                                                    <p>
                                                        <c:choose>
                                                            <c:when test="${order.status == 1}">Chờ vận chuyển</c:when>
                                                            <c:when test="${order.status == 2}">Đang vận chuyển</c:when>
                                                            <c:when test="${order.status == 3}">Đang Thuê</c:when>
                                                            <c:when test="${order.status == 4 || order.status == 7}">Giao thành công</c:when>
                                                            <c:when test="${order.status == 5}">Đang trả hàng</c:when>
                                                            <c:when test="${order.status == 6}">Hủy đơn</c:when>
                                                        </c:choose>
                                                    </p>
                                                </div>
                                                <div class="line_order"></div>
                                                <div class="product_order">
                                                    <img src="${product.image}" />
                                                    <div class="content_product_order">
                                                        <a>${product.name}</a>
                                                        <div class="order_PriceAndQuantity">
                                                            <a><fmt:formatNumber value="${pdetail.price}" pattern="#,###"></fmt:formatNumber> đ</a>
                                                            <a>${order.quantity}</a>
                                                            <c:if test="${order.rentTime > 0}">
                                                                <a>${order.rentTime}</a>
                                                            </c:if>
                                                        </div>                       
                                                    </div>
                                                </div>
                                            </div>  
                                        </div>
                                    </c:if>                                   
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <a>trống</a>
            </c:otherwise>
        </c:choose>



        <script src="JS/ButtonAuto.js"></script>
       
    </body>
</html>
