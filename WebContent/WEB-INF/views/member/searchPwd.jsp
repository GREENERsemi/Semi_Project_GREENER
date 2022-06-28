<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String userId = (String)request.getAttribute("userId");
	String userName = (String)request.getAttribute("userName");
	String searchPwd = (String)request.getAttribute("searchPwd");
%>
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
		margin-top: 35px;
	}
	.form-control{
		width: 50%; height: 45px; position: relative; left: 25%;
	}
</style>

</head>
<body class="text-center"  style="background: AliceBlue; font-family: 'Noto Sans KR', sans-serif;">
    
<div class="col-md-12">
       <h3 style="text-align:center;">Search Password</h3><br><br>
       <% if(searchPwd != null){ %>
	        <h5><%= userId %>님의 비밀번호는</h5>
<%-- 	        <input class="form-control" type="text" value='<%= searchPwd %>' aria-label="readonly input example" readonly> --%>
	        <%= searchPwd %>
	        <h5> 입니다.</h5>
       <%} else {%>
       		<h5><%= userId %>님의 비밀번호를 찾지 못했습니다.</h5>
       		<h5>아이디 또는 이름을 확인해 주세요.</h5>
       <%} %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>