<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "board.model.vo.*, java.util.ArrayList"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	Page pi = (Page)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
</head>
<%@ include file="/WEB-INF/views/common/Navbar.jsp" %>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section"></h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
	<!-- 				<div class="table-wrap"> -->
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
			                	<% if(list.isEmpty()){ %>
			                    <tr id="list">
			                        <td colspan="5">존재하는 게시물이 없습니다</td>
			                    </tr>
			                    <% } else{ %>
			                    	<% for(Board b : list){ %>
								      <tr id="list">
								          <td><%= b.getBoardNo() %></td>
								          <td class="listTitle"><%= b.getBoardTitle() %></td>
								          <td><%= b.getNickName() %></td>
								          <td><%= b.getCreateDate() %></td>
								          <td><%= b.getBoardCount() %></td>
								      </tr>
				                    <% } %>
								<% } %>
						  </tbody>
						</table>
	<!-- 				</div> -->
						<br><br>
				</div>
			</div>
		</div>
			<br>


    </div>
	</section>



		<!-- 페이징 -->
		<div class="pagingArea" align="center">
 			<button onclick="location.href='<%=request.getContextPath() %>/myBoardList.me?currentPage=<%= pi.getCurrentPage()-1 %>'" id="beforeBtn">&lt;</button> 

			<script>
				if(<%= pi.getCurrentPage()%> <=1){
					$('#beforeBtn').prop('disabled', true);
				}
			</script>
			
			<% for(int p = pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
				<%if(p==pi.getCurrentPage()){ %>
					<button id="choosen" disabled><%=p %></button>
				<%} else{ %>
					<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/myBoardList.me?currentPage=<%= p %>'"><%=p %></button>
				<%} %>			
			<%} %>
			
			<button onclick="location.href='<%=request.getContextPath() %>/myBoardList.me?currentPage=<%= pi.getCurrentPage()+1 %>'" id="afterBtn">&gt;</button>
			<script>
				if(<%=pi.getCurrentPage()%> >= <%=pi.getMaxPage()%>){
					$('#afterBtn').prop('disabled', true);
				}
			</script>
		</div>
				
 	<script>
		$(function(){
			$('#list td').mouseenter(function(){
				$(this).parent().css({'background':'lightgreen', 'cursor' : 'pointer'});
			}).mouseout(function(){
				$(this).parent().css({'background':'none'});
			}).click(function(){
				var num = $(this).parent().children().eq(0).text();
				location.href = '<%= request.getContextPath()%>/detail.cl?no=' + num;
			}); 
		});
	</script> 
		
<%@ include file="/WEB-INF/views/common/FooterTopBtn.jsp" %>
</body>
</html>