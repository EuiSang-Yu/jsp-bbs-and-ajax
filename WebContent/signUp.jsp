<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>  
  <!--  <jsp:include page="Header.jsp" /> -->
  <!-- 초기화면 배율 설정-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--구글폰트-->
<link
   href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap"
   rel="stylesheet">


<!-- css파일 불러오기-->
<link rel="stylesheet" href="CSS/opit.css">

<!--아이콘-->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>


<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">

<meta charset="UTF-8">
 </head>    
 <body>
     <div class="container">
    <div class="row">
    <div class="col-sm-12 text-center" >
    <div class="col-sm-3"></div>
     
    <div class="col-sm-6">
    <h2>회원가입</h2>
					<form  method="post">
						<table class="table table-boardered">
							<tr>
								<th>아이디</th>
								<td><input type="text" class="form-control" name="id"
									placeholder="id를 넣으세요"></td>
							</tr>
							<tr>
								<th>패스워드</th>
								<td><input type="password" class="form-control"
									name="pass1" placeholder="비밀번호는 영문만 넣어주세요"></td>
							</tr>

							<tr>
								<th>패스워드확인</th>
								<td><input type="password" class="form-control"
									name="pass2"></td>
							</tr>

							<tr>
								<th>이메일</th>
								<td><input type="email" class="form-control" name="email"></td>
							</tr>

							<tr>
								<th>전화번호</th>
								<td><input type="tel" class="form-control" name="tel"></td>
							</tr>

							<tr>
								<th>주소</th>
								<td><input type="text" class="form-control" name="address"></td>
							</tr>


							<tr>
								<td colspan="2"><input type="submit"
									class="btn btn-primary" value="전송"> <input type="reset"
									class="btn btn-danger" value="취소"></td>
							</tr>


						</table>
					</form>
				</div>
     
    </div>
    </div>
</div>
</body>
</html>