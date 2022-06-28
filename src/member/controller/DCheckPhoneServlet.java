package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class DCheckPhoneServlet
 */
@WebServlet("/dCheckPhone.me")
public class DCheckPhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DCheckPhoneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String phone = request.getParameter("inputPhone");
		
//		int result = new MemberService().checkPhone(phone);
//		
//		request.setAttribute("result", result);
//		request.setAttribute("checkedPhone", phone);
//		request.getRequestDispatcher("WEB-INF/views/member/dCheckPhone.jsp").forward(request, response);
	
		//Ajax
		String userPhone = request.getParameter("userPhone");
		
//		System.out.println("phone = "+userPhone);
		
		int result = new MemberService().checkPhone(userPhone);
		
//		System.out.println(result);
		
		response.setCharacterEncoding("UTF-8");
		if(result > 0) {
			response.getWriter().print("이미 존재하는 전화번호입니다");
		} else {
			response.getWriter().print("사용 가능한 전화번호입니다");
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
