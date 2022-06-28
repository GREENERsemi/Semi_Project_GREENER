<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kalam&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body style="font-family: 'Noto Sans KR', sans-serif; background-color: rgb(249,249,249);">
<%if(msg == null){ %>
<article>
   <form name="form" id="form" method="post" onsubmit="return CheckForm();" action="<%=request.getContextPath()%>/insertReport.bo">
      <div class="container" role="main" style="background-color: white;">
      <br>
      <h4 style="text-align: center;"><strong>신고하기</strong></h4>
      <hr>
      <br>
      <select class="form-select" id="reportType" name="reportType">
        <option value="selected" selected>신고 사유를 선택하세요</option>
        <option value="1">홍보, 영리목적</option>
        <option value="2">도배, 스팸</option>
        <option value="3">욕설, 비방, 차별, 혐오</option>
        <option value="4">기타</option>
      </select>
      <input type="hidden" name="bNo" id="bNo" value="">   
      <br>
      <div class="mb-3">
         <label for="content">신고내용</label>
         <textarea class="form-control" rows="5" name="content" id="content" style="resize: none;" placeholder="신고 내용을 입력해 주세요" ></textarea>
      </div>
      <br>
      </div>
      <br>
      <div style="text-align: center;">
         <input type="button" class="col-4 btn-sm btn btn-secondary" onclick="self.close()" value="취소">
         <input type="submit" class="col-4 btn-sm btn btn-danger" value="완료">
      </div>
   </form>
</article>
<br>
<article style="font-size: 12px; padding-left: 35px; color: #808080; font-family: '나눔고딕체'; font-weight: lighter;">   
   <div>
      * 허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니<br>&nbsp; 유의하시어 신중하게 신고해 주세요.
   </div>
</article>
<%} else { %>
   <div class="container text-center">
   <br><br><br><br><br><br>
      <h4>신고처리 되었습니다.</h4>
      <h6>관리자 검토 후 신속하게 조치하겠습니다.</h6>
   <br><br><br><br>
   <input type="button" class="col-4 btn-sm btn btn-secondary" onclick="self.close()" value="닫기">
   </div>
<%} %>

<script>
		$('#bNo').val(opener.document.getElementById('bNo').value);
		
		function CheckForm(){
			if($('#reportType option:selected').val() == "selected"){
				alert('신고 사유를 선택하세요');
				return false;
			} else if ($('#content').val() == ''){
				alert('신고 내용을 입력하세요');
				return false;
			} else {
				return true;
			}
		}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>