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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<style>
     img{ 
        width: 60%; height: 500px; margin-top: 50px; 
        margin-left: 300px; 
     }  
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
    table{
       font-size: 20px;
       border-spacing: 12px;
       border-collapse: separate;
    }
</style>
</head>
<%@ include file="/WEB-INF/views/common/Navbar.jsp" %>

<br><br>


<article>

		<div class="container" role="main">

			<h4>공지사항 글쓰기</h4>
			<br>

			<form action="<%= request.getContextPath()%>/insert.no" name="form" id="form" role="form" method="post" >
					<div class="mb-3">
						<select id="fix" name="fix">
							<option value="N">게시판 상단에 고정하지 않기</option>
							<option value="Y">게시판 상단에 고정하기</option>
						</select>
					</div>
					
					<div class="mb-3">
						<label for="noticeTitle">제목</label>
						<input type="text" class="form-control" name="noticeTitle" id="noticeTitle" placeholder="제목을 입력해 주세요">
					</div>
					<input type="hidden" name="noticeWriter" value="<%= m.getUserId()%>">
					
	
					<div class="mb-3">
						<label for="NoticeContent">내용</label>
						<textarea class="form-control" rows="5" name="noticeContent" id="noticeContent" placeholder="내용을 입력해 주세요" ></textarea>
					</div>
					
					<br>
					<br>
					
					<div align="right">
					<input type="submit" class="btn btn-success" value="저장">
					<input type="button" class="btn btn-secondary" onclick="location.href='javascript:history.go(-1);'" value="취소">
					</div>
			</form>
		</div>

</article>




<br><br>


<%@ include file="/WEB-INF/views/common/FooterTopBtn.jsp" %>
</body>
</html>