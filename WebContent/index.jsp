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
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">


<!-- css파일 불러오기-->
<link rel="stylesheet" href="CSS/index.css">

<!--아이콘-->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<<<<<<< HEAD

<script src="index.js"></script>
=======
	
<script src="JS/index.js"></script>
>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git

<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">

<meta charset="UTF-8">
<title>OP.IT</title>

</head>
<body>

	<jsp:include page="thema.jsp" />





	<!-- 백그라운드 영상  -->
	<section class="video">
		<div class="overlay"></div>
		<video playsinline="playsinline" autoplay="autoplay" muted="muted"
			loop="loop">
			<source src="img/kda-worlds-login.mp4" type="video/mp4">
		</video>

		<!-- 전적검색창 -->
		<div class="container h-100">
			<div class="d-flex justify-content-center h-100 align-items-center">
				<form id="searchFrm" action="historyMain.jsp" method="GET">
					<div class="search">
<<<<<<< HEAD
						<input class="search_input" type="text" name=""
							placeholder="소환사명을 입력해주세요 .."> <a href="#"
							class="search_icon" onclick=""><i class="fa fa-search"></i></a>
					</div>
=======
						<input class="search_input" type="text" name="searchId"	
							placeholder="소환사명을 입력해주세요 .."> <button type="submit" class="search_icon"><i class="fa fa-search"></i></button>
					</div>				
>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git
				</form>
			</div>
		</div>
	</section>

	<!-- 유투브 부분 -->
	<section class="my-5">
		<div class="container">
			<div class="row">

				<div class="youtube">
					<iframe width="500" height="325"
						src="https://www.youtube.com/embed/MIl-H3NShvc" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
					<div class="youtubenote">
						<p class="note">게임 업데이트</p>
						<p class="note1">10.21 패치 노트 소식</p>
						<p class="youtubetag">
							이익! 릴리아의 목소리로 패치를 들어보세요!<br> 잠들 시간~｜10.21 TFT 패치노트 하이라이트 -
							전략적 팀 전투
						</p>
						<a href="https://www.youtube.com/channel/UCooLkG0FfrkPBQsSuC95L6w"><img
							src="img/youtube.png" class="youtubelogo"></a>League of Legends
						- Korea
						<button type="button" class="btn btn-dark"
							style="font-size: 14px;">자세히 보기</button>
					</div>
					<br>
				</div>
				<div class="youtube">
					<iframe width="500" height="325"
						src="https://www.youtube.com/embed/OS7imLFzn0Y" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
					<div class="youtubenote">
						<p class="note">신규 챔피언</p>
						<p class="note1">사미라: 사막의 장미</p>
						<p class="youtubetag">챔피언 집중탐구 | 게임플레이 - 리그 오브 레전드</p>

					</div>

				</div>
			</div>
		</div>

	</section>

<jsp:include page="footer.jsp" />


</body>
</html>