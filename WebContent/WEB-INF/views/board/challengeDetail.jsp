<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
<%
	ChallengeBoard cboard = (ChallengeBoard)request.getAttribute("cboard");
// 	System.out.println("cboard : " + cboard);
	System.out.println("cboard.getBoardNo() : " + cboard.getBoardNo());
	ArrayList<Image> fileList = (ArrayList<Image>)request.getAttribute("fileList");
// 	for(int i = 0; i < fileList.size(); i++){
// 		System.out.println("fileList : " + fileList.get(i));
// 	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>

<%@ include file = "../common/Navbar.jsp" %>

<form action="<%= request.getContextPath()%>/chalUpdateForm.bo" method="post">
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
    

    <div class="col-8">
		<section id="forms">
		<br>
		  <div class="fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3">
		  	<h4><%= cboard.getBoardTitle() %></h4>
		  	<input type="hidden" name="title" value="<%= cboard.getBoardTitle() %>">
		  	<h5>
		  		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-flag-fill" viewBox="0 0 16 16">
				  <path d="M14.778.085A.5.5 0 0 1 15 .5V8a.5.5 0 0 1-.314.464L14.5 8l.186.464-.003.001-.006.003-.023.009a12.435 12.435 0 0 1-.397.15c-.264.095-.631.223-1.047.35-.816.252-1.879.523-2.71.523-.847 0-1.548-.28-2.158-.525l-.028-.01C7.68 8.71 7.14 8.5 6.5 8.5c-.7 0-1.638.23-2.437.477A19.626 19.626 0 0 0 3 9.342V15.5a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 1 0v.282c.226-.079.496-.17.79-.26C4.606.272 5.67 0 6.5 0c.84 0 1.524.277 2.121.519l.043.018C9.286.788 9.828 1 10.5 1c.7 0 1.638-.23 2.437-.477a19.587 19.587 0 0 0 1.349-.476l.019-.007.004-.002h.001"/>
				</svg>&nbsp;<%= cboard.getChalName() %>
		  	</h5>
		  	<input type="hidden" name="challenge" value="<%= cboard.getChalName() %>">
		  	<% if(cboard.getChalPlace() != null){ %>
			  	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
				  <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
				  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
				</svg>&nbsp;<%= cboard.getChalPlace() %><br>
			  	<input type="hidden" name="place" value="<%= cboard.getChalPlace() %>">
		  	<%} %>
		  </div>
          <div class="mb-2">
                  <div class="col">
                  <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
					  <div class="carousel-inner">
						    <div class="carousel-item active">
						    <input type="hidden" name="tFilePath" value="<%= request.getContextPath() %>/challenge_image_files/<%= fileList.get(0).getChangeName()%>">
							    <input type="hidden" name="tFileNo" value="<%= fileList.get(0).getFileNo() %>">
							    <input type="hidden" name="tChangeName" value="<%= fileList.get(0).getChangeName()%>">
							    <input type="hidden" name="tOriginName" value="<%= fileList.get(0).getOriginName()%>">
						    	<a href="<%= request.getContextPath() %>/challenge_image_files/<%= fileList.get(0).getChangeName()%>"
						    	download="<%= fileList.get(0).getChangeName() %>"></a>
						      <img name="thumbnail" src="<%= request.getContextPath() %>/challenge_image_files/<%= fileList.get(0).getChangeName() %>" class="d-block w-100" height="600px" alt="...">
						    </div>
						    <%if(fileList.size() > 1){ %>
							  	<% for(int i = 1; i < fileList.size(); i++){ %>
							    <div class="carousel-item">
							    <input type="hidden" name="cFilePath" value="<%= request.getContextPath() %>/challenge_image_files/<%= fileList.get(i).getChangeName()%>">
							    <input type="hidden" name="cFileNo" value="<%= fileList.get(i).getFileNo() %>">
							    <input type="hidden" name="cChangeName" value="<%= fileList.get(i).getChangeName()%>">
							    <input type="hidden" name="cOriginName" value="<%= fileList.get(i).getOriginName()%>">
								    	<a href="<%= request.getContextPath() %>/challenge_image_files/<%= fileList.get(i).getChangeName()%>"
								    	download="<%= fileList.get(i).getChangeName() %>"></a>
								      <img name="contentImg" src="<%= request.getContextPath() %>/challenge_image_files/<%= fileList.get(i).getChangeName() %>" class="d-block w-100" height="600px" alt="...">
							    </div>
							    <% } %>
					  		<% } %>
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
		          <div class="card shadow-sm">
<!-- 		            <svg class="bd-placeholder-img card-img-top" width="100%" height="550" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
						
		            <div class="card-body">
		            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi text-danger bi-suit-heart-fill" viewBox="0 0 16 16">
					  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
					</svg> 
					<%= cboard.getBoardCount() %>명의 greener가 응원합니다 
					<input type="hidden" name="like" value="<%= cboard.getBoardLike() %>">
		            <h6><%= cboard.getNickName() %></h6>
		            <input type="hidden" name="nickname" value="<%= cboard.getNickName() %>">
		              <p class="card-text"><%= cboard.getBoardContent() %></p>
		              
		    	  	  <input type="hidden" name="content" value="<%= cboard.getBoardContent() %>">
		    	  	  <input type="hidden" name="bNo" id="bNo" value="<%= cboard.getBoardNo()%>">
		    	  	  
<!-- 		    	  	  <button type="button" id="likeBtn" class="btn btn-sm btn-outline-danger">
					    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
						<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
						</svg>
		                 	응원하기
		              </button> -->
		              <br><br>
		    	  	  <% if(m.getUserId().equals(cboard.getBoardWriter()) || m.getUserId().equals("admin123")) {%>
		              <div class="d-flex justify-content-between align-items-center">
		                  <input type="submit" class="btn btn-sm btn-outline-secondary" value="수정"> 
		                  <input type="button" onclick="deleteBoard();" id="deleteBtn" class="btn btn-sm btn-outline-danger" value="삭제">
		              </div>
		              <%} %>
		            </div>
		          </div>
		          </div>
          </div>
   	  	  <% if(!m.getUserId().equals(cboard.getBoardWriter())) {%>
          	   <div class="d-grid gap-2 d-md-flex justify-content-md-end">
			      <button type="button" class="btn btn-sm btn-warning" onclick="popUp();">
			         <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
			           <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
			         </svg> 신고
			      </button>
			   </div>
          <%} %>
        </section>
	</div>
  </div>
</div>
</form>

<script>
		function deleteBoard(){
			if(confirm('정말 삭제하시겠습니까?')){
				location.href="<%= request.getContextPath()%>/delete.bo?bNo=" + <%= cboard.getBoardNo()%>;
			}
		}
		
      function popUp(){
         window.open('reportForm.bo','ReportForm','width=450, height=500');
      }
      
</script>

<%@ include file = "../common/FooterTopBtn.jsp" %>
</body>
</html>