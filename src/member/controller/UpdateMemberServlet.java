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
 * Servlet implementation class UpadateMemberServlet
 */
@WebServlet("/update.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("myId");
		String updateName = request.getParameter("myName");
		String updateNickName = request.getParameter("myNickName");
		String updateEmail = request.getParameter("myEmail");
		String updatePhone = request.getParameter("myPhone");
		Member updateMember = new Member();
		
		updateMember.setUserId(id);
		updateMember.setUserName(updateName);
		updateMember.setNickName(updateNickName);
		updateMember.setEmail(updateEmail);
		updateMember.setPhone(updatePhone);
		
		int result = new MemberService().updateMember(updateMember);
		
		if(result >0) {
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "정보 수정에 실패했습니다.");
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
