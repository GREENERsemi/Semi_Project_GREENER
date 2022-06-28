package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Club;
import board.model.vo.Page;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class ClubListServlet
 */
@WebServlet("/list.cl")
public class ClubListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClubListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = new BoardService();
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = service.getClubListCount();
		currentPage = 1;
		if(request.getParameter("currentPage")!= null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
		}
		
		pageLimit = 5;
		boardLimit = 10;  // 한 페이지에 들어가는 열
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage-1)/pageLimit*pageLimit+1;
		
		endPage = startPage + pageLimit -1; 
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		Page pi = new Page(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		ArrayList<Club> list = service.selectClubList(pi);
		
		// 상단 고정 게시글 리스트
		ArrayList<Notice> fixedList = new NoticeService().selectFixedList();
		HttpSession session = request.getSession();
		session.setAttribute("fixedList", fixedList);
		
		
		String page = null;
		if(list!= null) {
			page="WEB-INF/views/board/clubList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회에 실패했습니다.");
					
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
