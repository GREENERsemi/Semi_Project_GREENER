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
      margin-top: 35px;
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
<body class="text-center"  onload="inputValue();" style="background: AliceBlue; font-family: 'Noto Sans KR', sans-serif;">
    
<div class="col-md-12">
      <form id="dCheckIdForm" action="<%= request.getContextPath() %>/dCheckId.me">
        <h3 style="text-align:center;">아이디 중복 검사</h3><br>
      <input type="text" id="inputId" name="inputId"><br>
      <span id="idCheck" style="width:50px"></span><br>
      <input type="button" class="inputBtn" onclick="useId()" value="중복확인"/>
      </form>
</div>
<script>

		function inputValue(){
		   
		<% String userid = (String)request.getAttribute("userid"); %>
		   
		   var userid = document.getElementById("userid");
		   
		   if(userid != 'null'){
		      document.getElementById("inputId").value =  opener.document.signup2.userId.value;
		   }
		} 
   
   function useId(){
	    var inputId = document.getElementById("inputId");
		<% String userId = (String)request.getAttribute("userid"); %>
		var regId = /^[0-9a-z]{5,20}$/;
	    var form = document.getElementById("dCheckIdForm");

		if(!regId.test(inputId.value) && inputId.value.trim() != ''){
		   inputId.value="";
		   inputId.focus();
		   document.getElementById("idCheck").innerHTML = '영문 소문자, 숫자 포함하여 5~20자'; 
		} else if(inputId.value.trim() == ''){
		   document.getElementById("idCheck").innerHTML = '필수 입력 항목입니다.';
		   inputId.focus();
		} else {
		      form.submit();
		}
   }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>