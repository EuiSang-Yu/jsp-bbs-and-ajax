<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>OP.IT</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!--구글폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Noto+Sans+KR&display=swap"
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



<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="CSS/myPageNoLogin.css" />
</head>
<body>
<jsp:include page="thema.jsp"></jsp:include>

<div class="container">
	<div class="outer">
		<div class="goLogin">
			<div class="loginNeed">
			<h4>로그인이 필요한 기능입니다.<br>로그인 하시겠습니까?</h4>
			</div>
			<div class="inner">
				<button type="button" id="loginYesOrNoBtn" class="btn btn-secondary" onclick="location.href='index.jsp'">Cancel</button>
				<button type="button" id="loginYesOrNoBtn" class="btn btn-primary" onclick="location.href='login.do'">OK</button>			
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>