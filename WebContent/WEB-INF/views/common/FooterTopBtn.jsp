<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
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
</style>
</head>
<body>

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>