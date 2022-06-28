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
	.list{
		font-size: 14px;
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
<body style="overflow-x: hidden; font-family: 'Noto Sans KR', sans-serif; background-color: HoneyDew; ">

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
<!-- 	          <li class="nav-item"> -->
<!-- 	          	<a class="nav-link" href="#">About</a> -->
<!-- 	          </li> -->
	          <li class="nav-item">
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
<!-- 				<p> 태그 살리면 버튼 크기가 작아지고 크기가 고정됨-->
<!-- 			<button class="btn btn-outline-dark btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample"> -->
<!-- 			login -->
<!-- 			</button> -->
	<!-- 				</p> -->
<!-- 			<div> -->
<!-- 			<div class="collapse collapse-horizontal" id="collapseWidthExample" style="background-color: LightSeaGreen"> -->
<!-- 			<div class="card card-body" style="width: 400px; height: 60px;"> -->
					    
<!-- 			<form> -->
<!-- 			<div class="input-group"> -->
<!-- 				<input type="text" id="id" placeholder="ID" aria-label="First name" class="form-control" style="height: 32px"> -->
<!-- 				<input type="password" id="password" placeholder="password" aria-label="Last name" class="form-control" style="height: 32px"> -->
<!-- 				<button type="submit" class="btn btn-dark btn-sm">Sign in</button> -->
<!-- 			</div> -->
<!-- 			</form> -->
			    
<!-- 			</div> -->
<!-- 			</div> -->
<!-- 			</div> -->
		  </ul>
		</div>
	  </ul>
	  </div>
	</nav>
<div class="col-lg-8 mx-auto p-3 py-md-5">
  <header class="d-flex align-items-center pb-3 mb-5 border-bottom">
    <a class="d-flex align-items-center text-dark text-decoration-none">
      <span class="fs-4">GREENER 이용 약관</span>
    </a>
  </header>

    <strong>greener 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.</strong>
    <br>
    <p class="fs-9 col-md-12">
		greener는 여러분이 네이버 서비스를 자유롭고 편리하게 이용할 수 있도록 최선을 다하고 있습니다. 
		다만, 여러분이 greener 서비스를 보다 안전하게 이용하고 greener 서비스에서 여러분과 타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가 필요합니다.
		여러분의 안전한 서비스 이용과 권리 보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 greener 서비스 이용이 제한될 수 있으므로, 이에 대한 확인 및 준수를 요청 드립니다.
	</p>
		<ul class="list">
			<li>
				회원 가입 시 이름, 생년월일, 휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다. 회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록 관리해 주세요. 
				자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다. 
				아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다.
			</li>
			<li> 
				관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다.
			</li>
			<li>
				자동화된 수단을 활용하는 등 greener 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, greener 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 greener 서비스 이용에 불편을 초래하고 더 나아가 greener의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다. 기타 제한되는 게시물에 관한 상세한 내용은 게시물 운영정책 및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다.
			</li>
		</ul>
	<p style="font-size: 15px;">
		greener는 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다.
	</p>
	
	<br>
	
    <strong>부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다.</strong>
    <br>
    <p class="fs-9 col-md-12">
		greener는 다양한 정보와 의견이 담긴 여러분의 콘텐츠를 소중히 다룰 것을 약속 드립니다만, 여러분이 게재한 게시물이 관련 법령, 본 약관, 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등에 위배되는 경우, 부득이 이를 비공개 또는 삭제 처리하거나 게재를 거부할 수 있습니다. 다만, 이것이 greener가 모든 콘텐츠를 검토할 의무가 있다는 것을 의미하지는 않습니다.
	</p>
	<p style="font-size: 15px;">
		또한 여러분이 관련 법령, 본 약관, 계정 및 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등을 준수하지 않을 경우, greener는 여러분의 관련 행위 내용을 확인할 수 있으며, 그 확인 결과에 따라 greener 서비스 이용에 대한 주의를 당부하거나, greener 서비스 이용을 일부 또는 전부, 일시 또는 영구히 정지시키는 등 그 이용을 제한할 수 있습니다. 한편, 이러한 이용 제한에도 불구하고 더 이상 greener 서비스 이용계약의 온전한 유지를 기대하기 어려운 경우엔 부득이 여러분과의 이용계약을 해지할 수 있습니다.
	</p>
	
	<br>
	
    <strong>언제든지 greener 서비스 이용계약을 해지하실 수 있습니다.</strong>
    <br>
    <p class="fs-9 col-md-12">
		greener에게는 참 안타까운 일입니다만, 회원은 언제든지 greener 서비스 이용계약 해지를 신청하여 회원에서 탈퇴할 수 있으며, 이 경우 greener는 관련 법령 등이 정하는 바에 따라 이를 지체 없이 처리하겠습니다.
	</p>
	<p style="font-size: 15px;">
		greener 서비스 이용계약이 해지되면, 관련 법령 및 개인정보처리방침에 따라 greener가 해당 회원의 정보를 보유할 수 있는 경우를 제외하고, 해당 회원 계정에 부속된 게시물 일체를 포함한 회원의 모든 데이터는 소멸됨과 동시에 복구할 수 없게 됩니다. 
	</p>

	<br>

    <strong>greener의 잘못은 박신우가 책임집니다.</strong>
    <br>
    <p class="fs-9 col-md-12">
    	greener는 여러분이 greener 서비스를 이용함에 있어 greener의 고의 또는 과실로 인하여 손해를 입게 될 경우 관련 법령에 따라 여러분의 손해를 배상합니다. 다만, 천재지변 또는 이에 준하는 불가항력으로 인하여 greener가 서비스를 제공할 수 없거나 이용자의 고의 또는 과실로 인하여 서비스를 이용할 수 없어 발생한 손해에 대해서 greener는 책임을 부담하지 않습니다.
	</p>
	<p style="font-size: 15px;">
		그리고 greener가 손해배상책임을 부담하는 경우에도 통상적으로 예견이 불가능하거나 특별한 사정으로 인한 특별 손해 또는 간접 손해, 기타 징벌적 손해에 대해서는 관련 법령에 특별한 규정이 없는 한 책임을 부담하지 않습니다.
	</p>
	<p style="font-size: 15px;">
		한편, greener 서비스를 매개로 한 여러분과 다른 회원 간 또는 여러분과 비회원 간의 의견 교환, 거래 등에서 발생한 손해나 여러분이 서비스 상에 게재된 타인의 게시물 등의 콘텐츠를 신뢰함으로써 발생한 손해에 대해서도 greener는 특별한 사정이 없는 한 이에 대해 책임을 부담하지 않습니다.
	</p>
</div>
<br><br>

	<hr>
  <!-- FOOTER -->
  <footer class="container" style="font-size: 13px; text-align: center;">
  <p>
  	<a href="<%= request.getContextPath() %>/Terms.me" class="afooter">이용약관</a><a> | </a><a href="<%= request.getContextPath() %>/privacy_policy.me" class="afooter">개인정보처리방침</a>
  </p>
    <div class="moveTop">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
  		<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
	</svg>
	<a href="#" style="text-decoration-line : none; color: white;">Top</a>
    </div>
    <p>&copy; Greener 2022</p>
  </footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>