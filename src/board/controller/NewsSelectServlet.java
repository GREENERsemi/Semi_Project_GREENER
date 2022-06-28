package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.News;

@WebServlet("/newsdetail.bo")
public class NewsSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewsSelectServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int bId = Integer.parseInt(request.getParameter("bId"));
	
	News news = new BoardService().selectBoard(bId);
	String page = null;
	
	if(news != null) {
		page = "WEB-INF/views/board/newsBoardDetail.jsp";
		request.setAttribute("news", news);
	} else {
		page = "WEB-INF/views/common/errorPage.jsp";
		request.setAttribute("msg","게시글 상세조회에 실패하였습니다");
	}
	
	request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
