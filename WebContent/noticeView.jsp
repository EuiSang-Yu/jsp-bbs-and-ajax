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

thead tr th {
	color: #686868;
}

#writeBtn {
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
			<th class="col-sm-1">챔피언공략</th>
			<th class="col-sm-1">2020-10-24</th>
			<th class="col-sm-7">팽이가렌</th>
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
<hr style="height: 1px; background-color: gray;">
<jsp:include page="comment.jsp"/>
<hr style="height: 1px; background-color: gray;">
<a href="noticeListCP.jsp" class="btn btn-default" id="writeBtn">목록</a>
</div>
</body>
</html>