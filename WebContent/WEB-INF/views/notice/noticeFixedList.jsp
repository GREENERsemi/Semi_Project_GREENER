<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice, java.util.ArrayList"%>
<%
	ArrayList<Notice> fixedList = (ArrayList<Notice>)session.getAttribute("fixedList");
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
<body>
<%-- <%for(Notice n : noticeList){ %>
  <%if(n.getFix().equals("Y")){ %>
      <tr id="fixedList">
          <td><%= n.getNoticeNo() %></td>
          <td class="listTitle"><%= n.getNoticeTitle() %></td>
          <td><%= n.getNickName() %></td>
          <td><%= n.getNoticeDate() %></td>
          <td><%= n.getNoticeCount() %></td>
      </tr>
  <%} %>
<%} %> --%>
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
			
						  </tbody>
						</table>
	<!-- 				</div> -->
						<br><br>
					<%-- <!-- 페이징 -->
					<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					    <li class="page-item">
					      <a class="page-link" href="<%= request.getContextPath() %>/list.cl?currentPage=1'" aria-label="Previous">
					      <a class="page-link" href='<%=request.getContextPath() %>/list.cl?currentPage=<%= pi.getCurrentPage()-1 %>'" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    
							<script>
								if(<%= pi.getCurrentPage()%> <=1){
									$('#beforeBtn').prop('disabled', true);
								}
							</script>
					    
					    
					    <% for(int p = pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
							<%if(p==pi.getCurrentPage()){ %>
								<li class="page-item"><button class="page-link" id="choosen" disabled><%= p %></button></li>
							<%} else{ %>
							 	<li class="page-item"><button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.cl?currentPage=<%= p %>'"><%= p %></button></li>
							<%} %>			
						<%} %>

					    <li class="page-item"><button class="page-link" onclick="location.href='<%= request.getContextPath() %>/list.cl?currentPage=<%= p.getCurrentPage() +1 %>'" id="afterBtn">&gt;</button></li>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
						<script>
							if(<%=pi.getCurrentPage()%> >= <%=pi.getMaxPage()%>){
								$('#afterBtn').prop('disabled', true);
							}
						</script>		    
					    
					    
					  </ul>
					</nav> --%>
				</div>
			</div>
		</div>
		</section>

<%-- 	<section class="ftco-section">
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
			
								<%for(Notice n : fixedList){ %>
								  <%if(n.getFix().equals("Y")){ %>
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
   				</div>
			</div>
		</div>
		</section> --%>
		 
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
</body>
</html>