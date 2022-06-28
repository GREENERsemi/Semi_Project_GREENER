package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;

/**
 * Servlet implementation class UpdateFormServlet
 */
@WebServlet("/updateForm.me")
public class UpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String myId = request.getParameter("myId");
		String myName = request.getParameter("myName");
		String myNickName = request.getParameter("myNickName");
		String myEmail = request.getParameter("myEmail");
		String myPhone = request.getParameter("myPhone");
		Member myInfo = new Member();
		myInfo.setUserId(myId);
		myInfo.setUserName(myName);
		myInfo.setNickName(myNickName);
		myInfo.setEmail(myEmail);
		myInfo.setPhone(myPhone);

		
		request.setAttribute("myInfo", myInfo);
		
		request.getRequestDispatcher("WEB-INF/views/member/memberUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
