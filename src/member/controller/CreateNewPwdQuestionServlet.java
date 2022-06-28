package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateNewPwdQuestionServlet
 */
@WebServlet("/createNewPwdQuestion.me")
public class CreateNewPwdQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateNewPwdQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int validNumber = Integer.parseInt(request.getParameter("validNumber"));
		String userId = request.getParameter("user[id]");
//		int validation = Integer.parseInt(request.getParameter("validation"));
		
//		String page = null;
//		if(validNumber == validation) {
//			request.setAttribute("userId", userId);
//			page = "WEB-INF/views/member/createNewPwdQuestion.jsp";
//		}else {
//			request.setAttribute("msg", "인증번호가 불일치합니다");
//			page = "WEB-INF/views/common/errorPage.jsp";
//		}
//		
//		request.getRequestDispatcher(page).forward(request, response);
		
		request.setAttribute("userId", userId);
		request.getRequestDispatcher( "WEB-INF/views/member/createNewPwdQuestion.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
