<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<button type="button" id="loginYesOrNoBtn" class="btn btn-secondary">Cancel</button>
				<button type="button" id="loginYesOrNoBtn" class="btn btn-primary">OK</button>			
			</div>
		</div>
	</div>
</div>
</body>
</html>