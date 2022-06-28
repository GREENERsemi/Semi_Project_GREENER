package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.ChallengeBoard;
import board.model.vo.Image;

/**
 * Servlet implementation class ChallengeUpdateFormServlet
 */
@WebServlet("/chalUpdateForm.bo")
public class ChallengeUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String challenge = request.getParameter("challenge");
		String title = request.getParameter("title");
		String place = request.getParameter("place");
		int like = Integer.parseInt(request.getParameter("like"));
		String nickname = request.getParameter("nickname");
		String content = request.getParameter("content");
		
		int tFileNo = Integer.parseInt(request.getParameter("tFileNo"));
//		
		String[] cArr = request.getParameterValues("cFileNo");
		String cFileNo = ""; 
				
		if(cArr != null) {
			for(int i = 0; i < cArr.length; i++) {
				if(i == 0) {
					cFileNo += cArr[i];
				} else {
					cFileNo += ", " + cArr[i];
				}
			}
		}
		
		request.setAttribute("cFileNo", cFileNo);
		request.setAttribute("tFileNo", tFileNo);
				
		request.setAttribute("challenge", challenge);
		request.setAttribute("title", title);
		request.setAttribute("place", place);
		request.setAttribute("like", like);
		request.setAttribute("nickname", nickname);
		request.setAttribute("content", content);
		int bNo = Integer.parseInt(request.getParameter("bNo"));

		ChallengeBoard cb = new ChallengeBoard();
		cb.setBoardNo(bNo);
		cb.setChalName(challenge);
		cb.setBoardTitle(title);
		cb.setChalPlace(place);
		cb.setBoardLike(like);
		cb.setNickName(nickname);
		cb.setBoardContent(content);
		
		request.setAttribute("cb", cb);
		
		request.getRequestDispatcher("WEB-INF/views/board/challengeUpdateForm.jsp").forward(request, response);

		//사진 넣다가 포기
//		String tChangeName = request.getParameter("tChangeName");
//		String tOriginName = request.getParameter("tOriginName");
//		String tFilePath = request.getParameter("tFilePath");
//		System.out.println("tFileNo" + tFileNo + "tChangeName" + tChangeName);

//		String cChangeName = request.getParameter("tChangeName");
//		String cOriginName = request.getParameter("tOriginName");
//		String cFilePath = request.getParameter("tFilePath");
//		System.out.println("cFileNo" + cFileNo + "cChangeName" + cChangeName);
//		Image tImg = new Image();
//		tImg.setFileNo(tFileNo);
//		tImg.setChangeName(tChangeName);
//		tImg.setOriginName(tOriginName);
//		tImg.setFilePath(tFilePath);
//		
//		Image cImg = new Image();
//		cImg.setFileNo(cFileNo);
//		cImg.setChangeName(cChangeName);
//		cImg.setOriginName(cOriginName);
//		cImg.setFilePath(cFilePath);
		
//		request.setAttribute("tImg", tImg);
//		request.setAttribute("cImg", cImg);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
