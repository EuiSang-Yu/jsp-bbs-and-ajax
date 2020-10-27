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
<jsp:include page="thema.jsp"/>
<div class="container">
<h1 id="champTitle">챔피언 공략 게시판</h1>
<h3 id="champSubTitle">챔피언을 선택해 주세요</h3>

<c:forEach var="i" begin="1" end="145">

<div class="championList">
<<<<<<< HEAD
	<form action="noticeListNT.do?champ=${i }" method="POST">
	   <button type="submit">
	      <img class="championListImg" src="img/championImg/RiotX_ChampionList_${i }.jpg" alt="">
	   </button>
   </form>
=======
	<a href="noticeListNT.do?champ=${i }">
		<img class="championListImg" src="img/championImg/RiotX_ChampionList_${i }.jpg" alt="">
	</a>
</div>

</c:forEach>
>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git
</div>

</c:forEach>
</div>


</body>




</html>