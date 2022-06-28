<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*"%>
<%
	ReportBoard rboard = (ReportBoard)request.getAttribute("rboard");
	Board board = (Board)request.getAttribute("board");
	System.out.println("신고 rboard = " + rboard);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "/WEB-INF/views/common/Navbar.jsp" %>
<br><br><br>
	<div class="outer">
		<br>
		<h2 align="center">신고 사유 자세히 보기</h2>
		<br><br>
		<div class="tableArea">
			<form action="noticeUpdateForm.no" id="detailForm" name="detailForm" method="post">
				<table align = "center">
					<tr>
						<th>신고 사유</th>
						<td>
						
							<% switch(rboard.getReportType()){
							case 1: %>홍보, 영리목적 <%break; 
							case 2: %>도배, 스팸 <%break; 
							case 3: %>욕설, 비방, 차별, 혐오 <%break; 
							case 4: %>기타 <%break; 
							} %>
<%-- 							<input type="hidden" size="50" name="noticeTitle" value="<%= rboard.getReportType %>"> --%>
<%-- 							<input type="hidden" name="noticeNo" value="<%= rboard.getNoticeNo() %>"> --%>
						</td>				
						<%-- <input type="text" size="50" name="title" value =<%= notice.getNoticeTitle() %> readonly> --%>
					</tr>
					<tr>
						<th>작성자(아이디)</th>
						<td><%= rboard.getReportUser() %></td>
						<th>신고일</th>
						<td>
 							<%= rboard.getReportDate() %>
							<input type="hidden" name="noticeDate" value="<%= rboard.getReportDate() %>">
						</td>  
						
					</tr>
					<tr>
						<th>신고 내용</th>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="noticeContent" cols="60" rows="5" style="resize:none;" readonly><%= rboard.getReportContent() %>
							</textarea>
						</td>
					</tr>
				</table>
				<br>
				<table align = "center">
					<%if(board.getBoardId() == 1){ %>  <!-- 챌린지 게시판 -->
					<tr>
						<th><input type="button" class="btn btn-danger btn-lg" onclick='location.href="<%= request.getContextPath()%>/chalDetail.bo?bNo=<%= rboard.getReportBNo()%>"' value="신고 대상 글 보기"></th>
					</tr>
					<% } else if(board.getBoardId() == 2){ %>    <!-- 클럽 게시판  -->
					<tr>
						<th><input type="button" class="btn btn-danger btn-lg" onclick='location.href="<%= request.getContextPath()%>/detail.cl?no=<%= rboard.getReportBNo()%>"' value="신고 대상 글 보기"></th>
					</tr>					
					<% } else if(board.getBoardId()==3){ %>    <!-- 뉴스 게시판  -->
					<tr>
						<th><input type="button" class="btn btn-danger btn-lg" onclick='location.href="<%= request.getContextPath()%>/newsdetail.bo?bId=<%= rboard.getReportBNo()%>"' value="신고 대상 글 보기"></th>
					</tr>					
					<% } else if(board.getBoardId() == 5){ %>	<!-- 레시피 게시판 -->
					<tr>
						<th><input type="button" class="btn btn-danger btn-lg" onclick='location.href="<%= request.getContextPath()%>/recDetail.bo?bNo=<%= rboard.getReportBNo()%>"' value="신고 대상 글 보기"></th>
					</tr>					
					<%} %>
<!-- 					<tr> -->
<!-- 						<th>제목</th> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<%-- 						<td><%= board.getBoardTitle() %></td> --%>
<!-- 					</tr> -->
				</table>
			
				<br>
				
<!-- 				<div align="center"> -->
<!-- 					<input type="button" id="deleteNoBtn" value="삭제" onclick="deleteNotice();"> -->
<!-- 					<input type="button" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn" value="취소"> -->
<!-- 				</div> -->
			</form>
		</div>
	</div>
	
<script>


</script>
<br><br><br><br>
<%@ include file = "/WEB-INF/views/common/FooterTopBtn.jsp" %>
</body>
</html>