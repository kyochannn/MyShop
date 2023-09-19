<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.List"%>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
    <style>
        body {
            overflow-x: hidden;
        }
        nav {
            position: fixed;
        }
        #firstShowCl {
        	backbackground-img: url
        }
        
        .jumbotron{
            background: url("img/img1.jpg");
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
		</div>
	</div>
	<%-- 여기기 찐이다. --%>
	
    <%
    List<Product> productList = productDAO.list(); 
    %>
     <div class="container">
        <div class="row  justify-content-center">
            <%
                for(int i = 0 ; i < productList.size() ; i++) {
                    Product product = productList.get(i);
            %>
	            <div class="card col-lg-4" style="width: 310px; margin: 20px;">
	            	
	                <img src="img?id=<%= product.getProductId() %>" class="card-img-top" alt="..."  style="margin-top: 10px; width: 283px; height: 283px; object-fit:cover">
	                <div class="card-body">
	                		<%-- product에서 상품명 가져오기 --%>
	                   <h5 class="card-title"><%= product.getName() %></h5>		<%-- product에서 상품명 가져오기 --%>
	                   <p class="card-text"><%= product.getDescription() %></p>	<%-- product에서 상세 설명 가져오기 --%>
                       <p id="UnitPricetext">가격 : <%= product.getUnitPrice() %>원</p>							<%-- product에서 상품 가격 가져오기 --%>
	                   <p>
	                       	<%-- product.jsp?id=P1001 --%>
	                       <a href="./product.jsp?id=<%= product.getProductId() %>"
	                       class="btn">상세 정보</a>
	                   </p>
	                </div>
	            </div>
            <%
                }
            %>
            
        </div>
    </div>


	<div>
		<%
			String user_id = request.getParameter("id");
			String user_pw = request.getParameter("passwd");
			String remember_id = request.getParameter("rememberId");		// 아이디 저장 여부
			
			// checkbox 체크 시, 기본값을 on 이 넘어온다
			// out.println("remember_id : " + remember_id);
			
			// ✅ 아이디 저장 체크 시, 쿠키 생성
			if( remember_id != null && remember_id.equals("on") ) {
				Cookie cookie_id = new Cookie("userID", user_id);
				Cookie cookie_remeber_id = new Cookie("rememberID", remember_id);
				response.addCookie(cookie_id);
				response.addCookie(cookie_remeber_id);
				out.println("아이디를 쿠키에 저장했습니다<br>");
			} 
			// 🟩 아이디 저장 미체크
			else {
				Cookie cookie_id = new Cookie("userID", "");
				Cookie cookie_remeber_id = new Cookie("rememberID", "");
				cookie_id.setMaxAge(0);
				cookie_remeber_id.setMaxAge(0);
				response.addCookie(cookie_id);		// 클라이언트한테 주는 작업
				response.addCookie(cookie_remeber_id);
				out.println("아이디를 쿠키에 해제했습니다<br>");
			}
		
			if (user_id.equals("admin") && user_pw.equals("1234")) {
				out.println(user_id + "님 환영합니다");
			} else {
				out.println("로그인에 실패했습니다");
			}
			
			
			
			if (request.isRequestedSessionIdValid() == true) {
				out.print("세션이 유효합니다.");
			}else {
				out.print("세션이 유효하지 않습니다.");
			}
		%>
	</div>
	<jsp:include page="footer.jsp" />
   
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</html>