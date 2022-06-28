package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import member.model.service.MemberService;

/**
 * Servlet implementation class UpdatePwdServlet
 */
@WebServlet(urlPatterns="/updatePwd.me", name="UpdatePwdServlet")
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		int result = new MemberService().updatePwd(userId, userPwd, newPwd);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "비밀번호 수정에 실패했습니다");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
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
