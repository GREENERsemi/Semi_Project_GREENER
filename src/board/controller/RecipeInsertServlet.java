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
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.vo.Member;
import board.model.service.BoardService;
import board.model.vo.*;
import common.MyFileRenamePolicy;


/**
 * Servlet implementation class InsertThumbnailServlet
 */
@WebServlet("/recipeInsert.bo")
public class RecipeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
//		String title = request.getParameter("title");
//		System.out.println(title);
//			==> MultipartRequest 
		
		if(ServletFileUpload.isMultipartContent(request)) {	//ServletFileUpload 안에 있음 지금 넘어온게 multipart/form-data로 전송 되었는지 확인 
				//MultipartRequest 객체 사용법
				//		MultipartRequest multiRequest = new MultipartRequest(HttpServletRequest, 파일 저장소 경로, 파일 최대 크기, 인코딩 타입, 파일 명 변환 규칙);
				//			파일 명 변환 규칙에 사용되는 기본 클래스 : DefaultFileRenamePolicy
				//				같은 이름의 파일이 존재하면 파일 명 뒤에 숫자 붙임 ex. aaa.png, aaa1.png, aaa2.png)
			
				int maxSize = 1024*1024*10;	// 10Mbyte
				String root = request.getSession().getServletContext().getRealPath("/"); 	//겟세션.애플리케이션 영역 .. /는 즉 Webcontent아래 의미  
				String savePath = root + "recipe_uploadImages/";
				
				File f = new File(savePath);	//io에 File
				if(!f.exists()) {
					f.mkdirs(); 
					
				}
				
//				System.out.println(savePath);	//해봤을 때 아래의 엉뚱한 경로가 나옴 
				//C:\5_Servlet_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp2\wtpwebapps\3_JSPServlet\thumbnail_uploadFiles/
				//서버에서 Serve modules without publishing 체크 
				//->퍼블리싱 :   메타데이터 안에서 컴퓨터가 인지하기 좋은 경로를 찾아가는 것 
				//C:\5_Servlet_workspace\3_JSPServlet\WebContent\thumbnail_uploadFiles/ 로 링크 잘 나오고 폴더 생성 됨 
				
				// cos.jar 라이브러리 별도로 필요 
				MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());	//얘는 라이브러리가 존재해야 쓸수있음
				String title = multiRequest.getParameter("title");
				String content = multiRequest.getParameter("content");
				String writer = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
				
				String menuName = multiRequest.getParameter("menuName");
				String ingredient = multiRequest.getParameter("ingredient");
				
				ArrayList<String> saveFiles = new ArrayList<String>();	//파일의 바뀐 이름을 저장할 ArrayList
				ArrayList<String> originFiles = new ArrayList<String>(); // 파일의 원래 이름을 저장할 ArrayList
				
				Enumeration<String> files = multiRequest.getFileNames();		//input type="file"의 name 값 ..
//				System.out.println(files); //java.util.Hashtable$Enumerator@68f697f3 해쉬값ㅇ ㅣ나옴 위에처럼 while 돌림
				while(files.hasMoreElements()) {
					String name = files.nextElement();	//전송순서 역순으로 나옴 
//				System.out.println(files.nextElement()); // thumbnaleImg4~1이 나옴 input type="file"의 name 값 ...
					
					if(multiRequest.getFilesystemName(name) != null) {
//						System.out.println(multiRequest.getFilesystemName(name));	//바뀐이름 20220509...
//						System.out.println(multiRequest.getOriginalFileName(name)); //원래이름 kakao...
						saveFiles.add(multiRequest.getFilesystemName(name));	//syso 출력이 아닌 ArrayList에 담아 저장하려고 가져온거니까 .. 
						originFiles.add(multiRequest.getOriginalFileName(name)); //getFileNames가 역순으로 갖고와서 계속 역수느로 저장됨 !
					}
				}
					 			
				Recipe r = new Recipe();
				r.setBoardContent(content);
				r.setBoardTitle(title);
				r.setBoardWriter(writer);
//				r.setBoardNo(boardId);
				r.setMenuName(menuName);
				r.setIngredient(ingredient);
				
				ArrayList<Image> imageList = new ArrayList<>();
				for(int i = originFiles.size() -1; i >= 0; i--) {	//파일들이 역순으로 저장되어 있어서 for문도 역순으로 작성
					Image img = new Image();
					img.setFilePath(savePath);
					img.setOriginName(originFiles.get(i));
					img.setChangeName(saveFiles.get(i));
					
					if(i == originFiles.size() -1) {	//오리진 파일즈의 사이즈보다 1이 작은것만큼의 숫자랑 인덱스가 같으면 썸네일이당 ..
						// 저장될 떈 3,2,1 썸 이렇게 저장됨	
						//		 0,1,2,3번째 니까 끝에있는 인덱스랑 같은건 썸네일이죵 .. 1이작은게 제로인덱스때문인갑다						
						img.setFileLevel(0);
					} else {
						img.setFileLevel(1);
					}
					
					imageList.add(img);					
				}
				
//				System.out.println(saveFiles);
//				System.out.println(originFiles);
				int result = new BoardService().insertRecipe(r, imageList);

				if(result == imageList.size() + 2) {	//지금까진 파일의 크기일거고 보드도 제대로 들어가면 1이 더해지니까.....
					response.sendRedirect("recList.bo");
					System.out.println("r : " + r);
					System.out.println("imageList : " + imageList);
					System.out.println("성공");
				} else {
					request.setAttribute("msg", "사진 게시판 등록에 실패하였습니다.");
					request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
					System.out.println(r);
					System.out.println(imageList);
					System.out.println("성공");
					for(int i = 0; i < saveFiles.size(); i++) {
						File failFile = new File(savePath + saveFiles.get(i));
						failFile.delete();		//insert에 실패하면 지워버림 DB에 안간 값 필요없으니 ..
					}
				}
				
		}																								//파일명 변환 규칙임 여긴 
	}																									//따로 규칙을 만들지 않겠다하면 이걸로 가져다씀 여기에서 만들어져있는 규칙을 넣어쓰겠다
																										//얘는 com.ole.servlet안에 있음 얘도 cos.jar 를 넣어서 사용가능하넉구나
																										// new DefaultFileRenamePolicy()대신
																										// 바꿔주고 실행하면 우리가 원하던대로 중복안될만한 값 나옴 

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
