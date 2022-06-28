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
 * Servlet implementation class SearchIdByEmailServlet
 */
@WebServlet("/searchIdByEmail.do")
public class SearchIdByEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdByEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");

		
		Member member = new Member();
		member.setUserName(userName);
		member.setEmail(email);
		
		String searchIdByEmail = new MemberService().searchIdByEmail(member);
		
		String page = null;
		if(searchIdByEmail != null) {
			request.setAttribute("member", member);
			request.setAttribute("searchId", searchIdByEmail);
			page = "WEB-INF/views/common/searchIdResult.jsp";
		} else {
			request.setAttribute("msg", "아이디를 찾는데 실패했습니다");
			page = "WEB-INF/views/common/errorPage.jsp";
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
