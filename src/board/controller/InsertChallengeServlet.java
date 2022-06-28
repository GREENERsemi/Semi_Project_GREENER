package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.BoardService;
import board.model.vo.ChallengeBoard;
import board.model.vo.Image;
import common.MyFileRenamePolicy;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertChallengeServlet
 */
@WebServlet("/insert.chal")
public class InsertChallengeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertChallengeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			String root = request.getSession().getServletContext().getRealPath("/");	// WebContent아래
			String savePath = root + "challenge_image_files/";			// savePath = WebContent아래에 있는 challenge_image_files 폴더
			
			File f = new File(savePath);
			if(!f.exists()) {	// 해당 경로 이름의 파일 또는 디렉토리가 존재하는지 여부 확인 / 없으면 
				f.mkdirs();		// 폴더 생성. 서버 설정 변경 (Options -> Serve modules without publishing)
			}
			System.out.println(savePath);
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String title = multiRequest.getParameter("title");
			System.out.println(title);
			String content = multiRequest.getParameter("content");
			String writer = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			String challenge = multiRequest.getParameter("challenge");
			String place = multiRequest.getParameter("place");
			
			String chalName = null;
			switch(challenge) {
			case "1": chalName = "용기내 챌린지"; break;
			case "2": chalName = "플로깅 챌린지"; break;
			case "3": chalName = "제로웨이스트 챌린지"; break;
			case "4": chalName = "캔크러시 챌린지"; break;
			}
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			
			ChallengeBoard c = new ChallengeBoard();
			c.setBoardContent(content);
			c.setBoardTitle(title);
			c.setBoardId(1);
			c.setBoardWriter(writer);
			c.setChalName(chalName);
			c.setChalPlace(place);
			
			ArrayList<Image> imageList = new ArrayList<>();
			for(int i = originFiles.size()-1; i >= 0; i--) {
				Image img = new Image();
				img.setFilePath(savePath);
				img.setOriginName(originFiles.get(i));
				img.setChangeName(saveFiles.get(i));
				img.setFileType(1);
				
				if(i == originFiles.size()-1) {
					img.setFileLevel(0);
				} else {
					img.setFileLevel(1);
				}
				
				imageList.add(img);
			}
			
			int result = new BoardService().insertImage(c, imageList);
			
			
			if(result == imageList.size() + 2) {
				response.sendRedirect("chalList.bo");
			} else {
				request.setAttribute("msg", "챌린지 게시판 등록에 실패하였습니다");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				//실패 시 파일 저장소에 저장된 파일 삭제
				for(int i = 0; i < saveFiles.size(); i++) {
					File failFile = new File(savePath + saveFiles.get(i));
					failFile.delete();
				}
			}
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
