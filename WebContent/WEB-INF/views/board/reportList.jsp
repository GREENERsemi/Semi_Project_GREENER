<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
	ArrayList<ReportBoard> list = (ArrayList<ReportBoard>)request.getAttribute("list");
	Page p = (Page)request.getAttribute("p");
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
<%@ include file = "../common/Navbar.jsp" %>
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-5">
				<h2 class="heading-section">신고 게시판</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
<!-- 				<div class="table-wrap"> -->
					<table class="table table-hover" id="listArea">
					  <thead class="thead-dark">
					    <tr>
					      <th>글번호</th>
					      <th>신고일</th>
					      <th>신고 사유</th>
					      <th>신고 내용</th>
					      <th>&nbsp;</th>
					    </tr>
					  </thead>
					  <tbody>
					  <% if(list.isEmpty()){ %>
					    <tr class="alert" role="alert">
					      <td colspan="5">조회된 리스트가 없습니다.</td>
					    </tr>
					  <% } else { %>
					  		<% for(ReportBoard r : list){ %>
							    <tr class="alert" role="alert">
							      <th scope="row" name="rNo"><%= r.getReportNo() %></th>
							      <td><%= r.getReportDate() %></td>
							      <% switch(r.getReportType()){ 
							      case 1: %><td>홍보, 영리목적</td><% break; 
							      case 2: %><td>도배, 스팸</td><% break; 
							      case 3: %><td>욕설, 비방, 차별, 혐오</td><% break; 
							      case 4: %><td>기타</td><% break; 
							      } %>
							      <td><%= r.getReportContent() %></td>
							      <td>
					        	</td>
							    </tr>
							<% } %>
					  <% } %>
					  </tbody>
					</table>
<!-- 				</div> -->
					<br><br>
				<!-- 페이징 -->
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <li class="page-item">
				      <a class="page-link" href="<%= request.getContextPath() %>/reportlist.bo?currentPage=1" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <% for(int pi = p.getStartPage(); pi <= p.getEndPage(); pi++){ %>
				    	<% if(pi == p.getCurrentPage()){ %>
				    		<li class="page-item"><button class="page-link" id="choosen" disabled><%= pi %></button></li>
				    	<% } else { %>
						    <li class="page-item"><button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath() %>/reportlist.bo?currentPage=<%= pi %>'"><%= pi %></button></li>
<%-- 				    <li class="page-item"><button class="page-link" onclick="location.href='<%= request.getContextPath() %>/reportlist.bo?currentPage=<%= p.getCurrentPage() +1 %>'" id="afterBtn">&gt;</button></li> --%>
				    	<% } %>
				    <%} %>
				    <li class="page-item">
				      <a class="page-link" href="<%= request.getContextPath() %>/reportlist.bo?currentPage=<%= p.getMaxPage() %>" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</section>
<script>
		$(function(){
			$('#listArea td').click(function(){
				var rNo = $(this).parent().children().eq(0).text();
				location.href = '<%= request.getContextPath() %>/detail.report?rNo=' + rNo;
			}).mouseenter(function(){
				$(this).parent().children().css({'cursor':'pointer'});
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