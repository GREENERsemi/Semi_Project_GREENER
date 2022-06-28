<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	
	input{
		width: 75%; height: 45px; vertical-align: 30px;
		border-radius: 10px 10px 10px 10px; border: none;
	}
	.inputBtn{
		background-color: CornflowerBlue; color: white; border: none;
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
<body class="text-center" onload="inputValue();" style="background: AliceBlue; font-family: 'Noto Sans KR', sans-serif;">
    
<div class="col-md-12">
      <form id="dCheckPhoneForm" action="<%= request.getContextPath() %>/dCheckPhone.me">
        <h3 style="text-align:center;">전화번호 중복 검사</h3><br>
		<input type="text" id="inputPhone" name="inputPhone"><br>
		<span id="check"></span><br><br>
		<input type="submit" id="submit" onclick="return false;" class="inputBtn" value="중복확인"/>
      </form>
</div>

<script>

	// 받아온 전화번호 입력되어있게 하기
	function inputValue(){
		 <% String userPhone = (String)request.getAttribute("userPhone"); %>
		 
		 var userPhone = document.getElementById('userPhone');
		 
		if(userPhone != 'null'){
			document.getElementById('inputPhone').value = opener.document.signup2.userPhone.value;
		}
	}
	//형식 넣기
	document.getElementById('inputPhone').onclick = function(){
		document.getElementById('check').innerText = '- 포함하여 입력하세요';
	}
	
	var regPhone = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{3,4})$/;
	
	document.getElementById('submit').blur = function(){
		if(document.getElementById('inputPhone').value == ''){
			document.getElementById('check').innerText = '전화번호를 입력해 주세요';
		} else {
			if(regPhone.test(document.getElementById('inputPhone').value)){
				document.getElementById('check').innerText = '';
			} else {
				document.getElementById('check').innerText = '- 포함하여 입력하세요';
				document.getElementById('inputPhone').focus();
			}
		}
	}
	
	
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>