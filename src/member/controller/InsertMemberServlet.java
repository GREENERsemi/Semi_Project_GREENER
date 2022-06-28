package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */

@WebServlet(urlPatterns="/insert.me", name="InsertMemberServlet")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("user[id]");
		String userPwd = request.getParameter("user[password]");
		String userName = request.getParameter("user[name]");
		String nickname = request.getParameter("user[nickname]");
//		String email = request.getParameter("user[email]");
		String email = request.getParameter("userEmail");
		String phone = request.getParameter("user[phone]");
		String birthDate = request.getParameter("user[birthDate]");
		//비밀번호 질문 추가
		String pwdConfirm = request.getParameter("pwd[confirm]");
		int pwdQuestion = Integer.parseInt(request.getParameter("pwd[question]"));

		// pwdQuestion Member에 추가하기, DB의 Member테이블에 pwdQuestion 속성 추가하기, 이 서블릿, service, dao, query파일 수정하기
		Member member = new Member(userId, userPwd, userName, nickname, email, phone, birthDate, null, null, pwdConfirm, null, null, pwdQuestion);
		int result = new MemberService().insertMember(member);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "회원가입에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
			view.forward(request, response);
			
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
