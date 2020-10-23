<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery 의존한다 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>OP_IT</title>

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

.container{
	margin-bottom: 100px;
}

</style>

</head>
<body>

<div class="container">

	<div id="champImg">챔피언 배너 사진</div>
	<div id="champInfo">챔피언 정보</div>
	<div id="champVideo">챔피언 유튜브</div>

</div>

<jsp:include page="noticeListNT.jsp"/>

</body>
</html>