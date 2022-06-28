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
	body{
		background : Honeydew;
	}
	main{
		padding-top: 50px;
		background : Honeydew;
	}
	div{
		margin-right : auto;
		margin-left : auto;
	}
	p{
		width : 1000px;
		margin : auto;
	}
	
	/* footer */

    .moveTop{
       padding-top: 3px;
       padding-left: 4px;
       position: fixed;
       bottom: 1rem;
       right: 1rem;
       width: 3rem;
       height: 2rem;
       background: LightSeaGreen;
       color: white;
       border-radius: 100px 100px 100px 100px
    }
    .afooter{
       text-decoration-line : none; color: black;
    }
 	body::-webkit-scrollbar {
	    width: 8px;  /* 스크롤바의 너비 */
	}
	
	body::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
	    background: SeaGreen; /* 스크롤바의 색상 */
	    
	    border-radius: 10px;
	}
	
	body::-webkit-scrollbar-track {
	    background: rgba(33, 122, 244, .1);  /*스크롤바 뒷 배경 색상*/
	}
</style>

</head>
<body style="background: Honeydew; overflow-x: hidden; font-family: 'Noto Sans KR', sans-serif;">
	<nav id="Top" class="navbar navbar-expand-lg navbar-light" style="background-color: LightSeaGreen">
     	<div class="container-fluid">
   	    <strong class="navbar-brand" style="color: white; font-family: 'Kalam', cursive; font-size: 25px;">Greener</strong>
      
        <ul class="nav justify-content-end">
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
             <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath() %>" style="color: white">Home</a>
             </li>
             <li>
	          	<a class="nav-link" href="#">Plogging</a>
	          </li>
	          <li class="nav-item">
	          	<a class="nav-link" href="#">Recipe</a>
	          </li>
	          <li class="nav-item">
	          	<a class="nav-link" href="#">News</a>
	          </li>
	          <li class="nav-item">
	          	<a class="nav-link" href="#">Club</a>
	          </li>
             <li class="nav-item">
                <a class="nav-link" href="#">login</a>
             </li>
             <li class="nav-item">
                <a class="nav-link" href="#">Sign Up</a>
             </li>
         <div>
         <div class="collapse collapse-horizontal" id="collapseWidthExample" style="background-color: LightSeaGreen">
         <div class="card card-body" style="width: 400px; height: 60px;"> 
         </div>
         </div>
         </div>
        </ul>
      </div>
     </ul>
     </div>
   </nav>
   
   <main>
<div class="col-lg-8 mx-auto p-3 py-md-5">
  <header class="d-flex align-items-center pb-3 mb-5 border-bottom">
    <a class="d-flex align-items-center text-dark text-decoration-none">
      <span class="fs-4">개인정보처리방침</span>
    </a>
  </header>
   	<div>
<!--    		<pre><h2>개인정보처리방침</h2></pre> -->
<!--    		<hr> -->
   		<p class="fs-9 col-md-12">
		greener는 이용자의 개인정보 보호를 최우선의 가치로 삼으며 개인정보 보호와 관련한 국내외 모든 법령을 성실히 준수합니다. 또한 회사의 개인정보 보호 정책을 이용자에게 보다 알기 쉽고 상세하게 설명하기 위해 노력하고 있습니다.
		<br>
		greener의 '개인정보 처리방침'은 greener 서비스를 이용하는 모든 이용자에게 적용됩니다.
		<br>
		<br>
		<b>수집하는 개인정보</b>
		<br>
		greener가 제공하는 대부분의 서비스들은 회원가입을 하지 않고서도 이용이 가능합니다.
		<br>
		회원가입을 하시는 경우, 로그인하여 개인화 서비스를 비롯한 다양한 회원제 기반의 서비스들을 이용하실 수 있습니다.
		<br>
		greener는 회원가입 과정에서 서비스 이용을 위해 필요한 최소한의 정보만을 수집 및 활용합니다.
		<br>
		<br>
		<strong>개인정보 추가 수집 내역 보기</strong>
		<b>개인정보 수집 방법</b>
		<br>
		greener는 홈페이지 등에서 이용자로부터 직접 입력 받는 방식으로 개인정보를 수집합니다.
		<br>
		개인정보의 수집이 발생하는 경우(생성정보 등 일부 예외를 제외하고) greener는 이용자로부터 ‘개인정보 수집 및 이용에 대한 동의’를 얻으며 그 동의 범위 내에서만 개인정보를 이용합니다.
		<br>
		<br>
		<b>수집한 개인정보의 이용</b>
		<br>
		greener는 회원님께 사전에 동의 받은 이용 목적과 달리 개인정보를 활용하지 않습니다.
		<br>
		수집한 회원의 개인정보를 회원관리, greener 서비스의 제공 · 향상, 신규 서비스의 개발 및 안전한 인터넷 이용환경 구축 등의 목적에 한해 이용합니다.
		<br>
		<br>
		<b>개인정보의 제공 및 위탁</b>
		<br>
		greener는 원칙적으로 이용자의 사전 동의 없이 개인정보를 외부에 제공하지 않습니다.
		<br>
		관계 법령에 의해 예외적으로 제3자에게 제공 의무가 발생하는 경우 해당 법령을 엄격히 해석하여 준수하며 이용자의 프라이버시 침해가 최소화되도록 노력합니다. 이에 관한 이용자의 문의에 성실히 답변할 것입니다.
		<br>
		<br>
		<b>법률에 의한 개인정보 제공 사례</b>
		<br>
		greener는 서비스 제공을 위하여 필요한 업무 중 일부를 외부 업체에 위탁하고 있으며, 위탁 받은 업체가 개인정보를 안전하게 처리하도록 필요한 사항을 규정하고 관리/감독을 하고 있습니다.
		<br>
		<br>
		<strong>개인정보의 제공 및 위탁</strong>
		<b>개인정보의 파기</b>
		<br>
		개인정보의 수집 및 이용 목적이 달성 되면, 수집한 개인정보를 신속하고 안전한 방법으로 파기합니다.
		<br>
		'개인정보 유효기간제'에 따라 원칙적으로 1년간 서비스를 이용하지 않은 회원의 개인정보는 별도 분리하여 보관 · 관리합니다.
		<br>
		<br>
		<b>이용자 및 법정 대리인의 권리와 행사 방법</b>
		<br>
		greener는 정보통신망법 및 개인정보 보호법 등 관계 법령에서 규정하고 있는 이용자의 권리를 충실히 보장합니다.
		<br>
		이용자는 언제든지 자신의 개인정보 및 이용 현황을 상시 확인할 수 있으며, 동의 철회 및 정정 요청을 할 수 있습니다. 만 14세 미만 아동에 대한 법정 대리인의 권리 또한 법령에 따라 보장됩니다.
		<br>
		<br>
		<b>개인정보 보호를 위한 greener의 노력</b>
		<br>
		greener는 정보통신망법 및 개인정보 보호법에서 요구하는 수준 이상으로 개인정보를 안전하게 관리하고 있습니다.
		<br>
		<br>
		<strong>개인정보 처리방침 변경 시 고지 의무</strong>
		<br>
		개인정보 처리방침의 변경이 있는 경우 사전에 홈페이지 공지사항을 통해 이용자에게 고지합니다.
		<br>
		<br>
		</p>
   	</div>
   	</div>
   </main>
   <br>
   <hr>
   <footer class="container" style="font-size: 13px; text-align: center;">
  <p>
  	<a href="<%= request.getContextPath() %>/Terms.me" class="afooter">이용약관</a><a> | </a><a href="<%= request.getContextPath() %>/privacy_policy.me" class="afooter">개인정보처리방침</a>
<!--      <a> | </a><a href="#" class="afooter">고객센터</a><a> | </a><a href="#" class="afooter">사이트이용수칙</a>  -->
  </p>
    <div class="moveTop">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
    	<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
    </svg>
    <a href="#" style="text-decoration-line : none; color: white;">Top</a>
    </div>
    <br>
    <p>&copy; Greener 2022</p>
    <br>
  </footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>