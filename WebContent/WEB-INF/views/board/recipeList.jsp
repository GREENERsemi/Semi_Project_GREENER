<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*, member.model.vo.*, notice.model.vo.*"%>
<%
   ArrayList<Notice> fixedList = (ArrayList<Notice>)session.getAttribute("fixedList");
   Page p = (Page)request.getAttribute("p");
   ArrayList<Recipe> rList = (ArrayList<Recipe>)request.getAttribute("rList");
   ArrayList<Image> imgList = (ArrayList<Image>)request.getAttribute("imageList");
   
   for(int i = 0; i < rList.size(); i++){
      System.out.println(rList.get(i));
   }
   for(int j = 0; j < imgList.size(); j++){
      System.out.println(imgList.get(j));
      
   }
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*예시 사진 게시글 리스트*/
    .card-img-top{
      background-size:cover;
      bockground-position:50%;
   }
   a[class^="d-block"]{
      text-decoration-line : none; color: DarkGreen;
   }
   
   /*게시글 제목*/
   .card-title {
       width: 200px; height:20px; overflow: hidden;
      text-overflow: ellipsis; white-space:nowrap;
      }
   img{
      width: 400px; height: 400px;
   }
   
   /*cheers to all challengers*/
   #cheers{font-family: 'Timmana', sans-serif; font-size: 27px;}
   
   .img-fluid img-thumbnail {
display: block;
  width: 100%;
  height: auto;
   }
</style>
</head>
<body>
<%@ include file = "../common/Navbar.jsp" %>

<!-- 내용 -->
<div class="container">
  <div class="row">
   
    <div class="col-12">
          <div class="mb-2">
          
   <!-- Page Content -->
<div class="container">
   
   <div class="fw-light text-center text-lg-start mt-4 mb-0" id="cheers">
      <h2 class="fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3">
       Our Vegan Recipe 
      </h2>
   </div>


   <div>
      채식으로 친환경 삶 실천해요
   </div>

   <section class="ftco-section">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
               <h2 class="heading-section"></h2>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
   <!--             <div class="table-wrap"> -->
                  <table class="table table-hover" id="listArea">
                    <thead class="thead-dark">
                             <tr>
                                 <th scope="col" class="no">번호</th>
                                 <th scope="col" class="title">제목</th>
                                 <th scope="col" class="writer">작성자</th>
                                 <th scope="col" class="date">날짜</th>
                                 <th scope="col" class="read">조회수</th>
                             </tr>
                    </thead>
                    <tbody>
                       <%if(p.getCurrentPage() == 1){ %>
                            <%for(Notice n : fixedList){ %>
                              <tr id="fixedList">
                                  <td><%= n.getNoticeNo() %></td>
                                  <td class="listTitle"><%= n.getNoticeTitle() %></td>
                                  <td><%= n.getNickName() %></td>
                                  <td><%= n.getNoticeDate() %></td>
                                  <td><%= n.getNoticeCount() %></td>
                              </tr>
                        <%} %>
                     <%} %>
         
                    </tbody>
                  </table>
   <!--             </div> -->
                  <br><br>
            </div>
         </div>
      </div>
      </section>


   
  <hr class="mt-2 mb-4">

      <% if(m != null) { %>
      <div class="mt-4 mb-3 text-lg-end" style="font-size: 18px;" onclick="location.href='<%= request.getContextPath()%>/recipeWriteForm.bo'">
         <button type="button" class="btn btn-outline-secondary">글쓰기    
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
              <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
              <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
            </svg>
         </button>
      </div>
   
      
      <% } %>
      
        <div class="row text-center text-lg-start">
        <% if(rList.isEmpty()){ %>
           <div>
              조회된 리스트가 없습니다
           </div>
        <%} else {%>
             <% for(int i = 0; i < rList.size(); i++){ %>
              <% Recipe r = rList.get(i); %>
          <div class="col-lg-4 col-md-4 col-6">
            <a class="d-block mb-4 h-100">
               
               <table class="card-body" id="thumbnail">
               <tr>
                  <td>
                   <% for(int j = 0; j < imgList.size(); j++){ 
                       Image img = imgList.get(j); 
                       if(r.getBoardNo() == img.getBoardNo()){ %>
                          <input type="hidden" name="bNo" value="<%= r.getBoardNo() %>">
                          <img class="img-fluid img-thumbnail" src="<%= request.getContextPath() %>/recipe_uploadImages/<%= img.getChangeName() %>" alt="챌린지 이미지" width="200" height="200">
                       <%} 
                     } %>
               </td>
             </tr>
             
               <tr>
               <td>
                  <p class="card-text">
                     <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi text-danger bi-suit-heart-fill" viewBox="0 0 16 16">
                       <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
                     </svg><%= r.getBoardCount() %>명의 greener가 전수 받았어요
                  </p>
               <td>
               </tr>
 <%--               <tr>
                  <td>
                  <p class="card-title">
                   
                  <%= r.getBoardLike() %></p>

               </td>
            </tr> --%>
            <tr>
               <td>
                  <p class="card-text"><%= r.getBoardTitle() %></p>
               </td>
            </tr>
            <tr>
               <td>
                  <p class="card-text"><%= r.getNickName() %></p>
               </td>
            </tr>
            <tr>
               <td>
                  <p class="card-text"><%= r.getCreateDate() %></p>
                  <hr>
               </td>
            </tr>
         </table>
      </a>
    </div>
       <%} %>
    <%} %>
  </div>
  
   <!-- 페이징 -->
      <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
          <li class="page-item">
            <a class="page-link" href="<%= request.getContextPath() %>/recList.bo?currentPage=1" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <% for(int pi = p.getStartPage(); pi <= p.getEndPage(); pi++){ %>
             <% if(pi == p.getCurrentPage()){ %>
                <li class="page-item"><button class="page-link" id="choosen" disabled><%= pi %></button></li>
             <% } else { %>
                <li class="page-item"><button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath() %>/recList.bo?currentPage=<%= pi %>'"><%= pi %></button></li>
             <% } %>
          <%} %>
<%--                 <li class="page-item"><button class="page-link" onclick="location.href='<%= request.getContextPath() %>/reportlist.bo?currentPage=<%= p.getCurrentPage() +1 %>'" id="afterBtn">&gt;</button></li> --%>
          <li class="page-item">
            <a class="page-link" href="<%= request.getContextPath() %>/recList.bo?currentPage=<%= p.getMaxPage() %>" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>

</div>
</div>
</div>
</div>
</div>

<br>
<%@ include file = "../common/FooterTopBtn.jsp" %>
<script>
//       $(function(){
//          $('#thumbnail td').click(function(){
<%--             <%if(m == null){%> --%>
//                   alert('회원만 이용 가능한 서비스입니다.');   
<%--             <% } else { %> --%>
//                   var bNo = $(this).parent().children().children().eq(0).val();
//                   console.log(bNo);
<%--                   location.href="<%= request.getContextPath() %>/recDetail.bo?bNo=" + bNo; --%>
<%--             <% } %> --%>
//          });
//       });
      
      $(function(){
            $('#thumbnail td').mouseenter(function(){
               $(this).parent().css({'cursor':'pointer'});
            }).click(function(){
               <%if(m == null){%>
                     alert('로그인 후 이용 가능한 서비스입니다.');
                     location.href="login.me";
               <% } else { %>
                     var bNo = $(this).parent().parent().children().children().children().eq(0).val();
                     console.log("bNo" + bNo);
                     location.href="<%= request.getContextPath() %>/recDetail.bo?bNo=" + bNo;
               <% } %>
            });
         });

<!-- 상단 고정 게시글 script -->
       // fixed list 상세보기
       $(function(){
          $('#fixedList > td').mouseenter(function(){
             $(this).parent().css({'background':'green', 'cursor' : 'pointer'});
          }).mouseout(function(){
            $(this).parent().css({'background':'none'});
         }).click(function(){
            var num = $(this).parent().children().eq(0).text();
            location.href = '<%= request.getContextPath()%>/detail.no?no=' + num;
         }); 
       });
    </script>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
</html>