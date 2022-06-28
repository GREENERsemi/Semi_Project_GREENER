<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Integer result = (Integer)request.getAttribute("result");
	String checkedPhone = (String)request.getAttribute("checkedPhone");
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Duplicate Check Phone</title>
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
	input[type=button]{
		background-color: CornflowerBlue; color: white; border: none;
		border-radius: 5px 5px 5px 5px; height: 30px;
	}
</style>

</head>
<body class="text-center"  style="background: AliceBlue; font-family: 'Noto Sans KR', sans-serif;">
    
<div class="col-md-12">
       <h3 style="text-align:center;">아이디 중복 검사</h3><br><br>
       <% if(result != null){ 
    	   		if(result>0){ %>
			        <h5>이미 존재하는 전화번호입니다</h5>
			        <h5>다른 전화번호를 입력해 주세요</h5>
			        <br><input type="button" value="다른 번호 검사하기" onclick="history.back();"/>
       		  <%} else {%>
	       		<h5>사용 가능한 전화번호입니다.</h5>
	       		<input type="hidden" id="checkedPhone" value="<%= checkedPhone %>">
	       		<br><input type="button" value="사용하기" onclick="usePhone();">
	         <%} 
	     } %>
</div>
<script>
		function usePhone(){
			opener.document.getElementById('userPhone').value = document.getElementById('checkedPhone').value;
			self.close();
		}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>