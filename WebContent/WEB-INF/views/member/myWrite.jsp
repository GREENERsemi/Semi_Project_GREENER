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
		body, ul, th, td, fieldset, input {margin: 0; padding: 0;}
		a {text-decoration: none; color: black;}
		li {list-style: none;}
		.hidden {position: absolute; left: -9999px;}
		/* fieldset 바깥의 border를 없앰 */
		fieldset {border: 0;}
		/* tabld 안쪽 셀과 바깥쪽 셀 사이의 여백을 없앰 */
		table {border-collapse: collapse;}
		/* main */
		body {background: #fff7e6;}
		#boardWrap {width: 800px; margin: 100 auto;}
		/* table */
		/* thead */
		#table {
		    font-family: 'twayair', sans-serif; text-align: center;
		    width: 700px; margin: 0 auto;
		}
		#table caption {
		    font-size: 40px; margin: 30px auto 20px;
		}
		#table th {
		    font-weight: normal; text-transform: capitalize;
		    background: #20B2AA;
		    padding: 10px 0;
		    color: #fff;
		}
		/* px 단위로 입력할 경우 table 총 너비인 700px을 맞춰준다. */
		/* 각 첫번째 칸과 마지막 칸에 border-radius를 적용하면 둥근 모서리를 적용할 수 있다. */
		#table th.no {width: 8%; border-radius: 20px 0 0 20px;}
		#table th.title {width: 52%;}
		#table th.writer {width: 15%;}
		#table th.date {width: 15%;}
		#table th.read {width: 10%; border-radius: 0 20px 20px 0;}
		/* tbody */
		#table tbody td {padding: 10px 0; border-bottom: 1px solid #373B44;}
		/* title 열의 내용은 좌측 정렬 */
		#table tbody td.listTitle {text-align: left;}
		/* 
		    - 2줄 이상은 ... 으로 표시
		    블락 요소로 한다면 display: block; 은 빼고 나머지 4개는 필수로 적용!!
		*/
		#table tbody td a {
		    display: block; width: 360px;
		    white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
		}
		#table tbody td a:hover {text-decoration: underline; color: #737373;}
		/* Search */
		/* input 이 인라인 요소이기 때문에 text-align으로도 정렬할 수 있다. */
		#boardWrap form {text-align: right; margin: 20px 50px 20px 0;}
		#boardWrap form input {border: 1px solid #000;}
		#boardWrap #searchBox {width: 300px; height: 30px;}
		/* outline: none; - focus 시 진해지는 border를 없애기 위함 */
		#boardWrap #searchBox:focus {outline: none; background: #ffffb3;}
		/*
		    input 태그의 button 타입들은 높이를 입력시 border를 포함한 값으로 적용시키기 때문에
		    text 타입과 동일한 높이를 주기위해서는 border 높이를 고려해서 적용시켜야한다.
		*/
		#boardWrap #searchBtn {width: 100px; height: 32px;}
		#boardWrap #searchBtn:hover {background: #a6ffa6;}
		#boardWrap #searchBtn:active {background: #00ff40;}
</style>
</head>
<body>

<header>
	<%@ include file = "../common/Navbar.jsp" %>
</header>
	
	<div id="boardWrap">
            <table id="table">
                <thead>
                   
                    <tr>
                        <th scope="col" class="no">번호</th>
                        <th scope="col" class="title">제목</th>
                        <th scope="col" class="writer">작성자</th>
                        <th scope="col" class="date">날짜</th>
                        <th scope="col" class="read">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td class="listTitle"><a href="#">안녕하세여ㅛ</a></td>
                        <td>이용준</td>
                        <td>22.05.12</td>
                        <td>15</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="listTitle"><a href="#">가입했어요</a></td>
                        <td>바보</td>
                        <td>22.05.12</td>
                        <td>4</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="listTitle"><a href="#">가입했어요</a></td>
                        <td>바보</td>
                        <td>22.05.12</td>
                        <td>4</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="listTitle"><a href="#">가입했어요</a></td>
                        <td>바보</td>
                        <td>22.05.12</td>
                        <td>4</td>
                    </tr>
                </tbody>
            </table>
			<br>
            <div id="pageMv" align="center">
                <a href="#">Prev</a>
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">Next</a>
            </div>
        </div>

<%@ include file = "../common/FooterTopBtn.jsp" %>	

</body>
</html>