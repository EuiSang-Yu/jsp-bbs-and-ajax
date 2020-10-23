<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- 초기화면 배율 설정-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--구글폰트-->
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">




<!-- css파일 불러오기-->
<link rel="stylesheet" href="CSS/themacss.css">

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
<title>Insert title here</title>
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
                  <li class="nav-item"><a class="nav-link" href="#">챔피언 공략</a></li>
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


</body>
</html>