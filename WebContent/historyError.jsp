<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>전적 검색 페이지 에러</title>
<link rel="stylesheet" href="CSS/historyError.css" />
</head>
<body>
	<jsp:include page="thema.jsp"/>
	
	<div class="container">

		<div class="message">
			<h2>소환사의 이름을 찾을 수 없습니다. 확인 후 다시 검색 해 주세요!</h2>	
		</div>
		<div id="errorView">	
			<img src="" alt="여기에 이미지 추가" />	
	</div>
</div>
</body>
</html>