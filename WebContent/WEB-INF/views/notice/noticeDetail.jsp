<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice"%>
<%
	Notice notice = (Notice)request.getAttribute("notice");
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
		<h2 align="center">공지사항</h2>
		<div class="tableArea">
			<form action="noticeUpdateForm.no" id="detailForm" name="detailForm" method="post">
				<table align = "center">
					<tr>
						<th>제목</th>
						<td colspan="3">
							<%= notice.getNoticeTitle() %>
							<input type="hidden" size="50" name="noticeTitle" value="<%= notice.getNoticeTitle() %>">
							<input type="hidden" name="noticeNo" value="<%= notice.getNoticeNo() %>">
						</td>				
						<%-- <input type="text" size="50" name="title" value =<%= notice.getNoticeTitle() %> readonly> --%>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%= notice.getNickName() %></td>
						<th>작성일</th>
						<td>
							<%= notice.getNoticeDate() %>
							<input type="hidden" name="noticeDate" value="<%= notice.getNoticeDate() %>">
						</td>  
						
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="noticeContent" cols="60" rows="15" style="resize:none;" readonly><%= notice.getNoticeContent() %></textarea>
						</td>
					</tr>
				</table>
			
				<br>
				
				<div align="center">
					<% if (m!=null && m.getUserId().equals(notice.getNoticeWriter())){ %>
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
				var noticeNo = <%=notice.getNoticeNo()%>
				location.href = '<%= request.getContextPath()%>/deleteNotice.no?no=' + noticeNo;
			}
		}
	</script>

<%@ include file = "/WEB-INF/views/common/FooterTopBtn.jsp" %>
</body>
</html>