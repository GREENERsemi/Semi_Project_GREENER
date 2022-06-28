package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.News;
import member.model.vo.Member;

/**
 * Servlet implementation class NewsInsertServlet
 */
@WebServlet("/newsInsert.bo")
public class NewsInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewsInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
		
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String writer = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			String reference = request.getParameter("reference");
			String category = request.getParameter("category");
			
			
			News n = new News();
			n.setBoardTitle(title);
			n.setBoardContent(content);
			n.setBoardWriter(writer);
			n.setNewsReference(reference);
			n.setNewsCategory(category);
			
			int result = new BoardService().insertNews(n);
			
			if(result > 0) {
				response.sendRedirect("newsBoard.me");
			} else {
				request.setAttribute("msg", "게시글 작성에 실패하였습니다");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
