<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>OP.IT</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    


<style>

#champImg {
	width:100%;
	height:500px;
	background-color: red;
	margin-top: 100px;
	margin-bottom: 50px;
}

#champInfo {
	width: 48%;
	height: 400px;
	background-color: blue;
	float: left;
}

#champVideo {
	width: 48%;
	height: 400px;
	margin-left:4%;
	background-color: yellow;
	float: left;
}

#champInfoDiv{
	margin-bottom: 100px;
}

</style>

</head>
<body>
<jsp:include page="thema.jsp"/>
<div class="container" id="champInfoDiv">

	<div id="champImg">챔피언 배너 사진</div>
	<div id="champInfo">챔피언 정보</div>
	<div id="champVideo">챔피언 유튜브</div>

</div>



</body>
</html>