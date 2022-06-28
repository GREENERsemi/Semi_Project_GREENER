package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

@WebServlet("/newsdelete.bo")
public class NewsDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewsDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		int result = new BoardService().newsdelete(bId);
		
		if(result > 0) {
			response.sendRedirect("newsBoard.me");
		} else {
			request.setAttribute("msg", "게시판 삭제에 실패하였습니다");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
