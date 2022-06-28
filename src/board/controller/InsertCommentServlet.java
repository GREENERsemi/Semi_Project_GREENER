package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import board.model.service.BoardService;
import board.model.vo.Comment;

/**
 * Servlet implementation class InsertReplyServlet
 */
@WebServlet("/insertComment.bo")
public class InsertCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청 받아올떄부터 안 꺠지게 해기위해서 request.setCharacterEncoding을 해줘야함 깨진걸 와서 인코딩을 할순 없음 ... 
		//setcontenttype은 response해서 응답할 때 사용하는거 .. 지금 안 쓰는건 filter로 인코딩 해줬기 떄무넹 응답과 요청의 차이를 잘 생각해보깅
		response.setCharacterEncoding("UTF-8");
		String writer = request.getParameter("writer");
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String content = request.getParameter("content");
		
		Comment com = new Comment();
		com.setCommentWriter(writer);
		com.setBoardNo(bNo);
		com.setCommentContent(content);
		
		System.out.println("com은? servlet에서 : " + com);
		ArrayList<Comment> comList = new BoardService().insertComment(com);	
		response.setContentType("application/json; charset=UTF-8");
		
		//int가 기본적이지만 로직을 어떻게 짜느냐에 따라 달라짐... insert하는거 반환값은 excuteUpdate를 통해 int값이 반환되겠지만
		//다르게 진행을 해보고 싶다 ! 라고해서 저 반환값을 나오게해본거야 .. insert하니까 무조건 int야 select하니까 무조건 객체야가 아니ㅔㅔ용 
		//insert후에 그걸로 select하는게 의도라 arrayList로했음 int로하고 따로따로 해도댐
		
//		Gson gson = new Gson();
//		gson.toJson(list, response.getWriter());	//list를 항상 printWriter로 보내젔음. 뭘 보내줄지, 누구롱해 보내줄지
		
//		@gson 자체 형식 바꿔주기
//		GsonBuilder gb = new GsonBuilder();
//		GsonBuilder dateGb = gb.setDateFormat("yyyy-MM-dd");
//		Gson gson = dateGb.create(); //gson 생성
//		gson.toJson(list, response.getWriter());
		
//		@메소드 체이닝
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(comList, response.getWriter()); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
