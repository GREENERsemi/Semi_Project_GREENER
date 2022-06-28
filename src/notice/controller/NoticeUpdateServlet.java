package notice.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/update.no")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String noNewTitle = request.getParameter("noNewTitle");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String noNewDate = request.getParameter("noNewDate");
		String noNewContent = request.getParameter("noNewContent");
		String noNewFix = request.getParameter("noNewFix");
		
		System.out.println("NoticeUpdateServlet : " + noNewDate);
		
		Date date = null;
		if(noNewDate.equals("")) {
			date = new Date(new GregorianCalendar().getTimeInMillis());
		} else {
			String[] dateArr = noNewDate.split("-");
			int year = Integer.parseInt(dateArr[0]);
			int month = Integer.parseInt(dateArr[1])-1;
			int day = Integer.parseInt(dateArr[2]);
			
			date = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		}
		
		
		Notice updateNotice = new Notice();
		updateNotice.setNoticeTitle(noNewTitle);
		updateNotice.setNoticeNo(noticeNo);
		updateNotice.setNoticeDate(date);
		updateNotice.setNoticeContent(noNewContent);
		updateNotice.setFix(noNewFix);
		
		int result = new NoticeService().updateNotice(updateNotice);
		
		if(result>0) {
			response.sendRedirect("detail.no?no="+ noticeNo);
		} else {
			request.setAttribute("msg", "게시글 변경에 실패했습니다");
			request.getRequestDispatcher("WEB-INF/views/comon/errorPage.jsp").forward(request, response);
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
