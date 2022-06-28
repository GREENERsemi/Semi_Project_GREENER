<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% 
   Member selectMember = (Member)request.getAttribute("selectMember");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kalam&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<style>

   /*필요없는거같아서 가림
   #checkPw{
      color: #FF0000;
   }
   
   
   button{
      position: relative; left: -10px; top: -22px; 
   }*/

      
   .container {
     display: -webkit-flex;
     display: flex;
     height: 100%; 
     text-align: center;
   }
   
   
   #logbox {
     padding: 30px 60px 15px 60px;
     margin: 70px auto;
     width: 600px;
     background-color: Honeydew;
     -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
     -moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
     box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
   }
   
   #myInfo {
   	padding: 0px 30px 30px 30px;
   }

/*    .myPageBtns{ */
/*    	padding: 50px 0px 0px 0px; */
/*    } */
   
   h1, input {
     font-family: "Open Sans", Helvetica, sans-serif;
      background: : Honeydew;
      
   }
   
   .input:focus {
     outline: none;
     border-bottom-color: Honeydew !important;
   }
   .input:hover {
     border-bottom-color: #dcdcdc;
   }
   .input:invalid {
     box-shadow: none;
   }
   
   .pass:-webkit-autofill {
     -webkit-box-shadow: 0 0 0 1000px white inset;
   }
   
   .inputButton {
     position: relative;
     width: 80px;
     height: 40px;
     display: block;
     margin: 30px auto 30px;
     color: white;
     background-color: lightseagreen;
     border: none;
     -webkit-box-shadow: 0 5px 0 #2CADAD;
     -moz-box-shadow: 0 5px 0 #2CADAD;
     box-shadow: 0 5px 0 #2CADAD;
   }
   .inputButton:hover {
     top: 2px;
     -webkit-box-shadow: 0 3px 0 #2CADAD;
     -moz-box-shadow: 0 3px 0 #2CADAD;
     box-shadow: 0 3px 0 #2CADAD;
   }
   .inputButton:active {
     top: 5px;
     box-shadow: none;
   }
   .inputButton:focus {
     outline: none;
   }
   
   /* placeholder, label */
   .label{
      position: relative; right: -23px; 
   }
    .label{ 
       text-align: right; 
    } 
    

	/* button */
.btn:link,
.btn:visited {
    text-transform: uppercase;
    text-decoration: none;
    padding: 15px 40px;
    display: inline-block;
    border-radius: 100px;
    transition: all .2s;
    position: absolute;
}

.btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.btn:active {
    transform: translateY(-1px);
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.btn-white {
    background-color: #fff;
    color: #777;
}

.btn::after {
    content: "";
    display: inline-block;
    height: 100%;
    width: 100%;
    border-radius: 100px;
    position: absolute;
    top: 0;
    left: 0;
    z-index: -1;
    transition: all .4s;
}

.btn-white::after {
    background-color: #fff;
}

.btn:hover::after {
    transform: scaleX(1.4) scaleY(1.6);
    opacity: 0;
}

.btn-animated {
    animation: moveInBottom 5s ease-out;
    animation-fill-mode: backwards;
}

   /* 형식제한 span */
   td>span{
      font-size: small;
      position: relative; top: -40px;   
   }
   
</style>
</head>
<body>

<%@ include file = "../common/Navbar.jsp" %>
	
<main>
 <div class="container" style="margin-top: 5%;">
    <div class="col-md-12">
    <div id="logbox" style="background:#D2F3CD;">
      <form action="<%= request.getContextPath() %>/updateForm.me" method="post" id="myForm" name="myForm">
      <br>
      
 <%--메인 부분 --%>
     <h1 id="myInfo">마이페이지</h1>
     <hr>
     <br>
      <table id="myInfoTable">
		<tr>       	
            <th width="200px" class="label">Id</th>      
            <td width="400px">
               <%= selectMember.getUserId() %>
               <input type="hidden" maxlength="13" name="myId" required value="<%= selectMember.getUserId() %>"></td>			
     	</tr>
       	<tr>
          <th class="label">Name</th>
          <td><%= selectMember.getUserName() %>
               <input type="hidden" name="myName" required value="<%= selectMember.getUserName()%>"></td>
       </tr>
       <tr>
          <th class="label">NickName</th>
           <td><%= selectMember.getNickName() %>
               <input type="hidden" maxlength="15" name="myNickName" required value="<%=selectMember.getNickName()%>"></td>
       </tr>
       <tr>
          <th class="label">Email</th>
          <td><%= selectMember.getEmail() == null ? "-" : selectMember.getEmail() %>
               <input type="hidden" name="myEmail" value = "<%= selectMember.getEmail() == null ? "-" : selectMember.getEmail() %>"></td>

       </tr>
      <tr>
         <th class="label">Phone</th>
          <td>
                  <%= selectMember.getPhone() == null ? "-" : selectMember.getPhone() %>
                  <input type="hidden" maxlength="11" name="myPhone" value = "<%= selectMember.getPhone() == null ? "-" : selectMember.getPhone() %>">
               </td>
       </tr>
       <tr>
          <th class="label">Birth</th>
         <td>
                  <%= selectMember.getBirthDate() %>
               </td>

       </tr>
       
        </table>
        	<hr>
        	<br>
            <div class="myPageBtns" align="center">
            <input class="btn btn-white btn-animate" id="updateBtn" type="submit" value="수정" >
            <input class="btn btn-white btn-animate" id="updatePwdBtn" type="button" value="비밀번호 변경" onclick="location.href='updatePwdForm.me'">
            <input class="btn btn-white btn-animate" id="deleteBtn" type="button" value="탈퇴" onclick="deleteMember();">            
            <input class="btn btn-white btn-animate" type="button" id="goMain" onclick="location.href='<%= request.getContextPath() %>'" value="메인">
         	<br><br><!-- <input class="btn btn-white btn-animate" id="commentBtn" type="button" value="내가 쓴 댓글" onclick="#"> -->
         	<input class="btn btn-white btn-animate" id="writeBtn" type="button" value="내가 쓴 글" onclick="location.href='<%= request.getContextPath() %>/myBoardList.me'">
         </div>		

      </form>
    </div>
   </div>
  </div>
</main>

<%@ include file = "../common/FooterTopBtn.jsp" %>
  
<script>
   function deleteMember(){
      var bool = confirm('정말 탈퇴하시겠습니까?');
      if(bool){
         location.href = '<%= request.getContextPath() %>/delete.me';   
      }      
   }
</script>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>   
</body>
</html>