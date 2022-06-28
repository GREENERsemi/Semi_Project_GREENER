<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*, board.model.vo.*, java.util.ArrayList"%>
<%
	ArrayList<ChallengeBoard> list = (ArrayList<ChallengeBoard>)request.getAttribute("cList");
	Page p = (Page)request.getAttribute("p");
	System.out.println(p);
	ArrayList<Image> imageList = (ArrayList<Image>)request.getAttribute("imageList");
	for(int i = 0; i < list.size(); i++){
		System.out.println(list.get(i));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 	/*예시 사진 게시글 리스트*/
    .card-img-top{
		background-size:cover;
		bockground-position:50%;
	}
	a[class^="d-block"]{
		text-decoration-line : none; color: DarkGreen;
	}
	
	/*게시글 제목*/
	.card-title {
 		width: 200px; height:20px; overflow: hidden;
		text-overflow: ellipsis; white-space:nowrap;
	}
	img{
		width: 400px; height: 400px;
	}
	
	/*cheers to all challengers*/
	#cheers{font-family: 'Timmana', sans-serif; font-size: 27px;}
</style>
</head>
<body>
<%@ include file = "../common/Navbar.jsp" %>
<!-- 내용 -->
<div class="container">
  <div class="row">
    <div class="col-3">
		<section id="forms">
		<br>
		  <h3 class="fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3">이 달의 챌린지</h3>
		
		    <article class="my-3" id="overview">
		      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
		         <div class="card mb-4 rounded-3 shadow-sm col-sm-10">
				 	<div class="card-header py-2">
				      <h6 class="my-0 fw-normal">용기내 챌린지</h6>
				    </div>
				    <div class="card-body" style="font-size: 14px;">
				    	음식 포장에 무분별하게 사용되는 일회용품을 줄이기 위해 다회용 용기에 음식을 포장해오는 챌린지
				    </div>
				</div>
		         <div class="card mb-4 rounded-3 shadow-sm col-sm-10">
				 	<div class="card-header py-2">
				      <h6 class="my-0 fw-normal">플로깅 챌린지</h6>
				    </div>
				    <div class="card-body" style="font-size: 14px;">
				    	스웨덴어 ‘Plocka upp(줍다)’과 영어 ‘Jogging(달리기)’의 합성어로 조깅을 하면서 쓰레기를 줍는 챌린지
				    </div>
				</div>
		         <div class="card mb-4 rounded-3 shadow-sm col-sm-10">
				 	<div class="card-header py-2">
				      <h6 class="my-0 fw-normal">제로웨이스트 챌린지</h6>
				    </div>
				    <div class="card-body" style="font-size: 14px;">
						일상 속 일회용 쓰레기를 제로에 가깝게 최소화하는 챌린지
				    </div>
				</div>
		         <div class="card mb-4 rounded-3 shadow-sm col-sm-10">
				 	<div class="card-header py-2">
				      <h6 class="my-0 fw-normal">캔크러시 챌린지</h6>
				    </div>
				    <div class="card-body" style="font-size: 14px;">
				    	알루미늄 캔의 재활용률을 높이기 위해 이물질이 들어가지 않도록 알루미늄 캔을 발로 밟아 찌그러뜨려서 분리 배출하는 챌린지
				    </div>
				</div>
		      </div>
			</article>
		</section>
     </div>
    
    <div class="col-9">
	<div class="mb-2">
	<br>
	<!-- Page Content -->
	<div class="container">
		<form class="d-flex" method="post" onsubmit="return checkForm();" action="<%= request.getContextPath() %>/search.chal">
			<input class="form-control me-2" id="search" name="search" type="search" placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
		<div class="fw-light text-center text-lg-start mt-2 mb-0" id="cheers">
			<h2 class="fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-flag-fill" viewBox="0 0 16 16">
				  <path d="M14.778.085A.5.5 0 0 1 15 .5V8a.5.5 0 0 1-.314.464L14.5 8l.186.464-.003.001-.006.003-.023.009a12.435 12.435 0 0 1-.397.15c-.264.095-.631.223-1.047.35-.816.252-1.879.523-2.71.523-.847 0-1.548-.28-2.158-.525l-.028-.01C7.68 8.71 7.14 8.5 6.5 8.5c-.7 0-1.638.23-2.437.477A19.626 19.626 0 0 0 3 9.342V15.5a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 1 0v.282c.226-.079.496-.17.79-.26C4.606.272 5.67 0 6.5 0c.84 0 1.524.277 2.121.519l.043.018C9.286.788 9.828 1 10.5 1c.7 0 1.638-.23 2.437-.477a19.587 19.587 0 0 0 1.349-.476l.019-.007.004-.002h.001"/>
				</svg> Cheers to all challengers 
			</h2>
		</div>

		<div>
			함께 하면 즐거움도 두 배! 작심삼일도 좋아요! 당신의 도전을 응원합니다!
		</div>
  		<hr class="mt-2 mb-4">

<%-- 		<% if(m != null) { %> --%>
<%-- 		<div class="mt-4 mb-3 text-lg-end" style="font-size: 18px;" onclick="location.href='<%= request.getContextPath()%>/challengeWriteForm.bo'"> --%>
<!-- 			<button type="button" class="btn btn-outline-secondary">글쓰기  -->
<!-- 				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16"> -->
<!-- 				  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/> -->
<!-- 				  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/> -->
<!-- 				</svg> -->
<!-- 			</button> -->
<!-- 		</div> -->
<%-- 		<% } %> --%>
		
		  <div class="row text-center text-lg-start">
		  <% if(list.isEmpty()){ %>
			  <div>
			  	조회된 리스트가 없습니다
			  </div>
		  <%} else {%>
	  	  	<% for(int i = 0; i < list.size(); i++){ %>
	  			<% ChallengeBoard cb = list.get(i); %>
				    <div class="col-lg-4 col-md-4 col-6">
			      	<a class="d-block mb-4 h-100">
		      	
		     		 	<table class="card-body" id="thumbnail">
			     		 <tr>
			     		 	<td>
							    <% for(int j = 0; j < imageList.size(); j++){ 
							    	 Image img = imageList.get(j); 
							    	 if(cb.getBoardNo() == img.getBoardNo()){ %>
								        <img class="img-fluid img-thumbnail" src="<%= request.getContextPath() %>/challenge_image_files/<%= img.getChangeName() %>" alt="챌린지 이미지" width="200" height="200">
							     	<% } %>
							   	<% } %>
							</td>
						 </tr>
		     		 	<tr>
							<td>
								<p class="card-text">
							        <input type="hidden" name="bNo" value="<%= cb.getBoardNo() %>">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi text-danger bi-suit-heart-fill" viewBox="0 0 16 16">
									  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
									</svg> <%= cb.getBoardCount() %>명의 greener가 응원해요
								</p>
							<td>
		     		 	</tr>
		     		 	<tr>
		     		 		<td>
								<p class="card-title">
							    
								<%= cb.getBoardTitle() %></p>
		
							</td>
						</tr>
						<tr>
							<td>
								<p class="card-text"><%= cb.getChalName() %></p>
							</td>
						</tr>
						<tr>
							<td>
								<p class="card-text"><%= cb.getNickName() %></p>
							</td>
						</tr>
						<tr>
							<td>
								<p class="card-text"><%= cb.getCreateDate() %></p>
								<hr>
							</td>
						</tr>
						</table>
	      			</a>
		   			</div>
	    	 <%} %>
	     <%} %>
  		 </div>

		<!-- 페이징 -->
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		      <a class="page-link" href="<%= request.getContextPath() %>/search.chal?currentPage=1" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <% for(int pi = p.getStartPage(); pi <= p.getEndPage(); pi++){ %>
		    	<% if(pi == p.getCurrentPage()){ %>
		    		<li class="page-item"><button class="page-link" id="choosen" disabled><%= pi %></button></li>
		    	<% } else { %>
				    <li class="page-item"><button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath() %>/search.chal?currentPage=<%= pi %>'"><%= pi %></button></li>
		    	<% } %>
		    <%} %>
<%-- 				    <li class="page-item"><button class="page-link" onclick="location.href='<%= request.getContextPath() %>/reportlist.bo?currentPage=<%= p.getCurrentPage() +1 %>'" id="afterBtn">&gt;</button></li> --%>
		    <li class="page-item">
		      <a class="page-link" href="<%= request.getContextPath() %>/search.chal?currentPage=<%= p.getMaxPage() %>" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>

	</div>
	</div>
	</div>
  </div>
</div>

<br>
<%@ include file = "../common/FooterTopBtn.jsp" %>
<script>
		$(function(){
			$('#thumbnail td').mouseenter(function(){
				$(this).parent().css({'cursor':'pointer'});
			}).click(function(){
				<%if(m == null){%>
						alert('로그인 후 이용 가능한 서비스입니다.');
						location.href="login.me";
				<% } else { %>
						var bNo = $(this).parent().parent().children().children().children().children().eq(0).val();
						console.log(bNo);
						location.href="<%= request.getContextPath() %>/chalDetail.bo?bNo=" + bNo;
				<% } %>
			});
		});
		
		function checkForm(){
			if($('#search').val() == ''){
				alert('검색어를 입력하세요');
				return false;
			}
			
			return true;
		}
</script>
</body>
</html>