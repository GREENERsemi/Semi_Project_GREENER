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

/**
 * Servlet implementation class ChallengeUpdateServlet
 */
@WebServlet("/chalUpdate.bo")
public class ChallengeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeUpdateServlet() {
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
			
			int bNo = Integer.parseInt(multiRequest.getParameter("bNo"));
			int challenge = Integer.parseInt(multiRequest.getParameter("challenge"));
			String chalName = null;
			switch(challenge) {
			case 1: chalName = "용기내 챌린지"; break;
			case 2: chalName = "플로깅 챌린지"; break;
			case 3: chalName = "제로웨이스트 챌린지"; break;
			case 4: chalName = "캔크러시 챌린지"; break;
			}
			String title = multiRequest.getParameter("title");
			String place = multiRequest.getParameter("place");
			String content = multiRequest.getParameter("content");
			
			String tFileNo = multiRequest.getParameter("tFileNo");
			String cFileNo = multiRequest.getParameter("cFileNo");
			String[] cFNoArr = null;
			if(cFileNo != null) {
				cFNoArr = cFileNo.split(", ");
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
			c.setBoardTitle(title);
			c.setBoardContent(content);
			c.setChalName(chalName);
			c.setChalPlace(place);
			c.setBoardNo(bNo);
			System.out.println("수정된 c = " + c);
			
			ArrayList<Image> imageList = new ArrayList<>();
			for(int i = originFiles.size()-1; i >= 0; i--) {
				Image img = new Image();
				img.setFilePath(savePath);
				img.setOriginName(originFiles.get(i));
				img.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size()-1) {
					img.setFileNo(Integer.parseInt(tFileNo));
				} else {
					for(int j = originFiles.size()-2; j >= 0; j--) {
						img.setFileNo(Integer.parseInt(cFNoArr[j]));
					}
				}
				
				imageList.add(img);
			}
			
			int result = new BoardService().updateImage(imageList);
			int result2 = new BoardService().updateCBoard(c);
			
			System.out.println("imageList.size() = " + imageList.size());
			System.out.println("result = " + result);
			System.out.println("result2 = " + result2);
			
			if(result2 > 1 ) {
				response.sendRedirect("chalDetail.bo?bNo=" + bNo);
			} else {
				request.setAttribute("msg", "게시판 수정에 실패하였습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
