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

thead tr th {
	color: #686868;
}

#listBtn {
	float: right;
}
</style>

</head>
<body>
<jsp:include page="thema.jsp"/>

<div class="container">
<h1>가렌 잘하는 법</h1>
<br><br><br><br>

<table class="table">
	<thead>
		<tr class="row">
			<th class="col-sm-2">챔피언공략</th>
			<th class="col-sm-2">2020-10-24</th>
			<th class="col-sm-5">팽이가렌</th>
			<th class="col-sm-1">조회 2</th>
			<th class="col-sm-1">댓글 1</th>
			<th class="col-sm-1">조회 1</th>
		</tr>
	</thead>
	
	<tbody>
		<tr class="row">
			<td colspan="6">내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다</td>
		</tr>
	</tbody>
</table>
<hr>

<jsp:include page="comment.jsp"/>

<a href="noticeListCP.jsp" class="btn btn-outline-dark" id="listBtn">목록</a>
</div>
</body>
</html>