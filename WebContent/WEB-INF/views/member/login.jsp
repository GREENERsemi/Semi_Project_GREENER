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

    table{
       font-size: 20px;
       border-spacing: 12px;
       border-collapse: separate;
    }

    ::selection {
	  background-color: #b5e2e7;
	}
	::-moz-selection {
	  background-color: #8ac7d8;
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
	  width: 340px;
	  background-color: #D2F3CD;
	  -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	  -moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	}
	.input {
	  width: 75%;
	  height: 50px;
	  display: block;
	  margin: 0 auto 15px;
	  padding: 0 15px;
	  border: none;
	  border-bottom: 2px solid #ebebeb;
	}
	.input:focus {
	  outline: none;
	  border-bottom-color: #3CC !important;
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
	  background-color: #3CC;
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
	a[class="search"]{
		text-decoration-line: none; color: black;
	}
	
</style>
</head>
<body style="background: Honeydew; overflow-x: hidden; font-family: 'Noto Sans KR', sans-serif;">
<header>
<%@ include file = "../common/Navbar.jsp" %>
</header>

<br><br><br><br><br><br>

<!-- 로그인폼 -->
<div class="col-md-12">
    <div id="logbox">
      <form id="login" method="post" action="<%= request.getContextPath() %>/login.do">
        <h3 style="text-align:center;">로그인</h3><br>
        <input name="userId" type="text" placeholder="아이디를 입력하세요" required= "required" class="input pass"/>
        <input name="userPwd" type="password" placeholder="비밀번호를 입력하세요" required="required" class="input pass"/>
        <input type="submit" value="로그인" class="inputButton"/>
        <div class="text-center">
                 <a href="#" id="searchId">아이디 찾기</a> - <a href="#" id="createNewPwd">새 비밀번호 생성하기</a>
        </div>
      </form>
    </div>
    </div>
</body>


<br><br><br><br><br><br>

<%@ include file = "../common/FooterTopBtn.jsp" %>

<script>
		document.getElementById('searchId').onclick = function(){
			window.open('searchIdForm.me', '아이디 찾기', 'width=400, height=370');	//window.open();  새로운 팝업창 열어줌
		}

// 		document.getElementById('searchPwd').onclick = function(){
// 			window.open('searchPwdForm.me', '비밀번호 찾기', 'width=400, height=370');
// 		}
		
		document.getElementById('createNewPwd').onclick = function(){
	         window.open('createNewPwdForm.me', '새 비밀번호 생성하기', 'width=400, height=370'); // createPwdForm.me 서블릿 만들기
	    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>