package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.Image;
import board.model.vo.Page;
import board.model.vo.Recipe;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class ImageListServlet
 */
@WebServlet("/recList.bo")
public class RecListServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      BoardService service = new BoardService();    
      //게시글 내용 + 게시글에 업로드할 사진 총 두 번 이동해야해서 service라는 레퍼런스 변수로 만듦
            
      
      
//      페이징 처리@@@@@@@@
      int listCount;      // 게시글 총 개수
      int currentPage;   // 현재 페이징 표시
      int pageLimit;      // 한 페이지에 표시될 페이징 수
      int boardLimit;      // 한 페이지에 표시될 게시글 최대 개수
      int maxPage;      // 전체 페이지 중 가장 마지막 페이지
      int startPage;      // 페이징 된 페이지중 시작 페이지
      int endPage;      // 페이징 된 페이지중 마지막 페이지 
      
      listCount = service.getListCount5();      
      currentPage = 1;
      
      if(request.getParameter("currentPage") != null) {
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
      }
      
      pageLimit = 9;
      boardLimit = 9;   // 얘네는 원하는 대롱
      

      maxPage = (int)Math.ceil((double)listCount/boardLimit); 
      
      startPage = (currentPage -1)/pageLimit * pageLimit + 1;
   
      
      endPage = startPage + pageLimit - 1;
      if(maxPage < endPage) {
         endPage = maxPage;
      }
      
      Page p = new Page(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
      
//      ArrayList<Board> list = service.selectList(pi);

      // 상단 고정 게시글 리스트
      ArrayList<Notice> fixedList = new NoticeService().selectFixedList();
      HttpSession session = request.getSession();
      session.setAttribute("fixedList", fixedList);
      
      //게시글 리스트 가져오기
            ArrayList<Recipe> rList = service.selectRecList(p);
            //사진 리스트 가져오기   
//            ArrayList<Image> imageList = service.selectFList();
            ArrayList<Image> imageList = service.selectImageList();
            // service에서 
      
      
      
      String page = null;
      if(rList != null) {
         page = "WEB-INF/views/board/recipeList.jsp";
         request.setAttribute("p", p);
         request.setAttribute("rList", rList);
         request.setAttribute("imageList", imageList);         
         
         
         
         System.out.println("성공 RecList에서 넘긴 값 rList : " + rList + ": 끝 : 이미지리스트 :  " + imageList);
      } else {
         request.setAttribute("msg", "사진 게시판 조회에 실패하였습니다.");
         page = "WEB-INF/views/common/errorPage.jsp";
         System.out.println("실패 RecList에서 넘긴 값" + rList + imageList);
      }
      request.getRequestDispatcher(page).forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}