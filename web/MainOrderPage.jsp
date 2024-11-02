<%-- 
    Document   : MainOrderPage
    Created on : Oct 19, 2024, 2:50:20 PM
    Author     : Quyền
--%>

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
            <a class="active" href="MainController?filter=all&action=InformationOrder&txtcontent=Tất cả">Tất cả</a>
            <a href="MainController?filter=pending&action=InformationOrder&txtcontent=Chờ Vận Chuyển">Chờ vận chuyển</a>
            <a href="MainController?filter=shipping&action=InformationOrder&txtcontent=Đang vận Chuyển">Đang vận chuyển</a>
            <a href="MainController?filter=rented&action=InformationOrder&txtcontent=Đang thuê">Đang thuê</a>
            <a href="MainController?filter=review&action=InformationOrder&txtcontent=Cần đánh giá">Cần đánh giá</a>
            <a href="MainController?filter=return&action=InformationOrder&txtcontent=Trả hàng">Trả hàng</a>
            <a href="MainController?filter=canceled&action=InformationOrder&txtcontent=Hủy đơn">Hủy đơn</a>
            <a href="MainController?filter=history&action=InformationOrder&txtcontent=Lịch Sử">Lịch sử</a>
        </div>
        
        <div class="background_coler_Product">
            <div class="backgrount_product">
                <div class="Shop_Order_product">
                    <img src="https://thebookland.vn/images/1689223695931_BrainBolt%20Genius%20(2).jpg"/>
                    <a>Máy chơi luyện trí nhớ và giải đố: BrainBolt® Máy chơi luyện trí nhớ và giải đố: BrainBolt® Máy chơi luyện trí nhớ và giải đố: BrainBolt®</a>
                    <p>Giao thành công</p>
                </div>
                <div class="line_order"></div>
                <div class="product_order">
                    <img src="https://thebookland.vn/images/1689223695931_BrainBolt%20Genius%20(2).jpg" />
                    <div class="content_product_order">
                        <a>Máy chơi luyện trí nhớ và giải đố: BrainBolt® Máy chơi luyện trí nhớ và giải đố: BrainBolt® Máy chơi luyện trí</a>
                        <div class="order_PriceAndQuantity">
                            <a>1.000.000</a>
                            <a>Số lượng: x1</a>
                        </div>                       
                    </div>
                </div>
            </div>
        </div>  
        
        
        
        
        
        <script src="JS/ButtonAuto.js"></script>
    </body>
</html>
