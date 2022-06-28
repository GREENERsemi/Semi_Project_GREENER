package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.News;

@WebServlet("/newsUpdateForm.bo")
public class NewsUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewsUpdateFormServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		int bId = Integer.parseInt(request.getParameter("bId"));
		String content = request.getParameter("content");
		String reference = request.getParameter("reference");
		
		News n = new News();
		n.setNewsCategory(category);
		n.setBoardContent(content);
		n.setBoardTitle(title);
		n.setBoardNo(bId);
		n.setNewsReference(reference);
		
		request.setAttribute("n", n);
		request.getRequestDispatcher("WEB-INF/views/board/newsUpdateForm.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
