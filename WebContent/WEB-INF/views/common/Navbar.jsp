<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kalam&family=Noto+Sans+KR&family=Timmana&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
		/* 내비바 로그아웃 버튼*/
		#logoutBtn{
			position: relative; bottom: -8px;
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
             <% if(m != null){ %>
	             <% if(m.getNickName().equals("관리자")){ %>
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
	         <% if(m == null){ %>
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
	             	<strong class="nav-link" style="color: white;"><%= m.getNickName() %></strong>
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
   
<script>

// 		$('#club').click(function(){
<%-- 		   <% if(m == null){%> --%>
// 		       alert('회원만 접근 가능한 게시판입니다');
// 		       location.href = 'Home.jsp';
<%-- 		   <%}%>       --%>
// 		});
			$('#club').mouseenter(function(){
				$(this).css("cursor","pointer");
			}).click(function(){
				<%if(m == null){%>
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