package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateNewPwdServlet
 */
@WebServlet(urlPatterns="/updateNewPwd.me", name="UpdateNewPwdServlet")
public class UpdateNewPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNewPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("user[id]");
		String newPwd = request.getParameter("user[newPwd]");
		
		int result = new MemberService().updateNewPWd(userId, newPwd);
		
		if(result>0) {
			request.setAttribute("result", result);
			request.setAttribute("userId", userId);
		} else {
			request.setAttribute("result", result);
			request.setAttribute("userId", userId);
		}
		request.getRequestDispatcher("WEB-INF/views/common/newPwdResult.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
