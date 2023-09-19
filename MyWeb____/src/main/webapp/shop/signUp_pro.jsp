<jsp:useBean id="userManagementDAO" class="shop.dao.UserManagement"/>
<% 
// 	Chap08의 regexp01.jsp의 폼 속성의 onsubmit="return checkform()" 참조하여,
// 	signUp 폼의 회원가입 버튼에다가 자바스크립트 confirm() 을 통해 "회원가입을 완료하시겠습니까?"를 확인받으면 더 좋을거같습니다. 

	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	String name = request.getParameter("user_name");
	
	int result = userManagementDAO.signUp(id, pw, name);
	
	if(result ==1){
		response.getWriter().write("회원가입이 정상적으로 완료되었습니다!");
		//응답 받는 페이지 (=요청을 준 페이지 = login.jsp)에서 response.getWriter().toString()으로 해당 내용을 입힐 수 있습니다.
		response.sendRedirect("products.jsp");
	}else{
		response.getWriter().write("회원가입에 실패하였습니다.");
	}
	
%>