<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*"%>
    
<% News n = (News)request.getAttribute("news"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

</style>
</head>
<body>
<%@ include file="../common/Navbar.jsp"%>
<br><br>

      <h2 align="center">게시판 상세보기</h2>
<br><br>
      <div class="tableArea" align="center">
         <form action="<%= request.getContextPath() %>/newsUpdateForm.bo" id="detailForm" method="post">
            <%-- <table class="table" style="align:center">
               <tr>
                  <th>분야</th>
                  <td><%= n.getNewsCategory() %>
                     <input type="hidden" name="category" value="<%=n.getNewsCategory() %>">
                  </td>
                  <th>제목</th>
                  <td colspan="3"><%= n.getBoardTitle() %>
                  <input type="hidden" name="title" value="<%=n.getBoardTitle() %>">
                  </td>
               </tr>
               <tr>
                  <th>작성자</th>
                  <td><%= n.getNickName() %></td>
                  <th>조회수</th>
                  <td><%= n.getBoardCount() %></td>
                  <th>작성일</th>
                  <td><%= n.getCreateDate() %></td>
               </tr>
               <tr>
                  <th>내용</th>
               </tr>
               <tr>
                  <td colspan="6">
                     <textarea cols="60" rows="15" style="resize:none;" readonly name="content"><%= n.getBoardContent() %></textarea>
                     <input type="hidden" name="bId" id="bNo" value="<%= n.getBoardNo() %>">
                  </td>
               </tr>
               <tr>
                  <th>출처</th>
                  <input type="hidden" name="reference" value="<%=n.getNewsReference() %>"> 
                  <td><input type="button" id="reference" name="reference" value="<%= n.getNewsReference() %>" style="border:none; background:Honeydew;"> </td>
               
               <script>
            
               $('#reference').click(function(){
                  window.open('<%=n.getNewsReference() %>');
               })
               </script>
               
               </tr>
               <tr>
                  <td colspan="4" align = "right"><%@ include file="/WEB-INF/views/board/reportButton.jsp" %>      </td>            
               </tr>                  
            </table> --%> 
            
<table class="table table-hover" style="width:500px">
    
    <tr>
      <th>분야</th>
      <td colspan="5"><%= n.getNewsCategory() %>
          <input type="hidden" name="category" value="<%=n.getNewsCategory() %>">
      </td>
    </tr>
    <tr>
      <th>제목</th>
      <td colspan="4"><%= n.getBoardTitle() %></td>
       <td><input type="hidden" name="title" value="<%=n.getBoardTitle() %>"></td>
    </tr>
    <tr>
      <th>작성자</th>
      <td><%=n.getNickName() %></td>
      <th>조회수</th>
      <td><%=n.getBoardCount() %></td>
      <th>작성일</th>
      <td><%=n.getCreateDate() %>
    </tr>
    <%-- <tr>
     <th style="background:Honeydew;">출처</th>
      <td colspan="5"><input type="button" id="reference" name="reference" value="<%= n.getNewsReference() %>" style="border:none; background:Honeydew;"> </td>
     </tr> --%>
</table>

<div class="form-floating" style="width:500px">
  <textarea class="form-control"  id="floatingTextarea2" style="height:300px; background:white" readonly><%= n.getBoardContent() %></textarea>
  <input type="hidden"   name="content" id="content" value="<%=n.getBoardContent()%>">
   <input type="hidden" name="bId" id="bNo" value="<%= n.getBoardNo() %>">
   <input type="hidden" name="reference" value="<%=n.getNewsReference() %>"> 
</div>
<br>
<div class="form-floating" style="width:500px">
  <textarea style="background:white" class="form-control" id="floatingTextarea" readonly><%= n.getNewsReference() %></textarea>
  <label for="floatingTextarea">출처</label>
</div>
            
         
            <br>
            
            <div align="center">
            <% if(n.getBoardWriter().equals(m.getUserId())){ %>
            <button class="btn btn-outline-success"type="submit">수정</button>
            <button class="btn btn-outline-success" type="button" onclick="deleteNews();" id="deleteBtn">삭제</button>
            <% } %>
            
            <input class="btn btn-outline-success" type="button" onclick="location.href='<%= request.getContextPath() %>/newsBoard.me'" id="menuBtn" value="메뉴로">
            
            </div>
</form>
<br><br>
            
</div>

<script>
function deleteNews(){
   if(confirm('정말 삭제하시겠습니까?')){
      location.href="<%= request.getContextPath() %>/newsdelete.bo?bId=" + <%= n.getBoardNo() %>;
   }
}

</script>


</body>
</html>
