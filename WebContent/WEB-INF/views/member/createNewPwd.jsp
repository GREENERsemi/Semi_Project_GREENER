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
	
	span{
		height : 20px;
	}
	
</style>

</head>
<body class="text-center"  style="background: AliceBlue; font-family: 'Noto Sans KR', sans-serif;">


<div class="col-md-12">
	<div class="input">
			<form class ="confirmPwdQuestion" action="<%=request.getContextPath() %>/updateNewPwd.me" method="post">	<!-- createNewPwd.me 서블릿 만들기 -->
		 		<p>새 비밀번호</p>
		 		<input type="hidden" name=user[id] value=<%=userId %>>
		    	<input type="password" id="newPwd1" name="user[newPwd]" placeholder="새 비밀번호를 입력하세요"> 
		    	<br>
		    	<span class="message" id="newPwdCheck1"></span>
				<br>
				<p>비밀번호 확인</p>
				<input type="password" id="newPwd2" name="confirm[newPwd]" placeholder="새 비밀번호를 확인해주세요">
				<br>
				<span class="message" id="newPwdCheck2"></span>
				<!-- 에이잭스 -->
		        <input type="submit" value="확인" onclick="checkPwd();" class="inputBtn"/>
	        </form>
	</div>
</div>
<script>
	var newPwd = document.getElementById('newPwd1');
	var newPwdCheck1 = document.getElementById('newPwdCheck1');
	
	var confirmPwd = document.getElementById('newPwd2');
	var newPwdCheck2 = document.getElementById('newPwdCheck2');

	newPwd1.onclick = function(){
		newPwdCheck1.innerText = '영문 소문자, 숫자, 특수문자를 포함하여 8~16자를 입력하세요';
	}	
	
	newPwd2.onblur = function(){
		if(newPwd2.value == ''){
			newPwdCheck2.innerText = '비밀번호를 확인해 주세요';
		} else {
	   		if(newPwd1.value != newPwd2.value){
	   			newPwdCheck2.innerText = '비밀번호가 일치하지 않습니다.';
	   		} else {
	   			newPwdCheck2.innerText = '';
	   		}
		}
	}	
	
	var regPwd = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*]).*$/;
	
	newPwd1.onblur = function(){
		if(newPwd1.value == ''){
			newPwdCheck1.innerText = '비밀번호를 입력해 주세요';
		} else {
			if(regPwd.test(newPwd1.value)){
				newPwdCheck1.innerText = '';
			} else {
				newPwdCheck1.innerText = '다시 입력해 주세요. 입력 가능한 특수문자는 !@#$%^&* 입니다';
				newPwd1.value = '';
			}
		}
	}
	
	

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>