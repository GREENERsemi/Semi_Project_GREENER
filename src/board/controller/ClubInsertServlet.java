package board.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Club;
import member.model.vo.Member;

/**
 * Servlet implementation class ClubInsertServlet
 */
@WebServlet("/insert.cl")
public class ClubInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClubInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String acptstart = request.getParameter("acptStart");
			String acptend = request.getParameter("acptEnd");
			String onlineYn = request.getParameter("onlineYn");
			String gatherPeriod = request.getParameter("gatherPeriod");
			String boardTitle = request.getParameter("boardTitle");
			String boardContent = request.getParameter("boardContent");
			
			// acptStart와 acptEnd를 Date 타입으로 바꾸기
			Date acptStart = null;
			if(acptstart.equals("")) {
				acptStart = new Date(new GregorianCalendar().getTimeInMillis());
			} else {
				String[] dateArr = acptstart.split("-");
				int year = Integer.parseInt(dateArr[0]);
				int month = Integer.parseInt(dateArr[1]);
				int day = Integer.parseInt(dateArr[2]);
				
				acptStart = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
			}
			
			Date acptEnd = null;
			if(acptend.equals("")) {
				acptEnd = new Date(new GregorianCalendar().getTimeInMillis());
			} else {
				String[] dateArr = acptend.split("-");
				int year = Integer.parseInt(dateArr[0]);
				int month = Integer.parseInt(dateArr[1]);
				int day = Integer.parseInt(dateArr[2]);
				
				acptEnd = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());	
			}
			
			// 세션에서 글쓴이 아이디 가져오기
			HttpSession session = request.getSession();
			Member loginUser = (Member)session.getAttribute("loginUser");
			
			String boardWriter = loginUser.getUserId();
			String nickName = loginUser.getNickName();
			
			
			Club club = new Club();
			club.setOnlineYn(onlineYn);
			club.setGatherPeriod(gatherPeriod);
			club.setBoardTitle(boardTitle);
			club.setBoardContent(boardContent);
			club.setAcptStart(acptStart);
			club.setAcptEnd(acptEnd);
			club.setBoardWriter(boardWriter);
			club.setNickName(nickName);
			
			
			
			int result = new BoardService().insertClub(club);
			
			
			if(result>0) {
				response.sendRedirect("list.cl");
			}else {
				request.setAttribute("msg", "게시글 추가에 실패했습니다");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
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
