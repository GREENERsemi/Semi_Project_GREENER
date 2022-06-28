package board.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Club;

/**
 * Servlet implementation class UpdateClubServlet
 */
@WebServlet("/update.cl")
public class UpdateClubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateClubServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String newBoardTitle = request.getParameter("boNewTitle");
		int boardNo = Integer.parseInt(request.getParameter("boNo"));
		String acptstart = request.getParameter("acptStart");
		String acptend = request.getParameter("acptEnd");
		String newOnlineYn = request.getParameter("onlineYn");
		String newGatherPeriod = request.getParameter("gatherPeriod");
		String newBoardContent = request.getParameter("boNewContent");
		
		Date newAcptStart = null;
		if(acptstart.equals("")) {
			newAcptStart = new Date(new GregorianCalendar().getTimeInMillis());
		} else {
			String[] dateArr = acptstart.split("-");
			int year = Integer.parseInt(dateArr[0]);
			int month = Integer.parseInt(dateArr[1]);
			int day = Integer.parseInt(dateArr[2]);
			newAcptStart = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		}
		
		Date newAcptEnd = null;
		if(acptend.equals("")) {
			newAcptEnd = new Date(new GregorianCalendar().getTimeInMillis());
		} else {
			String[] dateArr = acptend.split("-");
			int year = Integer.parseInt(dateArr[0]);
			int month = Integer.parseInt(dateArr[1]);
			int day = Integer.parseInt(dateArr[2]);
			newAcptEnd = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		}		
		
		Club updateClub = new Club();
		updateClub.setBoardTitle(newBoardTitle);
		updateClub.setBoardNo(boardNo);
		updateClub.setAcptStart(newAcptStart);
		updateClub.setAcptEnd(newAcptEnd);
		updateClub.setOnlineYn(newOnlineYn);
		updateClub.setGatherPeriod(newGatherPeriod);
		updateClub.setBoardContent(newBoardContent);

		
		
		int result = new BoardService().updateClub(updateClub);
		
		if(result > 0) {
			response.sendRedirect("detail.cl?no=" + boardNo);
		} else {
			request.setAttribute("msg","게시글 수정에 실패했습니다");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);;
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
