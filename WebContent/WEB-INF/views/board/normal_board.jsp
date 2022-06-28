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
		background: Honeydew;
	}
	a{
		text-decoration:none;
		outline : none;
	}
	a:link{
		text-decoration:none;
		color : black;
	}
	a:visited{
		text-decoration:none;
		color : black;
	}
	a:hover{
		text-decoration: none;
		color : lightseagreen;
	}
	/* main  */
	div > table{

		width : 700px;
		height : 400px;
		margin-top : 50px;
		margin-left : auto;
		margin-right : auto;		
	}
	
	#report{
		border : none;
		margin : auto;
		background : lightseagreen;
	}
	#reporta{
		color : white;
	}
	
	#head-title{
		background : lightseagreen;
		color : white;

	}
	#notice{
		background : #A9F5A9;
	}
	
	.content{
		text-align: center;
	}
	#page{
		text-align : center;
		margin-bottom : 10px;
	}
	th{
		text-align: center;
	}

    
    
</style>
</head>
<body>
 <%@ include file = "../common/Navbar.jsp" %>

	<main>
		<div>
			<table class="board">	
				<tr id="functions">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><button id='report'><a href id="reporta">신고</a></button></td>
				</tr>
				<tr id="head-title">
					<th id="num">게시번호</th>
					<th id="title">제목</th>
					<th id="date">게시일</th>
					<th id="publisher">게시자</th>
					<th id="noitice">조회수</th>
					<th id="like">좋아요</th>
				</tr>
				<tr class="content" id="notice">
					<td>43</td>
					<td><a href>[공지] 글 도배 관련 </a></td>
					<td>2021-03-04</td>
					<td>관리자</td>
					<td>bbb</td>
					<td>bb</td>
				</tr>
				<tr class="content">
					<td>218</td>
					<td><a href='#'>비건 베이킹 원데이 클래스</a></td>
					<td>2022-05-01</td>
					<td>비건사랑</a></td>
					<td>453</td>
					<td>43</td>
				</tr>
				<tr class="content">
					<td>215</td>
					<td><a href='#'>주간 대중교통 이용 챌린지</a></td>
					<td>2022-04-12</td>
					<td>뚜벅이</td>
					<td>122</td>
					<td>31</td>
				</tr>
				<tr class="content">
					<td>204</td>
					<td><a href='#'>환경 독서 모임</a></td>
					<td>2022-03-23</td>
					<td>책읽는 부엉이</td>
					<td>111</td>
					<td>56</td>
				</tr>
				<tr class="content">
					<td>199</td>
					<td><a href='#'>환경 에세이 모임</a></td>
					<td>2022-03-21</td>
					<td>글쓰는 달팽이</td>
					<td>443</td>
					<td>76</td>
				</tr>
				<tr class="content">
					<td>ooo</td>
					<td>bbbb</td>
					<td>bbbb-bb-bb</td>
					<td>bbbb</td>
					<td>bbb</td>
					<td>bb</td>
				</tr>
				<tr class="content">
					<td>ooo</td>
					<td>bbbb</td>
					<td>bbbb-bb-bb</td>
					<td>bbbb</td>
					<td>bbb</td>
					<td>bb</td>
				</tr>
				<tr class="content">
					<td>ooo</td>
					<td>bbbb</td>
					<td>bbbb-bb-bb</td>
					<td>bbbb</td>
					<td>bbb</td>
					<td>bb</td>
				</tr>
			</table>
		<br>
		</div>
		
		<div id="page">
		<a href='#'>이전</a>
		1/10
		<a href='#'>다음</a>
		</div>
	
	</main>	




<%@ include file = "../common/FooterTopBtn.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>