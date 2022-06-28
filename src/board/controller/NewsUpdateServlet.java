package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.News;

@WebServlet("/newsUpdate.bo")
public class NewsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewsUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			
			int bId = Integer.parseInt(request.getParameter("bId"));
			
			News n = new News();
			n.setBoardContent(request.getParameter("content"));
			n.setBoardTitle(request.getParameter("title"));
			n.setNewsCategory(request.getParameter("category"));
			n.setNewsReference(request.getParameter("reference"));
			n.setBoardNo(bId);
			
			int result = new BoardService().newsUpdate(n);
	
			if(result > 1) {
				response.sendRedirect("newsdetail.bo?bId="+ bId);
			} else {
				request.setAttribute("msg", "게시글 수정에 실패했습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
