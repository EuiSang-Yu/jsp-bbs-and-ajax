<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- 초기화면 배율 설정-->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css"
	rel="stylesheet">


<!--구글폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">


<!-- css파일 불러오기-->

<link rel="stylesheet" href="CSS/signup.css">

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


<title>OP.IT</title>
</head>
<body>

<jsp:include page="thema.jsp"/>

	<!-- 회원가입 폼 -->
	<section class="signup">
		<!-- 휴대폰번호 입력제한 -->
		<script>
			$(document).ready(function() {
				$('#phone-number').mask('000-0000-0000');
			})
		</script>
		<!-- 전체 div -->

		<div class="registration-form">

			<form action="signupOk.do" method="get">
				<div class="form-icon" style="background-color: #C8C7ED">
					<span><i class="icon icon-user"></i></span>

				</div>
				<div class="form-group">
					<input type="text" class="form-control item" id="userID"
						placeholder="UserID" name="member_id">
				</div>
				<div class="form-group">
					<input type="password" class="form-control item" id="password"
						placeholder="Password" name="member_pw">
				</div>
				<div class="form-group">
					<input type="text" class="form-control item" id="username"
						placeholder="UserName" name="member_name">
				</div>
				<div class="form-group">
					<input type="text" class="form-control item" id="email"
						placeholder="Email" name="member_email">
				</div>
				<div class="form-group">
					<input type="text" class="form-control item" id="phone-number"
						placeholder="Phone Number" name="member_phone">
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-block create-account" >계정
						생성</button>
				</div>

			</form>
			<div class="social-media">
				<h5>SNS 계정으로 회원가입 하기</h5>
				<div class="social-icons">
					<a href="#"><i class="icon-social-facebook" title="Facebook"></i></a>
					<a href="#"><i class="icon-social-google" title="Google"></i></a> <a
						href="#"><i class="icon-social-twitter" title="Twitter"></i></a>
				</div>
			</div>
		</div>

	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>
