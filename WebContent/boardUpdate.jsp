<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %> 
<<<<<<< HEAD

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>게시글 수정하기</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style>
#writeSubmit {
	float: right;
}

</style>

</head>
<body>

=======
<%
	BoardDTO [] arr = (BoardDTO [])request.getAttribute("list"); 
%>

<%
	if(arr == null || arr.length == 0){
%>

<script>
	alert("해당 정보가 삭제되거나 없습니다.");
	history.back();
</script>

<%
		return;
	}	// end if
%>
<%
	int no = arr[0].getBoard_no();
	String memberId = arr[0].getBoard_memberId();
	String title = arr[0].getBoard_title();
	String content = arr[0].getBoard_content();
	int viewCnt = arr[0].getBoard_viewCnt();
	String regdate = arr[0].getboard_regDate();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>게시글 수정하기</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style>
#writeSubmit {
	float: right;
}

</style>

</head>

<script>
	function chkSubmit(){
		frm = document.forms['frm'];
		var subject = frm["subject"].value.trim();
		
		if(subject == ""){
			alert("제목은 반드시 작성해야 합니다");
			frm["subject"].focus();
			return false;
		}
		return true;	
	}
</script>
<body>

	<jsp:include page="thema.jsp"/>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h2 class="text-center">게시글 수정하기</h2>
			<form action="boardUpdateOk.do" method="GET" onsubmit="return chkSubmit()">
				<input type="hidden" name="no" value="<%= no %>">
				<table class="table table-striped">
					<tr>
						<td>제목</td>
						<td><input type="text" class="form-control" name="title" value="<%= title %>"/></td>
					</tr>
					
					<tr>
	                	<td>글내용</td>
	                	<td><textarea rows="10" cols="50" name="content" class="form-control"><%=content %></textarea></td>
	            	</tr>
	            	
	            	<tr>
		                <td colspan="2"  class="text-center">
		                    <button type="button"  class="btn btn-primary" id="listBtn" onclick="location.href='boardListTables.jsp'">전체 게시글보기</button>
		                    <input type="submit" value="글쓰기" class="btn btn-success" id="writeSubmit" onclick="alert('작성완료')">
		                </td>
	            	</tr>
				</table>
			</form>
		</div>
	</div>
<<<<<<< HEAD
=======
</div>
>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git
>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git
</body>
</html>