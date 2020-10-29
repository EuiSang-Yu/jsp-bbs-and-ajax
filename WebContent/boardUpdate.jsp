<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 저보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
</c:choose>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>게시글 수정하기-${list[0].subject }</title>

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


<jsp:include page="thema.jsp" />


<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h2 class="text-center">게시글 수정하기</h2>
		<form action="boardUpdateOk.do" method="GET"
			onsubmit="return chkSubmit()">
			<input type="hidden" name="board_id" value="<%=id%>">
			<table class="table table-striped">
				<tr>
					<td>제목</td>
					<td><input type="text" class="form-control" name="board_title"
						value="<%=title%>" /></td>
				</tr>

				<tr>
					<td>글내용</td>
					<td><textarea rows="10" cols="50" name="board_content"
							class="form-control"><%=content%></textarea></td>
				</tr>

				<tr>
					<td colspan="2" class="text-center">
						<button type="button" class="btn btn-primary" id="listBtn"
							onclick="location.href='boardListTables.jsp'">전체 게시글보기</button>
						<input type="submit" value="수정하기" class="btn btn-success"
							id="updateSubmit" onclick="alert('작성완료')">
					</td>
				</tr>
			</table>
		</form>
	</div>

</div>







</body>
</html>