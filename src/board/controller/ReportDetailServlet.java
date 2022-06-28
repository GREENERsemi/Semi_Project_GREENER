package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.ReportBoard;

/**
 * Servlet implementation class ReportDetailServlet
 */
@WebServlet("/detail.report")
public class ReportDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		System.out.println("지금 신고글의 글번호는 " + rNo);
		ReportBoard rboard = new BoardService().selectReportBoard(rNo);
		Board board = new BoardService().selectRBoard(rNo);
		
		String page = null;
		if(rboard != null) {
			page = "WEB-INF/views/board/reportDetail.jsp";
			request.setAttribute("rboard", rboard);
			request.setAttribute("board", board);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회에 실패하였습니다");
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
