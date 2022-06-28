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
import board.model.vo.Board;
import board.model.vo.News;
import board.model.vo.Page;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

@WebServlet("/newsBoard.me")
public class NewsBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewsBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		BoardService service = new BoardService();
		int listCount;		// 게시물 총 개수
		int currentPage;	// 현제 페이지 표시
		int pageLimit;		// 한 페이지에 표시 될 페이징 수
		int boardLimit;		// 한 페이지에 보일 게시글 최대 개수
		int maxPage;		// 전체 페이지 중 가장 마지막 페이지
		int startPage;		// 페이징 된 페이지 중 시작 페이지
		int endPage;		// 페이징 된 페이지 중 마지막 페이지
	
		
		
		listCount = service.getListCount3();
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 10;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage - 1)/pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		Page pi = new Page(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);

		
		// 상단 고정 게시글 리스트
		ArrayList<Notice> fixedList = new NoticeService().selectFixedList();
		HttpSession session = request.getSession();
		session.setAttribute("fixedList", fixedList);	
		
		
		ArrayList<News> list = service.selectList(pi);
		
		String page = null;
		if(list != null) {
			page = "WEB-INF/views/board/newsBoard.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회에 실패하였습니다.");		
		}
		
		
		request.getRequestDispatcher(page).forward(request, response);
		
				 
	}

	
	
	
	
	
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
