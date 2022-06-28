<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Search Password</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kalam&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style>
	.col-md-12{
		margin-top: 50px;
	}
	
	input{
		width: 75%; height: 45px; vertical-align: 30px;
		border-radius: 10px 10px 10px 10px; border: none;
	}
	.inputBtn{
		background-color: CornflowerBlue; color: white; border: none;
	}
</style>
<style>
	div > form{
		width : 300px;
		height : 400px;
		margin-right : auto;
		margin-left : auto;
	}
</style>
</head>
<body class="text-center"  style="background: AliceBlue; font-family: 'Noto Sans KR', sans-serif;">

<div class="col-md-12">
	<form class="searchIdByEmailForm" method="post" action="<%= request.getContextPath() %>/searchIdByEmail.do">
		<input name="userName" type="text" placeholder="이름을 입력하세요" required="required" class="input pass"/>		
		<input name="email" type="email" placeholder="이메일을 입력하세요" required= "required" class="input pass"/>
        <input type="submit" value="확인" class="inputBtn"/>
	</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>