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
 * Servlet implementation class CreateNewPwdServlet
 */
@WebServlet("/createNewPwd.me")
public class CreateNewPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateNewPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("user[id]");
		int pwdQuestion = Integer.parseInt(request.getParameter("pwd[question]"));
		String pwdConfirm = request.getParameter("pwd[confirm]");
		Member member = new Member();
		
		member.setUserId(userId);
		member.setPwdQuestion(pwdQuestion);
		member.setPwdConfirm(pwdConfirm);
		
		int result = new MemberService().createNewPwd(member);
		
		String page = null;
		if(result>0) {
			request.setAttribute("userId", userId);
			page = "WEB-INF/views/member/createNewPwd.jsp";
		}else {
			request.setAttribute("result", result);
			request.setAttribute("userId", userId);
			page = "WEB-INF/views/common/newPwdResult.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
