<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- 초기화면 배율 설정-->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--구글폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">


<!-- css파일 불러오기-->
<link rel="stylesheet" href="CSS/thema.css">

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
				<a href="index.jsp"><p class="logo">OP.IT</p></a>
				
				<%
	// 현재 로그인 상태인지 확인
	if(session.getAttribute("user_id") != null){	
		
	String userid = (String)session.getAttribute("user_id");
%>

				<button id="signupBT" type="button" class="btn btn-outline-dark"
					onclick="location.href='logout.jsp'">로그아웃</button>
				<button id="loginBT" type="button" class="btn btn-outline-dark"
					onclick="location.href='login.jsp'"> 님 </button>

<%
	} else {
		
%>
				<button id="signupBT" type="button" class="btn btn-outline-dark"
					onclick="location.href='signUp.jsp'">회원가입</button>
				<button id="loginBT" type="button" class="btn btn-outline-dark"
					onclick="location.href='login.jsp'">로그인</button>
<%				} %>


			</div>
		</div>
	</header>

	<!-- 메뉴바 -->

	<section>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
			<a class="navbar-brand"><img src="img/menuicon.png"
				class="menuicon"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">

					<div class="menu">
						<li class="nav-item"><a class="nav-link" href="champList.jsp">챔피언
								공략</a></li>
					</div>
					<div class="menu">
						<li class="nav-item"><a class="nav-link" href="myPage.jsp">My
								page</a></li>
					</div>
					<div class="menu">
						<li class="nav-item"><a class="nav-link"
							href="https://na.leagueoflegends.com/ko-kr/">League of legend
								홈페이지</a></li>

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




</body>
</html>