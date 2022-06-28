<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kalam&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	/*비밀번호 확인*/
	#checkPw{
      color: #FF0000;
	}
	
	button{
		position: relative; left: -10px; top: -22px; 
	}
		
	.container {
	  display: -webkit-flex;
	  display: flex;
	  height: 100%; 
	  text-align: center;
	}
	
	#logbox {
	  padding: 10px;
	  margin: 50px auto;
	  width: 600px;
	  background-color: #D2F3CD;
	  -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	  -moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	}
	
	h1, input {
	  font-family: "Open Sans", Helvetica, sans-serif;
	   background: : Honeydew;
	}
	
	.input {
	  width: 83%;
	  height: 45px;
	  display: block;
	  margin: 0 auto 15px;
	  padding: 0 15px;
	  border: none;
	  border-bottom: 2px solid #ebebeb;
	  border-radius: 10px 10px 10px 10px;
	}
	.input:focus {
	  outline: none;
	  border-bottom-color: Honeydew !important;
	}
	.input:hover {
	  border-bottom-color: #dcdcdc;
	}
	.input:invalid {
	  box-shadow: none;
	}
	
	.pass:-webkit-autofill {
	  -webkit-box-shadow: 0 0 0 1000px white inset;
	}
	
	.inputButton {
	  position: relative;
	  width: 85%;
	  height: 50px;
	  display: block;
	  margin: 30px auto 30px;
	  color: white;
	  background-color: lightseagreen;
	  border: none;
	  -webkit-box-shadow: 0 5px 0 #2CADAD;
	  -moz-box-shadow: 0 5px 0 #2CADAD;
	  box-shadow: 0 5px 0 #2CADAD;
	}
	.inputButton:hover {
	  top: 2px;
	  -webkit-box-shadow: 0 3px 0 #2CADAD;
	  -moz-box-shadow: 0 3px 0 #2CADAD;
	  box-shadow: 0 3px 0 #2CADAD;
	}
	.inputButton:active {
	  top: 5px;
	  box-shadow: none;
	}
	.inputButton:focus {
	  outline: none;
	}
	
	/* placeholder, label */
	::placeholder{
		font-size: 15px; font-style: italic;
	}
	.label{
		position: relative; top: -25px; right: -23px; 
	}
 	.label{ 
 		text-align: right; 
 	} 
	
	/* 형식제한 span */
	td>span{
		font-size: small;
		position: relative; top: -40px;	
	}
	
</style>
</head>
<body>

<header>
<%@ include file = "../common/Navbar.jsp" %>
</header>

<main>
 <div class="container" style="margin-top: 7%;">
    <div class="col-md-12">
    <div id="logbox">
      <form id="signup" name="signup2" method="post" onsubmit="return checkForm();" action="<%= request.getContextPath() %>/insert.me" >
      <br>
	  <h2>회원가입</h2>
	  <br>
      <table>
      	<tr>
      		<th class="label">아이디</th>
	        <td width="360px">
	        	<input id="userId" name="user[id]" type="text" placeholder="ID" required class="input pass"/><br>
	        	<span id="idCheck"></span>
	        </td>
	        <td>
	        	<button type="button" id="idDCheck" name="button" class="btn btn-light">중복 확인</button>
	        </td>
	    </tr>
	    <tr>
	    	<th class="label">비밀번호</th>
	    	<td>
	        	<input id="userPwd1" name="user[password]" type="password" placeholder="password" required class="input pass"/><br>
	        	<span id="pwdCheck1"></span>
	    	</td>
	    </tr>
	    <tr>
	    	<th class="label">비밀번호 확인</th>
	    	<td>
	        	<input id="userPwd2" name="user[password2]" onkeyup='keyup1()' type="password" placeholder="confirm password" required class="input pass"/><br>
	        	<span id="pwdCheck2"></span>
	    	</td>
	    </tr>
	    <!-- 비밀번호 추가 질문  -->
	    <tr>
	    	<th class="label">비밀번호 질문</th>
	    	<td>
	        	<select id="pwdQuestion" name="pwd[question]" required>
	        		<option value="1">어린 시절 가장 친했던 친구의 이름은?</option>
	        		<option value="2">가장 좋아하는 색은?</option>
	        		<option value="3">롤모델의 이름은?</option>
	        		<option value="4">가장 여행가고 싶은 곳은?</option>
	        		<option value="5">당신의 취미는?</option>
	        		<option value="6">시간여행을 한다면 만나고 싶은 사람은?</option>
	        		<option value="7">사계절 중 가장 좋아하는 계절은?</option>
	        	</select>
	        	<input type="text" id="pwdConfirm" name ="pwd[confirm]" placeholder="password confirm" class="input pass" required>
	        	<span id="pwdConfirmCheck"></span>
	    	</td>
	    </tr>
	    <tr>
		    <th class="label">이름</th>
		    <td>
		        <input id="userName" name="user[name]" type="text" placeholder="name" required class="input pass"/><br>
		        <span id="nameCheck"></span>
		    </td>
	    </tr>
		<tr>
			<th class="label">닉네임</th>
			<td>
		        <input id="userNickname" name="user[nickname]" type="text" placeholder="nickname" required class="input pass"/><br>
	        	<span id="nicknameCheck"></span>
		    </td>
	    </tr>
	    <tr>
		    <th class="label">이메일</th>
		    <td>
		        <input id="userEmail" name="userEmail" type="text" placeholder="e-mail" required class="input pass"/><br>
	        	<span id="emailCheck"></span>
		    </td>
	        <td>
	        	<button type="button" id="emailDCheck" disabled name="emailDCheck" class="btn btn-light">이메일 인증</button>
	        </td>
	    </tr>
	    <tr>
		    <th class="label">인증 번호</th>
		    <td>
		        <input id="Auth" name="Auth" type="text" placeholder="authentication number" required class="input pass"/><br>
	        	<span id="AuthArea"></span>
		    </td>
	        <td>
	        	<button type="button" id="AuthBtn" name="AuthBtn" class="btn btn-light">인증 확인</button>
	        </td>
	    </tr>
	    <tr>
		    <th class="label">전화번호</th>
		    <td id="phoneTd">
		        <input id="userPhone" name="user[phone]" type="text" placeholder="phone" required class="input pass"/><br>
	        	<span id="phoneCheck"></span>
			</td>
<!-- 	        <td> -->
<!-- 	        	<button type="button" id="phoneDCheck" name="button" class="btn btn-light">중복 확인</button> -->
<!-- 	        </td> -->
		</tr>
	    <tr>
	    	<td class="label">(선택)생년월일</td>
	    	<td>
	        	<input id="userBirthDate" name="user[birthDate]" type="text" placeholder="birth date" class="input pass"/><br>
	        	<span id="birthDate"></span>
	    	</td>
	    </tr>
        </table>
	        <input type="submit" value="가입하기" class="inputButton" style="border-radius: 10px 10px 10px 10px"/>
        <div class="text-center">
                            이미 회원이시면 로그인 해주세요! <a href='<%= request.getContextPath() %>/login.me' id="login_id">login</a>
        </div>
      </form>
    </div>
   </div>
  </div>
</main>

<%@ include file = "../common/FooterTopBtn.jsp" %>  
  
<script>

	// 각 요소 변수 지정
	var userId = document.getElementById('userId');
	var idCheck = document.getElementById('idCheck');
	
	var userPwd1 = document.getElementById('userPwd1');
	var pwdCheck1 = document.getElementById("pwdCheck1");

	var userPwd2 = document.getElementById('userPwd2');
	var pwdCheck2 = document.getElementById("pwdCheck2");
	
	var userName = document.getElementById("userName");
	var nameCheck = document.getElementById("nameCheck");
	
	var userNickname = document.getElementById("userNickname");
	var nicknameCheck = document.getElementById("nicknameCheck");

	var userEmail = document.getElementById('userEmail');
	var emailCheck = document.getElementById('emailCheck');
	
	var userPhone = document.getElementById('userPhone');
	var phoneCheck = document.getElementById("phoneCheck");

	// 클릭 이벤트로 각 형식 멘트
	userId.onclick = function(){
		idCheck.innerText = '영문 소문자, 숫자를 포함하여 5~20자를 입력하세요';
	}
	
	userPwd1.onclick = function(){
		pwdCheck1.innerText = '영문 소문자, 숫자, 특수문자를 포함하여 8~16자를 입력하세요';
	}
	userEmail.onclick = function(){
		emailCheck.innerText = '@ 포함하여 입력하세요';
	}
	userPhone.onclick = function(){
		phoneCheck.innerText = '- 포함하여 입력하세요';
	}
	
	// 필수 입력 요소 블러 이벤트
	userPwd2.onblur = function(){
			if(userPwd2.value == ''){
				pwdCheck2.innerText = '비밀번호를 확인해 주세요';
			} else {
		   		if(userPwd1.value != userPwd2.value){
		   			pwdCheck2.innerText = '비밀번호가 일치하지 않습니다.';
		   		} else {
		   			pwdCheck2.innerText = '';
		   		}
			}
	}
	userName.onblur = function(){
			if(userName.value == ''){
				nameCheck.innerText = '이름을 입력해 주세요';
			} else {
				nameCheck.innerText = '';
			}
	}
	userNickname.onblur = function(){
			if(userNickname.value == ''){
				nicknameCheck.innerText = '닉네임을 입력해 주세요';
			} else {
				nicknameCheck.innerText = '';
			}
	}

	// 블러 이벤트로 정규표현식 테스트 돌리기
	var regId = /^[0-9a-z]{5,20}$/;
	var regPwd = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*]).*$/;
	var regEmail =  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	var regPhone = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{3,4})$/;
	var regBirth = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;

	var birthDate = document.getElementById('birthDate');
	var userBirthDate = document.getElementById('userBirthDate');
	
	//05.16추가
	userBirthDate.onkeydown = function(){
		birthDate.innerText = '주민등록번호 앞 6자리로 입력해 주세요(ex. 801020)';
	}
	userBirthDate.onkeyup = function(){
		if(userBirthDate.value != ''){
			if(regBirth.test(userBirthDate.value)){
				birthDate.innerText = '';
			} else {
				birthDate.innerText = '주민등록번호 앞 6자리로 입력해 주세요(ex. 801020)';
			}
		}else{
			birthDate.innerText = '';
		}
	}
	
	userId.onblur = function(){
		if(userId.value == ''){
			idCheck.innerText = '아이디를 입력해 주세요';
		} else {
			if(regId.test(userId.value)){
				idCheck.innerText = '';
			} else {
				idCheck.innerText = '아이디 형식을 확인해 주세요';
			}
		}
	}
	
	userPwd1.onblur = function(){
			if(userPwd1.value == ''){
				pwdCheck1.innerText = '비밀번호를 입력해 주세요';
			} else {
				if(regPwd.test(userPwd1.value)){
					pwdCheck1.innerText = '';
				} else {
					pwdCheck1.innerText = '비밀번호 형식을 확인해 주세요. 입력 가능한 특수문자는 !@#$%^&* 입니다';
					userPwd1.value = '';	// 잘못 입력한 비밀번호 삭제
				}
			}
	}
	
	userEmail.onblur = function(){
			if(userEmail.value == ''){
				emailCheck.innerText = '이메일을 입력해 주세요';
			} else {
				if(regEmail.test(userEmail.value)){
					emailCheck.innerText = '';
					
					$.ajax({
						 url: 'emailDCheck.me',
						 data: {userEmail: $('#userEmail').val()},
						 success: function(data){
							 console.log(data);
							 if(data == "이미 존재하는 이메일입니다"){
								 $("#emailDCheck").attr("disabled",true);
							 }else{
								 $("#emailDCheck").attr("disabled",false);
							 }
							 $('#emailCheck').html('');
							 $('#emailCheck').html(data);
						 },
						 error: function(data){
							 console.log(data);
							 alert('오류입니다. 잠시 후 다시 시도해 주세요.');
						 }
					  }); 
					
				} else {
					emailCheck.innerText = '이메일 형식을 확인해 주세요';
				}
			}
	}
	
	userPhone.onblur = function(){
			if(userPhone.value == ''){
				phoneCheck.innerText = '전화번호를 입력해 주세요';
			} else {
				if(regPhone.test(userPhone.value)){
					phoneCheck.innerText = '';
					
					$.ajax({
						 url: 'dCheckPhone.me',
						 data: {userPhone: $('#userPhone').val()},
						 success: function(data){
							 console.log(data);
							 $('#phoneCheck').html('');
							 $('#phoneCheck').html(data);
						 },
						 error: function(data){
							 console.log(data);
							 alert('오류입니다. 잠시 후 다시 시도해 주세요.');
						 }
					  });
					
				} else {
					phoneCheck.innerText = '전화번호 형식을 확인해 주세요';
				}
			}
	}
	
	// 아이디 중복 확인 버튼 클릭 시 팝업창
	document.getElementById('idDCheck').onclick = function(){
		window.open('DCheckIdForm.me', 'DuplicateCheckIdForm', 'width=350, height=300');
	}
	
	// 비밀번호와 비밀번호 확인 일치하는지 검사
	function keyup1() {
   		if(userPwd1.value != userPwd2.value){
   			pwdCheck2.innerText = '비밀번호가 일치하지 않습니다.';
//    		alert('비밀번호가 일치하지 않습니다');
   		} else {
   			pwdCheck2.innerText = '';
   		}
   }
	
	// 전화번호 중복 확인 버튼 클릭 시 팝업
// 	document.getElementById('phoneDCheck').onclick = function(){
// 		window.open('DCheckPhoneForm.me', 'DuplicateCheckPhoneForm', 'width=350, height=300');
// 	}	
	
	// 이름 제한
	userName.onclick = function(){
      nameCheck.innerText = '한글만 입력해 주세요';
   }
   // 닉네임 제한
   userNickname.onclick = function(){
      nicknameCheck.innerText = '한글, 영어, 숫자만 입력해 주세요';
   }
   // 이름, 닉네임 정규표현식
   var regName = /^[가-힣]+$/;
   var regNickname =  /^[가-힣|a-z|A-Z|0-9]+$/;
   
   userName.onblur = function(){
      if(userName.value == ''){
         nameCheck.innerText = '이름을 입력해 주세요';
      } else{
         if(regName.test(userName.value)){
            nameCheck.innerText = '';
         } else{
            nameCheck.innerText = '이름은 한글로 입력해주세요';
         }
      }
   }
   
   userNickname.onblur = function(){
      if(userNickname.value == ''){
         nicknameCheck.innerText = '닉네임을 입력해 주세요';
      } else{
         if(regNickname.test(userNickname.value)){
            nicknameCheck.innerText = '';
		      $.ajax({
				  url: 'nicknameCheck.me',
				  data: {userNickname: $('#userNickname').val()},
				  success: function(data){
					  console.log(data);
					  $('#nicknameCheck').html('');
					  $('#nicknameCheck').html(data);
				  },
				  error: function(data){
					  console.log(data);
					  alert('오류입니다. 잠시 후 다시 시도해 주세요.');
				  }
			   });
         } else{
            nicknameCheck.innerText = '닉네임 형식(한글,영문,숫자)을 확인해 주세요';
         }
      }
   }
	
   // 05.16 추가
   function checkForm(){
	   var span = document.getElementByTagName('span');
	   
	   if(span.value != ''){
		   alert('필수 항목을 입력하세요');
		   return false;
	   }
	   
	   return true;
   }
   
   //05.20추가     전화번호 중복 검사
//    $('#userPhone').blur(function(){
// 	   if($('#userPhone').val() != ''){
// 		  $.ajax({
// 			 url: 'dCheckPhone.me',
// 			 data: {userPhone: $('#userPhone').val()},
// 			 success: function(data){
// 				 console.log(data);
// 				 $('#phoneCheck').html('');
// 				 $('#phoneCheck').html(data);
// 			 },
// 			 error: function(data){
// 				 console.log(data);
// 				 alert('오류입니다. 잠시 후 다시 시도해 주세요.');
// 			 }
// 		  });
// 	   }
//    });
   
   //05.21추가     닉네임 중복검사
//    $('#userNickname').blur(function(){
// 	   $.ajax({
// 		  url: 'nicknameCheck.me',
// 		  data: {userNickname: $('#userNickname').val()},
// 		  success: function(data){
// 			  console.log(data);
// 			  $('#nicknameCheck').html('');
// 			  $('#nicknameCheck').html(data);
// 		  },
// 		  error: function(data){
// 			  console.log(data);
// 			  alert('오류입니다. 잠시 후 다시 시도해 주세요.');
// 		  }
// 	   });
//    });
   
   //05.21추가 이메일 중복 검사
//    $('#userEmail').keyup(function(){
// 			if($('#userEmail').val() != ''){
// 			  $.ajax({
// 				 url: 'emailDCheck.me',
// 				 data: {userEmail: $('#userEmail').val()},
// 				 success: function(data){
// 					 console.log(data);
// 					 $('#emailCheck').html('');
// 					 $('#emailCheck').html(data);
// 				 },
// 				 error: function(data){
// 					 console.log(data);
// 					 alert('오류입니다. 잠시 후 다시 시도해 주세요.');
// 				 }
// 			  }); 
// 		   }
//    });
   
   //05.21추가 이메일 인증
   $('#emailDCheck').click(function(){
	   if($('#userEmail').val() == '' && $('#emailCheck').val() == ''){
			alert('이메일을 입력해 주세요');
			return false;
	   } else if($('#emailCheck').val() == '이미 존재하는 이메일입니다') {
		   console.log($('#emailCheck').val());
		   alert('사용 가능한 이메일을 입력해 주세요');
		   return false;
	   } else {
		   alert('이메일로 전송된 인증번호를 입력해 주세요');
		   var email = $('input[name=userEmail]').val();
		   console.log(email);
		  $.ajax({
			 url: 'checkEmail.me',
			 data: {email: email},
			 success: function(data){
				 console.log(data);
				 $('#AuthBtn').click(function(){
					 if($('#Auth').val() == data){
						 $('#AuthArea').html("인증에 성공하였습니다");
						 $('#Auth').blur(function(){
							$('#AuthArea').html(''); 
						 });
					 } else {
						 $('#AuthArea').html("인증에 실패하였습니다");
					 }
				 })
			 },
			 error: function(data){
				 console.log(data);
				 alert('오류입니다. 잠시 후 다시 시도해 주세요.');
			 }
		  });
	   }
   });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>