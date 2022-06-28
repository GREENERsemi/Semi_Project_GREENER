package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeUpdateFormServlet
 */
@WebServlet("/noticeUpdateForm.no")
public class NoticeUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeNo = request.getParameter("noticeNo");
		String noticeDate = request.getParameter("noticeDate");
		String noticeContent = request.getParameter("noticeContent");
		
		request.setAttribute("noticeTitle", noticeTitle);
		request.setAttribute("noticeNo", noticeNo);
		request.setAttribute("noticeDate", noticeDate);
		request.setAttribute("noticeContent", noticeContent);
		
		request.getRequestDispatcher("WEB-INF/views/notice/noticeUpdateForm.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
