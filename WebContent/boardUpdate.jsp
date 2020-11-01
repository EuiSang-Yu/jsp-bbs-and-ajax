<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String user_id = (String)session.getAttribute("user_id");
	
	System.out.println(user_id);
%>
<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 저보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${list[0].board_writer != user_id }">
		<script>
			alert("본인이 작성한 글이 아닙니다.")
			history.back();
		</script>
	</c:when>
	
	<c:when test="${empty user_id }">
		<script>
			alert("로그인이 필요합니다.")
			location.href="login.do";
		</script>
	</c:when>
	<c:otherwise>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>게시글 수정하기-${list[0].board_title }</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style>
#writeSubmit {
	float: right;
}
</style>

</head>

<script>
function chkSubmit(){
	frm = document.forms["frm"];
	
	var board_title = frm["board_title"].value.trim();
	
	if(board_title == "") {
		alert("제목을 반드시 작성해야 합니다");
		frm["board_title"].focus();
		return false;
	}
	return true;
} // end chkSubmit()
</script>

<body>

<jsp:include page="thema.jsp" />


<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h2 class="text-center">게시글 수정하기</h2>
		<form name="frm" action="boardUpdateOk.do" method="GET"
			onsubmit="return chkSubmit()">
			<input type="hidden" name="board_id" value="${list[0].board_id }">
			<input type="hidden" name="board_champion" value="${list[0].board_champion }">
			<table class="table table-striped">
				<tr>
					<td>제목</td>
					<td><input type="text" class="form-control" name="board_title"
						value="${list[0].board_title }" /></td>
				</tr>

				<tr>
					<td>글내용</td>
					<td><textarea rows="10" cols="50" name="board_content"
							class="form-control">${list[0].board_content }</textarea></td>
				</tr>

				<tr>
					<td colspan="2" class="text-center">
						<button type="button" class="btn btn-primary" id="listBtn"
							onclick="location.href='boardListTable.do?board_champion=${list[0].board_champion}'">전체 게시글보기</button>
						<input type="submit" value="수정하기" class="btn btn-success"
							id="updateSubmit" onclick="alert('수정완료')">
					</td>
				</tr>
			</table>
		</form>
	</div>

</div>


</body>
</html>

	</c:otherwise>
</c:choose>