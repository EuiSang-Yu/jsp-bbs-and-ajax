<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<script>

function chkDelete(uid){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'deleteOk.do?uid=' + uid;
	}
} // chkDelete

</script>

<body>
<jsp:include page="thema.jsp"/>

<div class="container">
<h1>${list[0].board_title }</h1>
<br><br><br><br>

<table class="table">
	<thead>
		<tr class="row">
			<th class="col-sm-2">챔피언 공략</th>
			<th class="col-sm-2">${list[0].board_no }</th>
			<th class="col-sm-5">${list[0].board_title }</th>
			<th class="col-sm-1">${list[0].board_regDate }</th>
			<th class="col-sm-1">댓글</th>
			<th class="col-sm-1">${list[0].board_viewCnt }</th>
		</tr>
	</thead>
	
	<tbody>
		<tr class="row">
			<td colspan="6">${list[0].content }</td>
		</tr>
	</tbody>
</table>
<hr>

<jsp:include page="comment.jsp"/>

<a href="boardListTable.do" class="btn btn-outline-dark" id="listBtn">목록</a>
</div>
</body>
</html>