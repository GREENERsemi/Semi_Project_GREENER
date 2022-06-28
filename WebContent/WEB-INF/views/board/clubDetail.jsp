<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*"%>
<%
	Club club = (Club)request.getAttribute("club");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "/WEB-INF/views/common/Navbar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">Club 상세보기</h2>
		<div class="tableArea">
			<form action="clubUpdateForm.cl" id="detailForm" name="detailForm" method="post">
				<table align = "center">
					<tr>
						<th>제목</th>
						<td colspan="3">
							<%= club.getBoardTitle() %>
							<input type="hidden" size="50" name="boardTitle" value="<%= club.getBoardTitle() %>">
							<input type="hidden" name="boardNo" id="bNo" value="<%= club.getBoardNo() %>">
						</td>				
						<%-- <input type="text" size="50" name="title" value =<%= notice.getNoticeTitle() %> readonly> --%>
					</tr>
					<tr>
						<th>모집 기간</th>
						<td>
						<%= club.getAcptStart() %> ~ <%= club.getAcptEnd() %>
						<input type="hidden" name="acptStart" value="<%= club.getAcptStart() %>">
						<input type="hidden" name="acptEnd" value="<%= club.getAcptEnd() %>">
						</td>
						
						
					</tr>
					<tr>
						<th>온라인 모임 여부</th>
						<%if(club.getOnlineYn().equals("N")) {%>
							<td>
							오프라인 모임
							<input type="hidden" name="onlineYn" value="<%= club.getOnlineYn() %>">
							</td>
						<%} else { %>
							<td>
							온라인 모임
							<input type="hidden" name="onlineYn" value="<%= club.getOnlineYn() %>">							
							</td>
						<%} %>

					</tr>
					<tr>
						<th>모임 주기</th>
						<td>
							<%= club.getGatherPeriod() %>
							<input type="hidden" name="gatherPeriod" value=<%=club.getGatherPeriod() %>>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
						<%= club.getNickName() %>
						<input type="hidden" name="nickName" value=<%= club.getNickName() %>>
						<input type="hidden" name="boardWriter" value=<%=club.getBoardWriter() %>>
						</td>
						<th>작성일</th>
						<td>
							<%= club.getModifyDate() %>
						</td>  
						
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="boardContent" cols="60" rows="15" style="resize:none;" readonly><%= club.getBoardContent() %></textarea>
						</td>
					</tr>	
					<tr>
						<td colspan="4" align = "right"><%@ include file="/WEB-INF/views/board/reportButton.jsp" %>		</td>				
					</tr>
				</table>
			
				<br>

				<div align="center">
					<% if (m!=null && m.getUserId().equals(club.getBoardWriter())){ %>
					<input type="submit" id="updateNoBtn" value="수정">
					<input type="button" id="deleteNoBtn" value="삭제" onclick="deleteNotice();">
					<% } %>
					<input type="button" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn" value="취소">
				</div>
			</form>
		</div>
	</div>
	
	<script>
		function deleteNotice(){
			var bool = confirm("정말 삭제하시겠습니까?")
			
			if(bool){
				var boardNo = <%=club.getBoardNo()%>;
				location.href = '<%= request.getContextPath()%>/deleteClub.cl?no=' + boardNo;
			}
		}
	</script>

<%@ include file = "/WEB-INF/views/common/FooterTopBtn.jsp" %>
</body>
</html>