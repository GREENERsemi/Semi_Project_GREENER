<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "notice.model.vo.Notice, notice.model.vo.NoticePageInfo, java.util.ArrayList"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	NoticePageInfo npi = (NoticePageInfo)request.getAttribute("npi");
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
						<tr>
							<h3 class="fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3">공지사항</h3>
						</tr>
						<% if(m != null && m.getUserId().equals("admin123")){ %>
						 <tr>
							<div class="mt-4 mb-3 text-lg-end" style="font-size: 18px;" onclick="location.href='<%= request.getContextPath()%>/writeNoticeForm.no'">
								     <button type="button" class="btn btn-outline-secondary">글쓰기 
								        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
								         <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
								          <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
								        </svg>
								      </button>
							</div>						  
						 </tr>
						 <% } %>
						  <thead id="listArea" >
							 <tr style="background:SeaGreen">
		                        <th scope="col" class="no">번호</th>
		                        <th scope="col" class="title">제목</th>
		                        <th scope="col" class="writer">작성자</th>
		                        <th scope="col" class="date">날짜</th>
		                        <th scope="col" class="read">조회수</th>
		                    </tr>
						  </thead>
						  <tbody>
		                	<!-- 상단 고정 게시글 리스트 -->
		                <%if(npi.getCurrentPage() == 1){ %>
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

							
							<!-- 게시판 리스트 -->
		                	<% if(list.isEmpty()){ %>		
			                    <tr id="nolist">
			                        <td colspan="5">존재하는 공지사항이 없습니다</td>
			                    </tr>
		                    <% } else{ %>
		                    	<% for(Notice n : list){ %>
				                    <tr id="list">
				                        <td><%=n.getNoticeNo() %></td>
				                        <td class="listTitle"><%=n.getNoticeTitle() %></td>
				                        <td><%= n.getNickName() %></td>
				                        <td><%= n.getNoticeDate() %></td>
				                        <td><%= n.getNoticeCount() %></td>
				                    </tr>
			                    <% } %>
							<% } %>
						  </tbody>
						</table>
	<!-- 				</div> -->
						<br><br>
					<%-- <!-- 페이징 -->
					<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					    <li class="page-item">
					      <a class="page-link" href="<%= request.getContextPath() %>/reportlist.bo?currentPage=1'" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <% for(int pi = p.getStartPage(); pi <= p.getEndPage(); pi++){ %>
					    	<% if(pi == p.getCurrentPage()){ %>
					    		<li class="page-item"><button class="page-link" id="choosen" disabled><%= pi %></button></li>
					    	<% } else { %>
							    <li class="page-item"><button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath() %>/reportlist.bo?currentPage=<%= pi %>'"><%= pi %></button></li>
					    	<% } %>
					    <%} %>
					    <li class="page-item"><button class="page-link" onclick="location.href='<%= request.getContextPath() %>/reportlist.bo?currentPage=<%= p.getCurrentPage() +1 %>'" id="afterBtn">&gt;</button></li>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav> --%>
				</div>
			</div>
		</div>
		
		
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath()%>/list.no?currentPage=<%= npi.getCurrentPage()-1%>'" id="beforeBtn">&lt;</button>
			<script>
				if(<%= npi.getCurrentPage() %> <=1 ){
					$('#beforeBtn').prop('disabled', true);
				}
			</script>
			<% for(int p = npi.getStartPage(); p <= npi.getEndPage(); p++){ %>
				<% if(p== npi.getCurrentPage()){ %>
					<button id="choosen" disabled><%= p %></button>
				<% } else {%>
					<button id="numBtn" onclick="location.href='<%= request.getContextPath()%>/list.no?currentPage=<%= p%>'"><%= p%></button>
				<% } %>
			<%} %>
			
			<button onclick="location.href='<%= request.getContextPath()%>/list.no?currentPage=<%= npi.getCurrentPage()+1%>'" id="afterBtn">&gt;</button>
			<script>
				if(<%= npi.getCurrentPage() %> >= <%= npi.getMaxPage()%>){
					$('#afterBtn').prop('disabled', true);
				}
			</script>
		</div>	
        
<%--         <div align="right">
        	<% if(m != null && m.getUserId().equals("admin123")){ %>
        		<input type="button" onclick="location.href='writeNoticeForm.no'" id="writeNoBtn" value="글쓰기">
        	<% } %>
        </div> --%>
    </div>
	</section>

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
		
 	
		$(function(){
			$('#list td').mouseenter(function(){
				$(this).parent().css({'background':'lightgreen', 'cursor' : 'pointer'});
			}).mouseout(function(){
				$(this).parent().css({'background':'none'});
			}).click(function(){
				var num = $(this).parent().children().eq(0).text();
				location.href = '<%= request.getContextPath()%>/detail.no?no=' + num;
			}); 
		});
	</script> 
			
<%@ include file="/WEB-INF/views/common/FooterTopBtn.jsp" %>
</body>
</html>