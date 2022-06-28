<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)request.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Search Password</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kalam&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style>
	.col-md-12{
		margin-top: 100px;
		margin-right : auto;
		margin-left : auto;
	}
	
	input{
		width: 75%; height: 45px; vertical-align: 30px;
		border-radius: 10px 10px 10px 10px; border: none;
	}
	.inputBtn{
		background-color: CornflowerBlue; color: white; border: none;
	}
</style>

</head>
<body class="text-center"  style="background: AliceBlue; font-family: 'Noto Sans KR', sans-serif;">


<div class="col-md-12">
	<div class="input">
			<form class ="confirmPwdQuestion" action="<%=request.getContextPath() %>/createNewPwd.me" method="post">	
	    	<input type="hidden" name="user[id]" value=<%= userId %>> 

	    	<p class="label">회원가입 시 답한 비밀번호 질문</p>
	        	<select id="pwdQuestion" name="pwd[question]" required>
	        		<option value="1">어린 시절 가장 친했던 친구의 이름은?</option>
	        		<option value="2">가장 좋아하는 색은?</option>
	        		<option value="3">롤모델의 이름은?</option>
	        		<option value="4">가장 여행가고 싶은 곳은?</option>
	        		<option value="5">당신의 취미는?</option>
	        		<option value="6">시간여행을 한다면 만나고 싶은 사람은?</option>
	        		<option value="7">사계절 중 가장 좋아하는 계절은?</option>
	        	</select>
	        	<input type="text" id="pwdConfirm" name ="pwd[confirm]" placeholder="질문에 대한 당시 답을 입력하세요" class="input pass" required>
	        	<input type="submit" value="확인" class="inputBtn"/>
	        </form>
	</div>
</div>
<script>
	
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>