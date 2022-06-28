<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th{text-align: right; height: 50px;}
	#updatePwdForm>table{margin: auto;}
	.th{
		text-align: right;
	}
	.box {
	  padding: 10px; padding-bottom: 50px;
	  margin: 50px auto;
	  width: 600px;
	  background-color: #D2F3CD;
	  -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	  -moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	}
	
	.input{
	  width: 83%; height: 45px;
	  display: block; margin: 0 auto 15px;
	  padding: 0 15px; border: none;
	  border-bottom: 2px solid #ebebeb;
	  border-radius: 10px 10px 10px 10px;
	  position: relative; top: 10px;
	}
</style>
</head>
<body>
<%@ include file = "../common/Navbar.jsp" %>
	<!-- 중앙 -->
<br><br><br><br><br>
	<div class="box">
		<br><br>
		<h2 align="center">비밀번호 수정하기</h2>
		<br>
		<form action="<%= request.getContextPath() %>/updatePwd.me" method="post" id="updatePwdForm" name="updatePwdForm" onsubmit="return send();">
			<table>
				<tr>
					<th class="th"><label>현재 비밀번호</label></th>
					<td><input type="password" class="input" name="userPwd" id="userPwd"></td>
				</tr>
				<tr>
					<th class="th"><label>변경 비밀번호</label></th>
					<td><input type="password" class="input" name="newPwd"></td>
				</tr>
				<tr>
					<th class="th"><label>변경 비밀번호 확인</label></th>
					<td><input type="password" class="input" name="newPwd2"></td>
				</tr>
			</table>
			
			<br><br>
			
			<div class="btns" align="center">
				<input id="updatePwdBtn" type="submit" class="btn btn-outline-primary" value="변경">
				<input type="button" id="cancelBtn" class="btn btn-outline-secondary" onclick="location.href='javascript:history.back();'" value="취소">
			</div>
		</form>
	</div>
<br><br><br><br><br>
<%@ include file = "../common/FooterTopBtn.jsp" %>
</body>
</html>