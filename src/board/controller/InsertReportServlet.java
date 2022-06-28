package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.ReportBoard;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertReportServlet
 */
@WebServlet("/insertReport.bo")
public class InsertReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int reportType = Integer.parseInt(request.getParameter("reportType"));
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String reportContent = request.getParameter("content");
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String reportUser = loginUser.getUserId();	//신고'한' 회원 아이디(당한x)
		System.out.println(loginUser.getUserId());

		ReportBoard r = new ReportBoard();
		r.setReportType(reportType);
		r.setReportContent(reportContent);
		r.setReportUser(reportUser);
		r.setReportBNo(bNo);
		System.out.println("insert되는 r은 " + r);
		
		int result = new BoardService().insertReportBoard(r);
		
		if(result > 0) {
			request.setAttribute("msg", "신고 완료되었습니다");
		} else {
			request.setAttribute("msg", "신고에 실패하였습니다");
		}
		
		request.getRequestDispatcher("WEB-INF/views/board/reportForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
