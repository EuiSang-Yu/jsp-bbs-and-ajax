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


<!--구글폰트ㅇ-->
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">


<!-- css파일 불러오기-->

<link rel="stylesheet" href="CSS/signupcss.css">

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

			<form>
				<div class="form-icon" style="background-color: #C8C7ED">
					<span><i class="icon icon-user" ></i></span>
					
				</div>
				<div class="form-group">
					<input type="text" class="form-control item" id="userID"
						placeholder="UserID">
				</div>
				<div class="form-group">
					<input type="password" class="form-control item" id="password"
						placeholder="Password">
				</div>
				<div class="form-group">
					<input type="text" class="form-control item" id="username"
						placeholder="UserName">
				</div>
				<div class="form-group">
					<input type="text" class="form-control item" id="email"
						placeholder="Email">
				</div>
				<div class="form-group">
					<input type="text" class="form-control item" id="phone-number"
						placeholder="Phone Number">
				</div>

				<div class="form-group">
					<button type="button" class="btn btn-block create-account">계정 생성
						</button>
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
</body>
</html>
