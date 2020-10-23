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
<title>OP.IT</title>
<style>

.championList {
	float: left;
	margin: 10px;
}

.championList:hover img{
	opacity: 0.7;
}

#champTitle{
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

#champSubTitle {
	margin: 20px;
	text-align: center;
}

</style>
</head>
<body>

<div class="container">
<h1 id="champTitle">챔피언 공략 게시판</h1>
<h3 id="champSubTitle">챔피언을 선택해 주세요</h3>
<%
	for(int i = 0; i < 145; i++){
%>
<div class="championList">
	<a href="http://localhost:8080/OP_IT/noticeListCP.jsp">
		<img class="championListImg" src="img/championImg/RiotX_ChampionList_<%= (i+1) %>.jpg" alt="">
	</a>
</div>
<%
	}
%>
</div>



</body>




</html>