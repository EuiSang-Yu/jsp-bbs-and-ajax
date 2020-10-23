<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>OP.IT</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style>
*{
	margin: 0;
	padding: 0;
}

.commentCntDiv{
	background-color: lightgray;
	width: 100%;
	height: 100px;
	margin-bottom: 50px;
	margin-top: 100px;
}
.commentTxt1 {
	float: left;
	font-size: 30px;
	margin-top: 30px;
	margin-left: 20px;
}
.commentTxt2 {
	float: left;
	font-size: 20px; 
	margin-top: 35px;
	margin-left: 20px;
}

#commentHr{
	background-color: gray;
	height: 1px;
}

</style>

</head>
<body>


	<div class="commentCntDiv">
		<p class="commentTxt1">댓글</p>
		<p class="commentTxt2">총 0개</p>
	</div>
	
	<h3>최신순</h3>
	<hr id="commentHr">
	<div class="comment"></div>

</body>
</html>