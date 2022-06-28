package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(urlPatterns = "/login.do", name="Login2Servlet")
public class Login2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");

		Member member = new Member();
		member.setUserId(userId);
		member.setUserPwd(userPwd);
		
//		System.out.println(userId);
//		System.out.println(userPwd);
		
		Member loginUser = new MemberService().loginUser(member);
		
		if(loginUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			session.setMaxInactiveInterval(1200);
			
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "로그인에 실패했습니다");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
