package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.ChallengeBoard;
import board.model.vo.Image;
import board.model.vo.Page;

/**
 * Servlet implementation class ChallengeSearchServlet
 */
@WebServlet("/search.chal")
public class ChallengeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("search");
		
		BoardService service = new BoardService();
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = service.getSearchListCount(keyword);
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 9;
		boardLimit = 9;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit -1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		Page p = new Page(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<ChallengeBoard> cList = service.searchChallengeBoard(keyword);
		
		ArrayList<Image> imageList = service.selectImageList();
		
		String page = null;
		if(cList != null) {
			page = "WEB-INF/views/board/searchCList.jsp";
			request.setAttribute("p", p);
			request.setAttribute("cList", cList);
			request.setAttribute("imageList", imageList);
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
