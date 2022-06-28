package board.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.Club;

/**
 * Servlet implementation class UpdateClubFormServlet
 */
@WebServlet("/clubUpdateForm.cl")
public class UpdateClubFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateClubFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String boardTitle = request.getParameter("boardTitle");
		String acptstart = request.getParameter("acptStart");
		String acptend = request.getParameter("acptEnd");
		String onlineYn = request.getParameter("onlineYn");
		String gatherPeriod = request.getParameter("gatherPeriod");
		String boardWriter = request.getParameter("boardWriter");
		String boardContent = request.getParameter("boardContent");
		
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
		
		Club club = new Club();
		
		club.setBoardNo(boardNo);
		club.setBoardTitle(boardTitle);
		club.setBoardContent(boardContent);
		club.setAcptStart(acptStart);
		club.setAcptEnd(acptEnd);
		club.setOnlineYn(onlineYn);
		club.setGatherPeriod(gatherPeriod);
		club.setBoardWriter(boardWriter);
		
		request.setAttribute("club", club);
		request.getRequestDispatcher("WEB-INF/views/board/clubUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
