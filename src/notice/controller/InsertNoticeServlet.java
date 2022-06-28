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
 * Servlet implementation class InsertNoticeServlet
 */
@WebServlet("/insert.no")
public class InsertNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		String noticeWriter = request.getParameter("noticeWriter");
		String fix = request.getParameter("fix");		
		
		Notice n = new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		n.setNoticeWriter(noticeWriter);
		n.setFix(fix);
		
		int result = new NoticeService().insertNotice(n);
		
		if(result >0) {
			response.sendRedirect("list.no");
		} else {
			request.setAttribute("msg", "공지사항 추가에 실패했습니다");
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
