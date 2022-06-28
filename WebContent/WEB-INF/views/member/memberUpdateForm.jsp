<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "member.model.vo.Member"%>
<% 
	Member myInfo = (Member)request.getAttribute("myInfo");
	String myId = myInfo.getUserId();
	String myName = myInfo.getUserName();
	String myNickName = myInfo.getNickName();
	String myEmail = myInfo.getEmail();
	String myPhone = myInfo.getPhone();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 	.outer{ */
/* 		width: 48%; height: 450px; background-color: rgba(255, 255, 255, 0.4); border: 5px solid white; */
/* 		margin-left: auto; margin-right: auto; margin-top: 5%; */
/* 	} */
	#updateForm td {text-align: right;}
	#updateForm>table{margin: auto;}
	#updateForm tr:nth-child(3) > td:nth-child(3){text-align: left;}
	
	.info {
	  width: 83%; height: 45px;
	  display: block; margin: 0 auto 15px;
	  padding: 0 15px; border: none;
	  border-bottom: 2px solid #ebebeb;
	  border-radius: 10px 10px 10px 10px;
	  position: relative; top: 10px;
	}
	
	table{
		position: relative; right: -30px;
	}
	
	.updateBox {
	  padding: 10px; padding-bottom: 50px;
	  margin: 50px auto;
	  width: 600px;
	  background-color: #D2F3CD;
	  -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	  -moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	}
</style>
</head>
<body>
<%@ include file = "../common/Navbar.jsp" %>

	<!-- 중앙 정보 부분  -->
<br><br><br>
	<div class="updateBox">
		<br>
		<h2 align="center">내 정보 수정</h2>
		<br>		
		<form action="<%= request.getContextPath() %>/update.me" method="post" id="updateForm" name="updateForm">
			<table>
				<tr>
					<th><label style="color: red;">*</label> 아이디</th>
					<td><input type="text" class="info" name="myId" style="background:#e6e6e6;" value = "<%=myId %>" readonly></td>
				</tr>
				<tr>
					<th><label style="color: red;">*</label> 이름</th>
					<td><input type="text" class="info" name="myName" value="<%=myName %>" required></td>
				</tr>
				<tr>
					<th><label style="color: red;">*</label> 닉네임 </th>
					<td><input type="text" class="info" maxlength="15" name="myNickName" value="<%=myNickName %>"required></td>
					<td><input type="button" class="btn bg-light" id="nickCheck" onclick="checkNick();" value="중복확인"></td>
				</tr>
				<tr>
					<th><label style="color: red;">*</label> 이메일 </th>
					<td><input type="email" class="info" name="myEmail" value="<%= myEmail.equals("-") ? "" : myInfo.getEmail() %>"></td>
				</tr>
				<tr>
					<th><label style="color: red;">*</label> 연락처</th>
					<td>
						<input type="tel" class="info" maxlength="13" name="myPhone"  placeholder="(-없이)01012345678" value="<%=myPhone.equals("-")? "" : myInfo.getPhone() %>">
					</td>
				</tr>
			</table>
			
			<br>
			
			<div class="btns" align="center">
				<input id="updateBtn" type="submit" class="btn btn-outline-primary" value="수정">
				<input type="button" id="cancelBtn" class="btn btn-outline-secondary" onclick="location.href='javascript:history.go(-1)'" value="취소">
			</div>
		</form>
	</div>
	
<br><br><br>
<%@ include file = "../common/FooterTopBtn.jsp" %>
</body>
</html>