<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- 초기화면 배율 설정-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--구글폰트ㅇ-->
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
   <section class="menubar">
      <nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
         <a class="navbar-brand" style="font-size: 30px;">OP.IT</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
         </button>
         <!-- 상단메뉴 -->
         <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
               <div class="menu">
                  <li class="nav-item"><a class="nav-link" href="champList.jsp">챔피언 공략</a></li>
               </div>
               <div class="menu">
                  <li class="nav-item"><a class="nav-link" href="#">My page</a></li>
               </div>
               <div class="menu">
                  <li class="nav-item"><a class="nav-link"
                     href="https://na.leagueoflegends.com/ko-kr/">League of legend
                        홈페이지</a></li>
               </div>
            </ul>
         </div>
      </nav>
   </section>





   <!-- 백그라운드 영상  -->
   <section class="video">
      <div class="overlay"></div>
      <video playsinline="playsinline" autoplay="autoplay" muted="muted"
         loop="loop">
         <source src="img/kda-worlds-login.mp4" type="video/mp4">
      </video>

      <!-- 전적검색창 -->

      <div class="container h-100">
         <div class="d-flex justify-content-center h-100">
            <div class="search">
               <input class="search_input" type="text" name=""
                  placeholder="소환사명을 입력해주세요 .."> <a href="#"
                  class="search_icon"><i class="fa fa-search"></i></a>
            </div>
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
               <p>이익! 릴리아의 목소리로 패치를 들어보세요!</p>
               <p>잠들 시간~｜10.21 TFT 패치노트 하이라이트 - 전략적 팀 전투</p>
            </div>
            <div class="youtube">
               <iframe width="500" height="325"
                  src="https://www.youtube.com/embed/OS7imLFzn0Y" frameborder="0"
                  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                  allowfullscreen></iframe>
               <p>사미라 챔피언 집중탐구 | 게임플레이 - 리그 오브 레전드</p>
            </div>

            <p class="mb-0"></p>
         </div>
      </div>

   </section>
   <!-- 푸터 -->
   <footer>
   <div class="container">
   
   <p>© 2012-2020 OP.GG. OP.GG isn’t endorsed by Riot Games and doesn’t reflect the views or opinions of Riot Games or anyone officially involved in producing or managing League of Legends. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc. League of Legends © Riot Games, Inc.
   </p>
   </div>
    </footer>
   
   
   
</body>
</html>