<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<!-- 초기화면 배율 설정-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--구글폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!-- css파일 불러오기-->
<link rel="stylesheet" href="CSS/logincss.css">

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




<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="CSS/logincss.css">



<title>OP.IT</title>
</head>
<body>
	<jsp:include page="thema.jsp"/>

	<!-- 로그인 부분 -->
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="img/champion.png" alt="IMG">
					<!--  로그인 왼쪽 이미지 -->
				</div>
				<!-- 로그인 폼 -->
				<form class="login100-form validate-form">
					<span class="login100-form-title"> <!-- 제목 -->
						<p class="loginfont" style="font-size: 40px;">OP.IT 로그인</p>
					</span>

					<div class="wrap-input100 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="email"
							placeholder="아이디를 입력해주세요."> <span class="focus-input100"></span>
						<span class="symbol-input100"> <!-- 아이디 아이콘 --> <i
							class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<input class="input100" type="password" name="pass"
							placeholder="비밀번호를 입력해주세요."> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fa fa-lock"
							aria-hidden="true"></i> <!-- 비밀번호 아이콘 -->
						</span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">로그인</button>
					</div>

					<div class="text-center p-t-12">
						<a class="txt1" href="#"> 아이디찾기 </a> <a class="txt2" href="#">
							비밀번호 찾기 </a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt3" href="#"> 계정생성 <i
							class="fas fa-arrow-right aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>


<jsp:include page="footer.jsp" />




</body>
</html>


