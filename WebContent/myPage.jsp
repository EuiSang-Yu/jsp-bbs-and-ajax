<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/myPageCss.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<title>Insert title here</title>
</head>
<body>
<!-- 공통 header+nav -->
<jsp:include page="thema.jsp"/>


<section class="container profile">
	<!-- 프로필사진설정 박스 -->
	<div class="card" style="width:500px">
   		<img class="card-img-top" src="img/defaultProfile2.png" alt="Card image" style="width:100%">
   		<div class="card-body">
     		<h4 class="card-title">프로필 사진 설정</h4>
     		<p id="profileRoute" class="card-text">파일 경로가 떠야함(첨부한 파일경로)</p>
     		<label id="profilePhotoChange" class="btn btn-primary btn-secondary btn-file">파일추가 <input type="file" style="display: none;"></label>
   		</div>
 	</div>
 	
 	<!-- 개인정보관리 박스 -->
 	<div id="profile2" class="container">
    	<div class="row">
    		<div class="col-sm-12 text-center">
    			
     	<div class="col-sm-1 text-center" id="emptyspace"><br></div>
    			<div class="col-sm-10 text-center" id="joinform">
    				<h2>개인정보관리</h2>
               		<form  method="post">
                  		<table class="table table-boardered">
                     		<tr>
                        		<th>User ID</th>
                        		<td><input type="text" class="form-control" name="id"
                           		placeholder="id를 넣으세요"></td>
                     		</tr>
                     		<tr>
                        		<th>User PassWord</th>
                        		<td><input type="password" class="form-control"
                           		name="pass1" placeholder="비밀번호는 영문만 넣어주세요"></td>
                     		</tr>
		                     <tr>
		                        <th>User Name</th>
	                        	<td><input type="password" class="form-control"
	                           	name="pass2"></td>
		                     </tr>
		                     <tr>
		                        <th>User Email</th>
		                        <td><input type="email" class="form-control" name="email"></td>
		                     </tr>
		                     <tr>
		                        <th>User PhoneNumber</th>
		                        <td><input type="tel" class="form-control" name="tel"></td>
		                     </tr>
		                     <tr>
		                        <td colspan="2">
		                        <input type="submit" class="btn btn-primary btn-secondary" value="변경하기">
		                        <input type="submit" class="btn btn-secondary" value="탈퇴하기"></td>
		                     </tr>
                  		</table>
               		</form>
            	</div>
    		</div>
   		 </div>
	</div>
</section>

   
</body>
</html>