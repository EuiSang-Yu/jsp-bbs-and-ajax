<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>

<!-- 초기화면 배율 설정-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- css파일 불러오기-->
<link rel="stylesheet" href="CSS/logincss.css">

<!--아이콘-->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!--구글폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">


<link rel="stylesheet" type="text/css" href="CSS/idSearchCss.css">



<title>OP.IT</title>
</head>
<body>

<jsp:include page="thema.jsp"/>



	<!-- 로그인 부분 -->
	
		<div class="container-login100"id="idSearchDiv">
			<div class="wrap-login100" id="idSearch">
				<!-- 로그인 폼 -->
				<form class="login100-form validate-form" id="idSearchForm" action="idSearchOk.do" method="POST">
					<span class="login100-form-title"> <!-- 제목 -->
						<p class="loginfont"  style="font-size: 40px;">아이디 찾기</p>
					</span>

					<div class="wrap-input100 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="user_name"
							placeholder="이름을 입력해주세요."> <span class="focus-input100"></span>
						<span class="symbol-input100"> <!-- 아이디 아이콘 --> <i class="fas fa-portrait"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="user_phone"
							placeholder="전화번호를 입력해주세요."> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fas fa-phone"></i>
						</span>
					</div>
					
					<div class="text-center p-t-12">
						<button type="submit" class="btn btn-secondary">아이디찾기</button>
							
					</div>
				</form>
				
			</div>
		</div>
	






</body>
</html>


