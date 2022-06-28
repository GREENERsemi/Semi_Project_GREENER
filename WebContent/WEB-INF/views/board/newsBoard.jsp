<%@page import="oracle.net.aso.b"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*, notice.model.vo.*"%>
    
<%
   ArrayList<News> list = (ArrayList<News>)request.getAttribute("list");
   Page pi = (Page)request.getAttribute("pi");
   ArrayList<Notice> fixedList = (ArrayList<Notice>)session.getAttribute("fixedList");
   
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css"></head>

<body>

<%@ include file="../common/Navbar.jsp"%>

<section class="ftco-section">
   <div class="container" >
      <div class="row justify-content-center" >
         <div class="col-md-6 text-center mb-5">
            <h2 class="heading-section" style="font-family: 'PT Sans', sans-serif;">기사 공유 게시판</h2>
         </div>
      </div>
      <div class="row">
         <div class="col-md-12">

               <table class="table" id="listArea" style="text-align:center;">
                 <thead>
                   <tr style="background:SeaGreen">
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                 <!-- 상단 고정 게시글 -->
                		<%if(pi.getCurrentPage() == 1){ %>
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
                
                
                <% if(list.isEmpty()){ %>
                <tr class="alert" role="alert">
                   <td colspan="6">조회된 리스트가 없습니다.</td>
                </tr>
                <% } else { %>
                   <% for(News n : list) { %>
                    <tr class="alert" role="alert">
                        <th scope="row"><%= n.getBoardNo() %></th>
                        <td><%= n.getBoardTitle() %></td>
                        <td><%= n.getNickName() %></td>
                        <td><%= n.getCreateDate() %></td>
                        <td><%= n.getBoardCount() %></td>
                    </tr>
                    <% } %>
                 <% } %>
                </tbody>
            </table>
            </div>
            </div>
         <br>
         
         <div class="buttonArea" align="right">
            <% if(m != null) {%>
               <button class="btn btn-success"onclick="location.href='<%= request.getContextPath() %>/newswriteBoardform.bo'">작성하기</button>
            <% } %>
         </div>
         </div>
         </section>
         
        
         
         <br><br>
         <!-- 페이징  -->
         <div class="pagingArea" align="center">
         <!-- 맨 처음으로 -->
         <button class="btn btn-outline-success" onclick ="location.href='<%=request.getContextPath()%>/newsBoard.me?currentPage=1'">&lt;&lt;</button>
         
         <!-- 이전 페이지로 -->
         <button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath() %>/newsBoard.me?currentPage=<%= pi.getCurrentPage()-1 %>'" id="beforeBtn">&lt;</button>
         <script>
            if(<%= pi.getCurrentPage() %> <= 1){
               $('#beforeBtn').prop('disabled', true);
            }
         </script>
         
         <!-- 숫자 페이지로 -->
         <% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
            <% if(p == pi.getCurrentPage()){ %>
               <button class="btn btn-outline-success" id="choosen" disabled><%= p %></button>
         <% } else { %>
         <button class="btn btn-outline-success" id="numBtn" onclick="location.href='<%= request.getContextPath() %>/newsBoard.me?currentPage=<%= p %>'"><%= p %></button>
            <% } %>
         <% } %>
         <!-- 다음 페이지로 -->
         <button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath() %>/newsBoard.me?currentPage=<%= pi.getCurrentPage()+1 %>'" id="afterBtn">&gt;</button>
         <script>
            if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>){
                  $('#afterBtn').prop('disabled', true);   
            }
         </script>
         
         <!-- 맨 마지막으로 -->
         <button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath() %>/newsBoard.me?currentPage=<%=pi.getMaxPage() %>'">&gt;&gt;</button>
         
         </div>
         
           
<script>
       $(function(){
          
            $('#listArea td').mouseenter(function(){
               $(this).parent().css({'background' : 'darkgray', 'cursor' : 'pointer'});
            }).mouseout(function(){
               $(this).parent().css('background', 'none');
            }).click(function(){
               var bId = $(this).parent().children().eq(0).text();
               
               if('<%= m %>' != 'null'){
               location.href = '<%= request.getContextPath() %>/newsdetail.bo?bId=' + bId;
               } else {
                  alert('회원만 이용할 수 있는 서비스입니다.')
               }
            })
         
      }); 
</script> 

<!-- 상단 고정 게시글 script  -->
 	<script>
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
         
<%@ include file = "../common/FooterTopBtn.jsp" %>
<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>