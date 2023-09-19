<%@page import="java.util.Enumeration"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="shop.dao.ProductRepository" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BellaDress</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    body {
        overflow-x: hidden;
    }

    nav {
        position: fixed;
    }
    
    
    * {
	  margin: 0;
	  padding: 0;
	  box-sizing: border-box;
	}

/* about input */
	#inputconflex {
		margin-bottom: 5vh;
	}
	
.inputcon {
  position: relative;
  width: 600px;
  margin: 0 auto; /* 가로 가운데 정렬을 위해 margin을 0 auto로 설정합니다. */
  margin-top: 100px;
  text-align: center; /* 입력 필드와 라벨을 텍스트 중앙으로 정렬합니다. */
}
	
	.inputcon > input {
	  font-size: 15px;
	  color: #222222;
	  width: 300px;
	  border: none;
	  border-bottom: solid #aaaaaa 1px;
	  padding-bottom: 10px;
	  text-align: center;
	  position: relative;
	  background: none;
	  z-index: 5;
	}
	
	.inputcon > input,
	.inputcon > label {
	  width: 100%; /* 입력 필드와 라벨의 너비를 100%로 설정하여 부모 요소에 맞게 확대됩니다. */
	  left: 0;
	  transform: none;
	}
	
	.inputcon > input::placeholder { color: #aaaaaa; }
	.inputcon > input:focus { outline: none; }
	
	.inputcon > span {
	  display: block;
	  position: absolute;
	  bottom: 0;
	  left: 50%;  /* right로만 바꿔주면 오 - 왼 */
	  background-color: #666;
	  width: 0;
	  height: 2px;
	  border-radius: 2px;
	  transform: translateX(-50%);
	  transition: 0.5s;
	}
	
	.inputcon > label {
	position: absolute;
	color: #aaa;
	left: 50%;
	transform: translateX(-50%);
	font-size: 20px;
	bottom: 8px;
	transition: all .2s;
	}
	
	.inputcon > input:focus ~ label, input:valid ~ label {
	font-size: 16px;
	bottom: 40px;
	color: #666;
	font-weight: bold;
	}
	
	.inputcon > input:focus ~ span, input:valid ~ span {
	width: 100%;
	}

    #firstShowCl {}

    .jumbotron {
        background-image: url("img/img1.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        color: white;
        text-shadow: 2px 2px 10px black;
        height: 300px;
        margin: 100px 0;
        padding-top: 90px;
        width: 110vw;
        left: -300px;
        /* margin-left: -100px; */
    }

    .btn {
        background-color: pink;
        display: flex;
        align-items: center;
        /* 올바른 align-items 속성 */
        justify-content: center;
    }

    .btn:hover {
        background-color: aquamarine;
    }
</style>

<body>

    <jsp:include page="header.jsp" />

    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" aria-label="Slide 6"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="6" aria-label="Slide 7"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../static/MainImg/main_1.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../static/MainImg/main_2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../static/MainImg/main_3.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../static/MainImg/main_4.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../static/MainImg/main_5.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../static/MainImg/main_6.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../static/MainImg/main_7.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <div class="px-4 py-5 my-5 text-center" id="firstShowCl">
        <h4 class="display-5 fw-bold text-body-emphasis">BellaDress members</h4>
        <div class="col-lg-6 mx-auto">
            <p class="lead mb-4">다양한 프리미엄 혜택을 누려보세요. 모던한 아름다움이 여기서 시작됩니다.</p>
            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                <button type="button" class="btn btn-lg px-4 gap-3">자세히보기</button>
                <!-- [new] 상품 등록 버튼 추가 -->
                <a href="add.jsp" class="btn btn-lg px-4 gap-3">상품 등록</a>
                <!-- <button type="button" class="btn btn-outline-secondary btn-lg px-4">Secondary</button>
				 -->
            </div>
            <!--여기다 버튼 만들기 select 2개의 값을 제출하는 버튼-->
            
        </div>
        
    </div>
    
	<div id="inputconflex">
		<div class="inputcon">
		    <input type="text" required>
		    <label>상품 검색하기</label>
		    <span></span>
		</div>
	</div>
    <!-- 셈플 코드
    <div class="container">
        <div class="row justify-content-center" id="list">
            <div class="card col-lg-4" style="width: 300px; margin: 20px;">
                <img src="img/shop1.jpg" class="card-img-top" alt="..." style="margin-top: 10px; width: 283px; height: 283px; object-fit:cover">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
            <div class="card col-lg-4" style="width: 300px; margin: 20px;">
                <img src="img/shop2.jpg" class="card-img-top" alt="..." style="margin-top: 10px; width: 283px; height: 283px; object-fit:cover">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
            <div class="card col-lg-4" style="width: 300px; margin: 20px;">
                <img src="img/shop3.jpg" class="card-img-top" alt="..."  style="margin-top: 10px; width: 283px; height: 283px; object-fit:cover">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center" id="list">
            <div class="card col-lg-4" style="width: 300px; margin: 20px;">
                <img src="img/shop4.jpg" class="card-img-top" alt="..." style="margin-top: 10px; width: 283px; height: 283px; object-fit:cover" >
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
            <div class="card col-lg-4" style="width: 300px; margin: 20px;" >
                <img src="img/shop5.jpg" class="card-img-top" alt="..." style="margin-top: 10px; width: 283px; height: 283px; object-fit:cover">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
            <div class="card col-lg-4" style="width: 300px; margin: 20px;">
                <img src="img/shop6.jpg" class="card-img-top" alt="..."  style="margin-top: 10px; width: 283px; height: 283px; object-fit:cover">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <p>
                        <a href=""
                        class="btn btn-primary">상세 정보</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
    -->

    <%-- 여기기 찐이다. --%>
	    <%
	    List<Product> productList = new ArrayList<Product>();
	    
	    if(request.getParameter("order")!=null){
	    	
	    	String order = request.getParameter("order");
	    	String isDESC = request.getParameter("isDESC");
	    	
	    	productList = productDAO.getProductList(order,isDESC);
	    }else if(request.getParameter("search")!=null){
	    	
	    	String search = request.getParameter("search");
	    	
	    	productList = productDAO.getProductList(search);
	    	
	    }else{
	    	
	    productList = productDAO.getProductList(); 
	    	
	    }
	    out.print(productList.get(0).getProductId());
	    %>
    <div class="container">
        <div class="row gy-4 justify-content-center">
	            <%
	                for(int i = 0 ; i < productList.size() ; i++) {
	                    Product product = productList.get(i);
	            %>
            <div class="card col-md-6 col-xl-4 " style="width: 310px; margin: 20px;">

                <img src="img?id=<%= product.getProductId()%>" class="card-img-top" alt="..." style="margin-top: 10px; width: 283px; height: 283px; object-fit:cover">
                <div class="card-body">
                    <p>
                        <%-- product.jsp?id=P1001 --%>
                        <a href="./product.jsp?id=<%= product.getProductId() %>" class="btn" style="">상세 정보</a>
                    </p>
                    <%-- product에서 상품명 가져오기 --%>
                    <h5 class="card-title"><%= product.getName() %></h5> <%-- product에서 상품명 가져오기 --%>
                    <p class="text-end">가격 : <%= product.getUnitPrice() %>원</p> <%-- product에서 상품 가격 가져오기 --%>
                    <p class="card-text"><%= product.getDescription() %></p> <%-- product에서 상세 설명 가져오기 --%>

                </div>
            </div>
	            <%
	                }
	            %>
        </div>
    </div>



    <%--     이 부분의 주석을 삭제하면 상품이 등록이 6개 이상으로 되지 않는다. 
    		> ! 이 부분을 longin_pro로 보내서 처리해야한다.
    
    
    <div>	
	    <%
			String user_id = (String) session.getAttribute("userID");
			String user_pw = (String) session.getAttribute("userPW");
			
			out.println("설정된 세션 이름 userID : " + user_id + "<br>");
			out.println("설정된 세션 값 userPW : " + user_pw + "<br>");
			
			// isRequestedSessionIdValid()
			// : 해당 요청이 속한 session이 유효한지 여부를 반환하는 메소드 
			if (request.isRequestedSessionIdValid() == true) {
				out.print("세션이 유효합니다.");
			}else {
	
				out.print("세션이 유효하지 않습니다.");
			}		
	
			session.invalidate();				// 세션을 무효화 - 세션의 모든 속성들이 제거
		%>
    <p>
        <h4>----- 세션을 삭제한 후 -----</h4>
        <%		
			if (request.isRequestedSessionIdValid() == true) {
				out.print("세션이 유효합니다.");
			}else {
				out.print("세션이 유효하지 않습니다.");
			}
		%>
        </div> 
        
    --%>
        <jsp:include page="footer.jsp" />
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</html>