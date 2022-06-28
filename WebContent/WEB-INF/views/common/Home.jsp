<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kalam&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	
		/*메인 페이지 사진*/
	  	img{ 
	  		width: 60%; height: 500px; margin-top: 50px; margin-left: 20%; 
	  	}
	  	  
	 	/*게시판 안내*/
	 	table{
	 		font-size: 20px;
	 		border-spacing: 12px;
	 		border-collapse: separate;
	 	}
		/*스크롤 바*/
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
		.nav-link{
			font-size: 20px;
		}	
		
		/* Top 버튼 */
	    .moveTop{
	       padding-top: 3px; padding-left: 4px;
	       position: fixed; text-align: left;
	       bottom: 1rem; right: 1.5rem;
	       width: 3.2rem; height: 2rem;
	       background: #53c687; color: white;
	       border-radius: 100px 100px 100px 100px
	    }
	    /* footer */
	 	.afooter{
	 		text-decoration-line : none; color: black;
	 	}
	 	
		.nav-link{
			font-size: 20px;
		}
		
		/* 내비바 로그아웃 버튼*/
		#logoutBtn{
			position: relative; bottom: -8px;
		}
</style>
</head>
<body style="background: Honeydew; overflow-x: hidden; font-family: 'Noto Sans KR', sans-serif;">

   <nav id="Top" class="navbar navbar-expand-lg navbar-light" style="background-color: #53c687">
     <div class="container-fluid">
     <strong class="navbar-brand" style="color: white; font-family: 'Kalam', cursive; font-size: 27px;">Greener</strong>
      
      <!-- 반응형 햄버거 -->
     <ul class="nav justify-content-end">
       <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
       </button>
        <div class="collapse navbar-collapse" id="navbarNav">
        
         <ul class="navbar-nav">
             <li class="nav-item">
                <strong>
                	<a class="nav-link" href="<%= request.getContextPath() %>" style="color: white; font-family: 'Kalam', cursive;">Home &nbsp;</a>
             	</strong>
             </li>
             <li class="nav-item">
                <strong>
                   <a class="nav-link" href="<%= request.getContextPath() %>/list.no" style="font-family: 'Kalam', cursive;">Notice &nbsp;</a>
                </strong>
             </li>
             <% if(loginUser != null){ %>
	            <% if(loginUser.getNickName().equals("관리자")){ %>
	             <li class="nav-item">
	                <strong>
	             		<a class="nav-link" href="<%= request.getContextPath()%>/reportlist.bo" style="font-family: 'Kalam', cursive; color: orange;">Report</a>
					</strong>
	             </li>
	             <% } %>
             <% } %>             
             <li class="nav-item">
             	<strong>
	          		<a class="nav-link" href="<%= request.getContextPath() %>/chalList.bo" style="font-family: 'Kalam', cursive;">Challenge &nbsp;</a>
	          	</strong>
	          </li>
	          <li class="nav-item">
		          <strong>
		          	<a class="nav-link" href="<%= request.getContextPath() %>/recList.bo" style="font-family: 'Kalam', cursive;">Recipe &nbsp;</a>
		          </strong>
	          </li>
	          <li class="nav-item">
		          <strong>
		          	<a class="nav-link" href="<%= request.getContextPath() %>/newsBoard.me" style="font-family: 'Kalam', cursive;">News &nbsp;</a>
		          </strong>
	          </li>
	          <li class="nav-item">
	          	<strong>
	          		<a class="nav-link" id="club" style="font-family: 'Kalam', cursive;">Club &nbsp;</a>
	          	</strong>
	          </li>
	         <% if(loginUser == null){ %>
             <li class="nav-item">
             	<strong>
                	<a class="nav-link" href="<%= request.getContextPath() %>/login.me" style="font-family: 'Kalam', cursive;">login </a>
             	</strong>
             </li>
             <li class="nav-item">
             	<strong>
                	<a class="nav-link" href="<%= request.getContextPath() %>/signUpForm.me" style="font-family: 'Kalam', cursive;">Sign Up </a>
             	</strong>
             </li>
             <% } else { %>
             <li>
	             <div class="container">
	             	<strong class="nav-link" style="color: white;"><%= loginUser.getNickName() %></strong>
	             </div>
             </li>
             <li>
             	<input class="btn btn-sm btn-outline-secondary" id="logoutBtn" type="button" value="로그아웃" onclick="location.href='<%= request.getContextPath() %>/logout.me'">
             </li>             
             <%} %>
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

<%-- <%@ include file = "../common/Navbar.jsp" %> --%>


<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="gnrimages/turtle.png" class="d-block" alt="turtle">
    </div>
    <div class="carousel-item">
      <img src="gnrimages/greener1.jpeg" class="d-block" alt="greener1">
    </div>
    <div class="carousel-item">
      <img src="gnrimages/plogging3.jpeg" class="d-block" alt="plogging3">
    </div>
    <div class="carousel-item">
      <img src="gnrimages/vegan2.jpeg" class="d-block" alt="vegan2">
    </div>
    <div class="carousel-item">
      <img src="gnrimages/veganClub1.jpeg" class="d-block" alt="veganClub1">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<br><br><br><br>

   <form>
   <div class="row mb-3">
    <div class="row align-items-md-stretch" style=" padding-left: 180px;" >
      <div class="col-md-7 themed-grid-col">
        <div class="h-100 p-5 border rounded-3" style="background-color: Honeydew;">
          <h2>당신을 위한 가이드가 되어줄, Greener</h2>
          <p>여기 다양한 방법으로 자연과 조화롭게 살기 위해 노력하는 사람들이 모였습니다.</p>
          <br>
        <table>
        <tr>
        	<td><input class="btn btn-outline-success btn-sm" type="button" onclick="location.href='<%= request.getContextPath() %>/chalList.bo'" value="Challenge &raquo; "></td>
        	<td class="boardGD">&nbsp; 환경을 지키기 위해 도전한 챌린지를 자랑해보세요 &nbsp;</td>
        </tr> 
        <tr>
			<td><input class="btn btn-outline-success btn-sm" type="button"  onclick="location.href='<%= request.getContextPath() %>/recList.bo'" value="Recipe &raquo; "></td>
			<td class="boardGD">&nbsp; 비건을 지향하는 당신만의 레시피와 맛집을 공유해보세요 &nbsp;</td>
        </tr>
        <tr>
        	<td><input class="btn btn-outline-success btn-sm" type="button" onclick="location.href='<%= request.getContextPath() %>/newsBoard.me'" value="News &raquo; "></td>
        	<td class="boardGD">&nbsp; greener와 함께 보고 싶은 뉴스가 있나요? &nbsp;</td>
        </tr>
        <tr>
        	<td><input class="btn btn-outline-success btn-sm" type="button" onclick="location.href='<%= request.getContextPath() %>/list.cl'" value="Club &raquo; "></td>
        	<td class="boardGD">&nbsp; greener와 가까워지고 싶다면 모임에 가입해보세요! &nbsp;</td>
        </tr>
        </table>
        
        </div>
      </div>
 <!-- 로그인, 회원가입 버튼 -->    
      <div class="col-md-4 themed-grid-col">
        <div class="h-100 p-5 border rounded-3" style="background-color: Honeydew;">
        <%if(loginUser == null){ %>
          <h2 class="mb-3" style="text-align: center;">account login</h2><br>
         <br><br>
          <button class="w-100 btn btn-lg btn-primary mb-1" type="button" style="background-color: LightSeaGreen; border: none;"  onclick="location.href = '<%=request.getContextPath()%>/login.me'">Sign in</button>
          <button class="w-100 btn btn-lg btn-primary" type="button" style="background-color: LightSeaGreen; border: none;" onclick="location.href = '<%=request.getContextPath()%>/signUpForm.me'">Sign up</button>
         <%} else{ %>
          <p style="font-size: 22px;">
          	<sup><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-quote" viewBox="0 0 16 16">
			  <path d="M12 12a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1h-1.388c0-.351.021-.703.062-1.054.062-.372.166-.703.31-.992.145-.29.331-.517.559-.683.227-.186.516-.279.868-.279V3c-.579 0-1.085.124-1.52.372a3.322 3.322 0 0 0-1.085.992 4.92 4.92 0 0 0-.62 1.458A7.712 7.712 0 0 0 9 7.558V11a1 1 0 0 0 1 1h2Zm-6 0a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1H4.612c0-.351.021-.703.062-1.054.062-.372.166-.703.31-.992.145-.29.331-.517.559-.683.227-.186.516-.279.868-.279V3c-.579 0-1.085.124-1.52.372a3.322 3.322 0 0 0-1.085.992 4.92 4.92 0 0 0-.62 1.458A7.712 7.712 0 0 0 3 7.558V11a1 1 0 0 0 1 1h2Z"/>
			</svg></sup>
          	<%= loginUser.getNickName() %> 님 
          </p>
          	환영합니다
          	<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-brightness-high" viewBox="0 0 16 16">
			  <path d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6zm0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
			</svg><br>
          	오늘도 그린그린한 하루 보내세요 
          	<br>
            <br clear="all">
            <div class="loginBtns">
               <input class="btn btn-warning" type="button" value="내 정보 보기" onclick="location.href='<%= request.getContextPath() %>/myPage.me'">
               <input class="btn btn-secondary" type="button" value="로그아웃" onclick="location.href='<%= request.getContextPath() %>/logout.me'">
            </div>
         <%} %>
        </div>
      </div>
      
    </div>
    </div>
   </form>


<br><br>


<%-- <%@ include file = "../common/FooterTopBtn.jsp" %> --%>
<br><br>
<!-- FOOTER -->
<!-- <footer style="font-size: 13px; text-align: center; position: relative; bottom: 0;"> -->
<!-- <div class="shadow-sm" style=" "> -->
<footer class="footer mt-auto py-3" style="font-size: 13px; text-align: center; background-color: #dbf0db ;">
<!-- <hr> -->
  <p>
  	<a href="<%= request.getContextPath() %>/Terms.me" class="afooter">이용약관</a><a> | </a><a href="<%= request.getContextPath() %>/privacy_policy.me" class="afooter">개인정보처리방침</a>
  </p>
    <div class="moveTop">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
</svg><a href="#" style="text-decoration-line : none; color: white;">Top</a>
    </div>
    <p>&copy; Greener 2022</p>
  </footer>

<script>
		$('#club').mouseenter(function(){
			$(this).css("cursor","pointer");
		}).click(function(){
			<%if(loginUser == null){%>
					alert('로그인 후 이용 가능한 서비스입니다.');
					$(this).attr("href","<%= request.getContextPath() %>/login.me");
			<% } else { %>
					$(this).attr("href","<%= request.getContextPath() %>/list.cl");
			<% } %>
		});
		
</script>  
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>