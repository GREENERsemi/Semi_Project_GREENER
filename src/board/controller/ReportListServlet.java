package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Page;
import board.model.vo.ReportBoard;

/**
 * Servlet implementation class ReportListServlet
 */
@WebServlet("/reportlist.bo")
public class ReportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = new BoardService();
		
		int RlistCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		RlistCount = service.getRListCount();
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 10;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)RlistCount/boardLimit);
		
		startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit -1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		Page p = new Page(currentPage, RlistCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<ReportBoard> list = service.selectReportList(p);
		
		String page = null;
		if(list != null) {
			page = "WEB-INF/views/board/reportList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("p", p);
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
