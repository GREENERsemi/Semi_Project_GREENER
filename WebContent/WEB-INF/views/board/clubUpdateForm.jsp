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
		<h2 align="center">모임 게시물 수정</h2>
		<div class="tableArea">
			<form action="<%= request.getContextPath() %>/update.cl" method="post">
				<table align="center">
					<tr>
						<th>제목</th>
						
						<td colspan="3">
							<input type="text" name ="boNewTitle" size="50" value="<%= club.getBoardTitle() %>" >
							<input type="hidden" name ="boNo" value="<%= club.getBoardNo() %>">
						</td>				
					</tr>
					<tr>
						<th>모집 기간</th>
						<td>
						<input type="date" name="acptStart" value ="<%= club.getAcptStart()%>">
						~
						<input type="date" name="acptEnd" value="<%= club.getAcptEnd() %>">
						</td>
					</tr>
					<tr>
						<th>온라인 모임 여부</th>
						<td>
						<select id="onlineYn" name="onlineYn">
							<option value="Y">온라인 모임</option>
							<option value="N">오프라인 모임</option>
						</select>
						<td>
					</tr>
					<tr>
						<th>모임 주기</th>
						<td>
							<input type="text" name="gatherPeriod" value="<%=club.getGatherPeriod() %>" placeholder="ex. 주 1회 토요일 14:00~16:00">
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
						<%= m.getNickName() %>
						</td>

					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name ="boNewContent" cols="60" rows="15" style="resize:none;"><%= club.getBoardContent() %></textarea>
						</td>
					</tr>
				</table>
				
				<br>
				
				<div align="center">
					<input type="submit" id="updateNoBtn" value="저장">
					<input type="button" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn" value="취소">
				</div>
			</form>
		</div>
	</div>





<%@ include file = "/WEB-INF/views/common/FooterTopBtn.jsp" %>
</body>
</html>