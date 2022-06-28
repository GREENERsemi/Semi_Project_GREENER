<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	form{
		width: 1000px;
		padding-left:300px;
	}
	
	button{
		align:center;
	}
</style>
</head>
<body>

<%@ include file="../common/Navbar.jsp"%>

<article>

		<div class="container" role="main">
			
			<br><br>
			
			<h4 style="text-align:center">뉴스 글쓰기</h4>
			<br>

			<form name="form" id="form" role="form" method="post" action="<%= request.getContextPath() %>/newsInsert.bo">


				<select class="form-select" aria-label="Default select example" name="category">
  					<option selected>카테고리</option>
 					<option value="환경 관련 법 기사">환경 관련 법 기사</option>
  					<option value="환경 관련 기업 기사">환경 관련 기업 기사</option>
 					<option value="환경 관련 연예인 기사">환경 관련 연예인 기사</option>
 					<option value="기타">기타</option>
				</select>
				
				<br>
				
				
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
				</div>

				

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				
				<div class="mb-3">
					<label for="title">출처</label>
					<input type="text" class="form-control" name="reference" id="reference" placeholder="출처를 입력해 주세요">
				</div>
			
			<br>
			
<!-- 			<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
  <label class="form-check-label" for="inlineRadio1">공개</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
  <label class="form-check-label" for="inlineRadio2">비공개</label>
</div> -->

	
	<br><br>
			<div align="right">
				<button type="submit" class="btn btn-success">저장</button>
				<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
			</div>
</form>
		</div>

	</article>



</body>
</html>