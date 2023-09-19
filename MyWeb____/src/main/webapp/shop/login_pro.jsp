<jsp:useBean id="userManagementDAO" class="shop.dao.UserManagement"/>


	<%
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
	
		
		int result = userManagementDAO.login(user_id, user_pw);
		if(result ==1 ){
			/* session.invalidate(); */
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_pw", user_pw);
			response.sendRedirect("products.jsp");
		}else{
		
			response.setHeader("msg", "아이디 또는 비밀번호가 일치하지않습니다.");
			response.sendRedirect("login.jsp");
// 			login페이지에서 『response.getWriter()의 값이 없을 때』를 조건으로 자바스크립트의 response.getWriter().toString()메소드를 실행하여 alrer()안에 넣으면 될듯!!

		}
	%>
