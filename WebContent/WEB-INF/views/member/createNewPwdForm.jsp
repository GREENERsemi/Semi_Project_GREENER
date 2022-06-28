<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<form class ="confirmPwdQuestion" action="<%=request.getContextPath() %>/createNewPwdQuestion.me" method="post">	<!-- createNewPwd.me 서블릿 만들기 -->
		    	<p class="label">아이디</p>
		    	<input type="text" id="userId" name="user[id]" placeholder="아이디를 입력하세요">
		    	<p class="label">이메일</p>
		        <input type="email" id="userEmail" name="email" placeholder="이메일을 입력하세요">
		        <input type="button" value="이메일 인증" id="emailCheck">
		        <br><br>
		        <p class="label">이메일 인증번호</p>
		        <input type="text" id="validation" name="validation" placeholder="인증번호를 입력하세요">
		        <input type="button" value="인증 확인" onclick="valid();">

	    		
	        	<!-- <input type="submit" value="다음" onclick="toQuestion();" class="inputBtn"/> -->
	        	<input type="submit" id="next" value="다음" class="inputBtn"/>
	        </form>
	</div>
</div>
<script>
	var validNumber;

	
	$('#emailCheck').click(function(){
		var userId = $('#userId').val();
		var userEmail = $('#userEmail').val();

		
		$.ajax({
			url : 'newPwdEmailCheck.me',
			type : 'post',
			async : false,
			data : {id:userId, email:userEmail},
			success : function(data){
				console.log(data);
				validNumber = data;
				console.log(validNumber);
				alert('이메일로 발송된 인증번호를 입력해주세요.');
			},
			error: function(data){
				console.log(data);
			}
		});	
	});

	 function valid(){
		var userId = document.getElementById('userId');
		var userEmail = document.getElementById('userEmail');
		var validation = document.getElementById('validation').value;
		
		console.log("적은 번호 : " + validation)
		console.log("비교 번호 : " + validNumber);
		
		if(validNumber != validation){
			alert('인증번호가 일치하지 않습니다. 다시 적어주세요.');
/* 			validation = 0; */
			console.log("validation" + validation);
			$('#next').attr('disabled', true);
		} else{
			alert('이메일 인증이 완료되었습니다');
			$('#next').attr('disabled', false);
		}
	}
	 
	 
	 
	
	
<%-- 	function toQuestion(){
		location.href = '<%= request.getContextPath() %>/createNewPwdQuestion.me?validNumber='+validNumber;		
	} --%>
</script>



<%-- <script>
	$('#emailCheck').click(function(){
		var email = $('input[name=email]').val();
		location.href='<%= request.getContextPath()%>/createNewPwdForm2.me?email=' + email;
	});
</script> --%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>