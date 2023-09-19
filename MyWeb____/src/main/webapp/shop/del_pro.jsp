<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="shop.dao.ProductRepository" />
<%
	request.setCharacterEncoding("UTF-8");

	String productId = request.getParameter("productId");
	int result = productDAO.deleteProduct(productId);
	
	if(result==0){
		%>
		<jsp:include page="product.jsp" />
		<hr>
		<h1>!!DELETE FAILED!!</h1>
		<%out.print(productId);
	}else{
		response.sendRedirect("products.jsp");
	}
%>
<!-- 필터에 대한 개념은 알겠는데 어떻게 적용해야하는지 잘 모르겠다.  -->