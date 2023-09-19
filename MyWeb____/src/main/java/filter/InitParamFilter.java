package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class InitParamFilter implements Filter {
	private FilterConfig filterConfig = null;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)	throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("user_id");
		String passwd = request.getParameter("user_pw");

		String adminId= filterConfig.getInitParameter("adminId");
		String adminPw = filterConfig.getInitParameter("adminPw");

		String message;

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();

		if (id.equals(adminId) && passwd.equals(adminPw)) {
			message = "관리자 계정으로 로그인하였습니다.";
			writer.println(message);
			
			
//			관리자용 세션 생성
			request.getRequestDispatcher("/piece_adminSessionCreate.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}

		filterChain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("Filter02 해제..");
	}
}