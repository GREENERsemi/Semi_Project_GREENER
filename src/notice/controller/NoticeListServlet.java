package notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import notice.model.vo.NoticePageInfo;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/list.no")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 페이징 준비
		NoticeService service = new NoticeService();
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = service.getListCount();
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 5;
		boardLimit = 10; // 한 페이지에 들어가는 게시물 수
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage-1)/pageLimit * pageLimit +1;
		
		endPage = startPage + pageLimit -1;
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		NoticePageInfo npi = new NoticePageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
			
		
		// 공지사항 게시판 리스트
		ArrayList<Notice> list = service.selectList(npi);
		

		
		// 상단 고정 게시글 리스트
		ArrayList<Notice> fixedList = service.selectFixedList();
		HttpSession session = request.getSession();
		session.setAttribute("fixedList", fixedList);
		
		
		String page = null;
		if(list != null) {
			request.setAttribute("list", list);
			request.setAttribute("npi", npi);
			
			page = "WEB-INF/views/notice/noticeList.jsp";

		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 조회에 실패했습니다");
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
