<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Insert title here</title>
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