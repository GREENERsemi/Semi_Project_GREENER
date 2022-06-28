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
 * Servlet implementation class SearchIdByPhoneServlet
 */
@WebServlet("/searchIdByPhone.do")
public class SearchIdByPhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdByPhoneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		
		Member member = new Member();
		member.setUserName(userName);
		member.setPhone(phone);
		
		String searchIdByPhone = new MemberService().searchIdByPhone(member);
		
		String page = null;
		if(searchIdByPhone != null) {
			System.out.println(searchIdByPhone);
			request.setAttribute("member", member);
			request.setAttribute("searchId", searchIdByPhone);
			page = "WEB-INF/views/common/searchIdResult.jsp";
		} else {
			request.setAttribute("msg", "아이디 조회에 실패했습니다");
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
