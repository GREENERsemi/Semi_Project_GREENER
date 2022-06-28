<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .outer {
      width:1000px; height:1250px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
      margin-left:auto; margin-right:auto; margin-top:50px;
   }
   .insertArea {width:500px; height:1450px; margin-left:auto; margin-right:auto;}
   .btnArea {width:180px; margin-left:auto; margin-right:auto;}
   #titleImgArea {width:350px; height:200px; text-align:center; display:table-cell; vertical-align:middle; border: 1px solid #dddddd"}
   #titleImgArea:hover, #contentImgArea1:hover, #contentImgArea2:hover, #contentImgArea3:hover {cursor:pointer;}
   #contentImgArea1, #contentImgArea2, #contentImgArea3 {
      width:150px; height:100px;
      text-align:center; display:table-cell; vertical-align:middle;
   }
   #insertBtn{background: #D1B2FF;}
   #cancelBtn{background: #B2CCFF}
   #insertThumbTable{margin: auto;}
</style>
</head>
<body>
<%@ include file = "../common/Navbar.jsp" %>
   <div class="outer">
      <br>
      <h2 align="center">Recipe</h2>
      <br>
      
   
      <form action="<%= request.getContextPath() %>/recipeInsert.bo" method="post" encType="multipart/form-data">
         <div class="insertArea">
            <table id="insertThumbTable">
               <tr>
                  <th width="100px">제목</th>
                  <td colspan="3"><input type="text" size="45" name="title"></td>
               </tr>
               <tr>
                  <th>대표 사진</th>
                  <td colspan="3">
                     <div id="titleImgArea">
                        <img id="titleImg" width="350" height="200">
                     </div>
                  </td>
               </tr>
               <tr>
                  <th>사진</th>
                  <td>
                     <div id="contentImgArea1">
                        <img id="contentImg1" width="130" height="100"> 
                     </div>
                  </td>
                  <td>
                     <div id="contentImgArea2">
                        <img id="contentImg2" width="130" height="100"> 
                     </div>
                  </td>
                  <td>
                     <div id="contentImgArea3">
                        <img id="contentImg3" width="130" height="100"> 
                     </div>
                  </td>
               </tr>
               
               <tr>
                  <th width="100px">메뉴명</th>
                  <td colspan="3"><textarea name="menuName" rows="5" cols="50" style="resize:none;"></textarea>
               </tr>
               <tr>
                  <th width="100px">재료명</th>
                  <td colspan="3"><textarea name="ingredient" rows="5" cols="50" style="resize:none;"></textarea>
               </tr>
               <tr>
                  <th width="100px">내용</th>
                  <td colspan="3"><textarea name="content" rows="5" cols="50" style="resize:none;"></textarea>
               </tr>
            </table>
            
            <!-- 파일 업로드 하는 부분 -->
            <div id="fileArea">
               <input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
               <input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
               <input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
               <input type="file" id="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)">
            </div>
            <script>
               // 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
               $(function(){
                  $("#fileArea").hide();      
                  
                  $("#titleImgArea").click(function(){
                     $("#thumbnailImg1").click();
                  });
                  $("#contentImgArea1").click(function(){
                     $("#thumbnailImg2").click();
                  });
                  $("#contentImgArea2").click(function(){
                     $("#thumbnailImg3").click();
                  });
                  $("#contentImgArea3").click(function(){
                     $("#thumbnailImg4").click();
                  });
               });
               

               function LoadImg(value, num){
                  if(value.files && value.files[0]){      
                     var reader = new FileReader();   
                     
                     reader.onload = function(e){      
                        switch(num){
                        case 1: 
                           $("#titleImg").attr("src", e.target.result);   
                           break;               
                        case 2:                        
                           $("#contentImg1").attr("src", e.target.result);
                           break;
                        case 3: 
                           $("#contentImg2").attr("src", e.target.result);
                           break;
                        case 4:
                           $("#contentImg3").attr("src", e.target.result);
                           break;
                        }
                     }
                     
                     reader.readAsDataURL(value.files[0]);   
                           
                  }      
                           
                     
               }      

            </script>
            
         <div class="mb-4 text-end"> 
              <input type="submit" class="btn btn-outline-danger" id="submit" value="완료">             
              <input type="button" class="btn btn-outline-secondary" id="cancelBtn" onclick="history.back()" value="취소하기">
             </div>
         </div>
         <br>
      
      </form>
   </div>
<%@ include file = "../common/FooterTopBtn.jsp" %>
</body>
</html>