package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.*;

/**
 * Servlet implementation class SelectFileServlet
 */
@WebServlet("/recDetail.bo")
public class SelectImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		
		// Service로 보내주는 걸 레퍼런스 변수로 만들어 줄 거임 .. why : 게시글 목록과 사진 목록을 둘 다 가져와야하므로 
		BoardService service = new BoardService();
		Recipe r = service.selectRecipe(bNo);
		ArrayList<Image> imgList = service.selectImages(bNo);	// 한 게시글에 파일이 여러개일수있으니 어레이리스트로 
		ArrayList<Comment> comList = service.selectCommentList(bNo);
		
		System.out.println("이미지리스트" + imgList);
		System.out.println("r" + r);
		
		String page = null;
		if(r != null) {
			page = "WEB-INF/views/board/recipeDetail.jsp";			
			request.setAttribute("r", r);
			request.setAttribute("imgList", imgList);
			request.setAttribute("comList", comList);
			
		} else {
			request.setAttribute("msg", "레시피 게시판 상세보기에 실패하였습니다");
			page = "WEB-INF/views/common/errorPage.jsp";
			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
