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
import board.model.vo.Page;
import member.model.vo.Member;

/**
 * Servlet implementation class MyBoardListServlet
 */
@WebServlet("/myBoardList.me")
public class MyBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String userId = loginUser.getUserId();
		String nickName = loginUser.getNickName();

		// 1. 페이지 정보 가져오기
		
		BoardService service = new BoardService();
		
		int listCount;			// 게시물 총 갯수  // 아래 변수들 계산
		int currentPage;		// 현재 페이지 표시
		int pageLimit;			// 한 페이지에 표시될 페이징 수
		int boardLimit;			// 한 페이지에 보일 게시글 최대 개수
		int maxPage;			// 전체 페이 중 가장 마지막 페이지
		int startPage;			// 페이징된 페이지 중 시작 페이지
		int endPage;			// 페이징 된 페이지 중 마지막 페이지
		
		listCount = service.getMyListCount(userId);	
		currentPage = 1;
		if(request.getParameter("currentPage") != null) { //페이지를 처음 들어간 것이 아니라 페이지 처리가 되는 버튼을 눌렀을 때
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 요청이 들어오면 현재 도착한 페이지 번호 저장
		}
		

		pageLimit = 10;  // 임의 지정
		boardLimit = 10; // 임의 지정
		
		// maxPage 구하는 법
		// 1. 
		//if(listCount % boardLimit ==0) { 
		//	maxPage = listCount/boardLimit; 
		//} else {
		//	maxPage = listCount/boardLimit + 1; 
		//}
		
		// 2. 
		maxPage = (int)Math.ceil((double)listCount/boardLimit); // Math.ceil() : 올림
		
		// 3. 0.9 더 해서 정수값 1 올리고 int화로 소수점 아래 버리기
		// maxPage = (int)((double)listCount/boardLimit + 0.9); 
		
		
		// startPage 구하는 법
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		Page pi = new Page(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);		
		
		
		
		
		//2. 리스트 가져오기
		ArrayList<Board> list = service.myBoardList(pi, userId, nickName);
	
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("WEB-INF/views/board/myBoardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
