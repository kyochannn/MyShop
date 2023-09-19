<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="shop.dao.ProductRepository" />

<!DOCTYPE html>
<html>
<head>
    <!-- bootstrap lib -->
    <meta charset="UTF-8">
    <title>product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
</head>
<style>
    #mainitem {
        margin: 10vh 0;
    }
	/* 버튼 관련 CSS */
    button {
        margin: 20px;
    }
    .frame {
        width: 90%;
        margin: 40px auto;
        text-align: center;
    }
    .custom-btn {
        width: 10vw;
        height: 40px;
        color: #fff;
        border-radius: 5px;
        padding: 10px 25px;
        font-family: 'Lato', sans-serif;
        font-weight: 500;
        background: transparent;
        cursor: pointer;
        transition: all 0.3s ease;
        position: relative;
        display: inline-block;
        box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
            7px 7px 20px 0px rgba(0, 0, 0, .1),
            4px 4px 5px 0px rgba(0, 0, 0, .1);
        outline: none;
    }
    .btn-11 {
        border: none;
        background: rgb(251, 33, 117);
        background: linear-gradient(0deg, rgba(251, 33, 117, 1) 0%, rgba(234, 76, 137, 1) 100%);
        color: #fff;
        overflow: hidden;
    }
    .btn-11:hover {
        text-decoration: none;
        color: #fff;
    }

    .btn-11:before {
        position: absolute;
        content: '';
        display: inline-block;
        top: -180px;
        left: 0;
        width: 30px;
        height: 100%;
        background-color: #fff;
        animation: shiny-btn1 3s ease-in-out infinite;
    }
    .btn-11:hover {
        opacity: .7;
    }
    .btn-11:active {
        box-shadow: 4px 4px 6px 0 rgba(255, 255, 255, .3),
            -4px -4px 6px 0 rgba(116, 125, 136, .2),
            inset -4px -4px 6px 0 rgba(255, 255, 255, .2),
            inset 4px 4px 6px 0 rgba(0, 0, 0, .2);
    }
    @-webkit-keyframes shiny-btn1 {
        0% {
            -webkit-transform: scale(0) rotate(45deg);
            opacity: 0;
        }
        80% {
            -webkit-transform: scale(0) rotate(45deg);
            opacity: 0.5;
        }
        81% {
            -webkit-transform: scale(4) rotate(45deg);
            opacity: 1;
        }
        100% {
            -webkit-transform: scale(50) rotate(45deg);
            opacity: 0;
        }
    }
.col-lg-5>h4 {
        display: flex;
        justify-content: flex-end;
        align-items: flex-end;
        margin: 30px 0;
    }
</style>
<body>
    <jsp:include page="header.jsp" />
   		<%
			String productId = request.getParameter("id");
			Product product = productDAO.getProductById(productId);
		%>
    <div id="mainitem" class=" row justify-content-center">
        <div class="col-lg-1"></div>
        <div class="col-lg-5">
            <img src="img?id=<%= product.getProductId() %>" class="card-img-top" alt="..." style="margin-top: 10px; width: 40vw; height: 40vw; object-fit:cover">
        </div>
        <div class="col-lg-5">
            <br>
            <h3><%= product.getName() %></h3>
            <br>
            <p>상품 ID : <%= product.getProductId() %> </p>
            <p>제조사 : <%= product.getManufacturer()  %></p>
            <p>분 류 : <%= product.getCategory()  %></p>
            <p>재고 수 : <%= product.getUnitsInStock()  %></p>
            <p>리 뷰 : <%= product.getDescription()  %></p>
            <div id="pricezone">
                <br>
                <hr><br>
                <h4>총 금액 : <%= product.getUnitPrice() %>원</h4>
                <div id="orderbtnP">
                    <button class="custom-btn btn-11" <%--href=" 표현문으로 getProductId기본키를 가지고, 삼품주문페이지로 가는 것을 적고 buy.jsp 로 이동" --%> class="">상품 주문</button>
                    <button class="custom-btn btn-11" <%--href=" 표현문으로 getProductId기본키를 가지고, 삼품주문페이지로 가는 것을 적고 cart.jsp 로 이동 , 진수님 카톡" --%> class="">장바구니</button>
                    <form action="./del_pro.jsp" method="post" >
                        <input type="hidden" name="productId" value="<%= product.getProductId() %>">
                        <button type="submit" class="custom-btn btn-11">상품 삭제</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-1"></div>
    </div>
    <jsp:include page="footer.jsp" />
    <jsp:include page="script.jsp" />
</body>
</html>