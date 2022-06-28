<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
<%
   Recipe r = (Recipe)request.getAttribute("r");
   ArrayList<Image> imgList = (ArrayList<Image>)request.getAttribute("imgList");
   ArrayList<Comment> comList = (ArrayList<Comment>)request.getAttribute("comList");
   Member loginUser = (Member)session.getAttribute("loginUser");
//    Member m = (Member)session.getAttribute("m");   
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .outer {
      width:1000px; height:1300px; background: rgba(255, 255, 255, 0.4); border: 2px solid white;
      margin-left:auto; margin-right:auto; margin-top:50px;
   }
   .detail{text-align:center; margin-bottom:100px;}
   .detail th, .detail td{width: 1000px; padding: 10px; background: rgba(255, 255, 255, 0.4);}
   .detail th{background: white;}
   #titleImgArea{width:500px; height:300px; margin-left:auto; margin-right:auto;}
   #contentArea{height:30px;}
   .detailImgArea{width:250px; height:210px; margin-left:auto; margin-right:auto;}
   #titleImg{width:500px; height:300px;}
   .detailImg{width:250px; height:180px;}
   .downBtn{background: #D1B2FF;}
   #recTable{margin: auto;}
   .contentArea{margin: 50 50 50 50px;}



</style>
</head>
<body>
<%@ include file = "../common/Navbar.jsp" %>
   <div class="outer">
      <table class="detail" id="recTable">
         <tr>
            <th width="50px">제목</th>
            <td colspan="5"><%= r.getBoardTitle() %></td>
         </tr>
         <tr>
<!--             <th>작성자</th> -->
<%--             <td><%= b.getNickName() %></td>                --%>
            <th>조회수</th>
            <td><%= r.getBoardCount() %></td>
            <th>작성일</th>
            <td><%= r.getCreateDate() %></td>
         </tr>
         <tr>
            <th>대표<br>사진</th>
            <td colspan="4">
               <div id="titleImgArea" align="center">
                  <a href="<%= request.getContextPath() %>/recipe_uploadImages/<%= imgList.get(0).getChangeName() %>">   
                  <img id="titleImg" src="<%= request.getContextPath() %>/recipe_uploadImages/<%= imgList.get(0).getChangeName() %>">
                  </a>
               </div>
            </td>
         </tr>
         <tr>
            <th>요리명</th>
            <td >
               
                  <%= r.getMenuName() %>
               
            </td>
         </tr>
         <tr>
            <th>재료명</th>
            <td>
               <%= r.getIngredient() %>
            </td>
         </tr>
         <tr>
            <th>내용</th>
            <td>
               <%= r.getBoardContent() %>
            </td>
         </tr>
      </table>
      
      <table class="detail">
         <tr>
            <% for(int i = 1; i < imgList.size(); i++){ %>
               <td>               
                  <div class="detailImgArea">
                     <a href="<%= request.getContextPath() %>/recipe_uploadImages/<%= imgList.get(i).getChangeName() %>"
                        download="<%= imgList.get(i).getChangeName() %>">   
                        <img id="detailImg" class="detailImg" src="<%= request.getContextPath() %>/recipe_uploadImages/<%= imgList.get(i).getChangeName() %>">
                     </a>
                  </div>
               </td>
            
            <% } %>
         </tr>
      </table>
      <div class="contentArea">
         <div class="contentWriterArea">
            <table>
               <tr>
                  <td>댓글 작성</td>
                  <td><textarea rows='3' cols='80' id="commentContent" style="resize:none;" ></textarea></td>
                  <td><button class="btn btn-sm btn-outline-secondary" id="addComment">댓글 등록</button></td>
<!--                   <input type="submit" class="btn btn-outline-danger" id="submit" value="완료">  -->
               </tr>
            </table>
         </div>
         <div id="contentSelectArea">
            <table id="contentSelectTable">
               <% if(comList.isEmpty()){%>
                  <tr><td colspan='3'>댓글이 없습니다</td></tr>
               <% } else { %>
                  <% for(int i = 0; i < comList.size(); i++){ %>   
                  <tr>
                     <td width="100px"><%= comList.get(i).getNickName() %></td>
                     <td width="400px"><%= comList.get(i).getCommentContent() %></td>
                     <td width="200px"><%= comList.get(i).getCommentDate() %></td>
                  </tr>
               <% } %>
            <% } %>
            </table>
            
         </div>
      </div>
      <br><br><br>
      </div>
   <%@ include file = "../common/FooterTopBtn.jsp" %>
<script>
      function deleteBoard(){
         if(confirm('정말 삭제하시겠습니까?')){
            location.href="<%= request.getContextPath() %>/delete.bo?bNo=" + <%= r.getBoardNo() %>;
         }
      }
      
      $(function(){
         $('#addComment').click(function(){
            var writer = '<%= loginUser.getUserId() %>';
            var bNo = <%= r.getBoardNo() %>;
            var content = $('#commentContent').val();
            
            $.ajax({
               url: "insertComment.bo",
               type: 'post',
               data: {writer:writer, content:content, bNo:bNo},
               success: function(data){
                  $commentTable = $('#contentSelectTable');
                  $commentTable.html('');      //---1
                  
                  for(var i in data) {
                     var $tr = $('<tr>');
                     var $writerTd = $('<td>').text(data[i].nickName).css('width', '100px');
                     var $contentTd = $('<td>').text(data[i].commentContent).css('width', '400px');
                     var $dateTd = $('<td>').text(data[i].commentDate).css('width', '200px');
                     
                     $tr.append($writerTd);
                     $tr.append($contentTd);
                     $tr.append($dateTd);
                     $commentTable.append($tr);
                  }
                  
                  $('#commentContent').val('');   //---2                      
               },
               error: function(data){
                  console.log(data);
               }
            });
         });
      });
   </script>
</body>
</html>