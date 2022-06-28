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

			<h4>Club 글쓰기</h4>
			<br>

			<form action="<%= request.getContextPath()%>/insert.cl" name="form" id="form" role="form" method="post" onclick="return checkForm();">
					<div class="mb-3">
						<div>
						<label>모집 기간</label>
						<input type="date" name="acptStart" id="acptStart">
						~
						<input type="date" name="acptEnd" id="acptEnd">
						</div>
						<br>
						<label>온라인 모임 여부</label>
						<select id="onlineYn" name="onlineYn">
							<option value="Y">온라인 모임</option>
							<option value="N">오프라인 모임</option>
						</select>
					</div>

					<div class="mb-3">
						<label>모임 주기</label>
						<input type="text" name="gatherPeriod" id="gatherPeriod" placeholder="ex. 주 1회 토요일 14:00~16:00">						
					</div>
					
					<div class="mb-3">
						<label for="boardTitle">제목</label>
						<input type="text" class="form-control" name="boardTitle" id="boardTitle" placeholder="제목을 입력해 주세요">
					</div>
					<input type="hidden" name="boardWriter" value="<%= m.getUserId()%>">
					<input type="hidden" name="nickName" value="<%=m.getNickName() %>">
					
	
					<div class="mb-3">
						<label for="boardContent">내용</label>
						<textarea class="form-control" rows="5" name="boardContent" id="boardContent" placeholder="자유 양식입니다" ></textarea>
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
<script>
/* 	//필수 입력 체크
   function checkForm(){
/* 		console.log($('#inputGroupSelect01 option:selected').val()); */
	   if($('#acptStart').val() == ''){
		   alert('모집 시작 시점을 입력하세요');
		   return false;
	   } else if($('#acptEnd').val() == ''){
		   alert('모집 마감 시점을 입력하세요');
		   return false;
	   } else if($('#boardTitle').val() == ''){
		   alert('제목을 입력하세요');
		   return false;
	   } else if($('#onlineYn option:selected').val() == "selected"){
		   alert('온라인 모임 여부를 지정하세요');
		   return false;
	   } else if($('#boardContent').val() == ''){
		   alert('내용을 입력하세요');
		   return false;
	   } else if($('#gatherPeriod').val() == ''){
		   alert('모임 주기를 입력하세요');
		   return false;
	   }
		   else {
		   return true;
	   }
   } */
</script>
<%@ include file="/WEB-INF/views/common/FooterTopBtn.jsp" %>
</body>
</html>