<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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

	<!-- 로고 , 로그인, 회원가입 버튼 -->
	<header>
		<div class="container">
			<div id="headerMain">
				<p class="logo">OP.IT</p>

				<img src="img/logoimg.png" class="logoimg">

				<button type="button" class="btn btn-outline-dark">회원가입</button>
				<button type="button" class="btn btn-outline-dark">로그인</button>

			</div>
		</div>
	</header>

	<!-- 메뉴바 -->
		
	<section>
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark sticky-top">
			<a class="navbar-brand" style="font-size: 30px;">OP.IT</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">

					<div class="menu">
						<li class="nav-item"><a class="nav-link" href="#">챔피언 공략</a></li>
					</div>
					<div class="menu">
						<li class="nav-item"><a class="nav-link" href="#">My page</a></li>
					</div>
					<div class="menu">
						<li class="nav-item"><a class="nav-link" href="#">League
								of legend 홈페이지</a></li>
					</div>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search"
						placeholder="소환사를 검색해보세요." aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
				</form>
			</div>
		</nav>
	</section>

	</section>



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






</body>
</html>


