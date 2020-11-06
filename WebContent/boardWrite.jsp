<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dao.*"%>
<%@ page import="dto.*"%>
<%@ page import="com.command.*"%>
<%
	String user_id = (String)session.getAttribute("user_id");
%>
<c:choose>
	<c:when test="${empty user_id }">
		<script>
			alert("로그인이 필요합니다.")
			location.href = "login.do";
		</script>
	</c:when>
	<c:otherwise>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="ckeditor/ckeditor.js"></script>
<title>OP.IT</title>
<!--구글폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">


<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>



<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>

<style>
#writeSubmit {
	float: right;
}
</style>

</head>

<script>
	function chkSubmit() {
		frm = document.forms["frm"];

		var board_title = frm["board_title"].value.trim();

		if (board_title == "") {
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
			<h2 class="text-center">게시글 쓰기</h2>
			<form name="frm" action="boardWriteOk.do" method="POST">
				<input type="hidden" name="board_champion"
					value="${board_champion }">
				<div class="table table-responsive">
					<table class="table table-striped">
						<tr>
							<td class="danger">작성자</td>
							<td></td>
							<td class="danger">작성일</td>
							<td></td>
						</tr>
						<tr>
							<td class="danger">제목</td>
							<td colspan="3"><input type="text" class="form-control"
								name="board_title" value=""></td>
						</tr>


						<tr>
							<td class="danger">글내용</td>
							<td colspan="3"><textarea name="board_content"
									class="form-control" id="editor1"></textarea> <script>
										//CKEDITOR 적용
									CKEDITOR
									.replace(
													'editor1',
												{
												allowedContent : true, // HTML 태그 자동삭제 방지 설정
												width : '1000px', // 최초 너비, 높이 지정 가능
												height : '400px',
												filebrowserUploadUrl : '${pageContext.request.contextPath}/BoardFileUpload.do'
														});
									</script></td>
						</tr>

						<tr>
							<td colspan="4" class="text-center"><input type="submit"
								value="글쓰기" class="btn btn-success" id="writeSubmit">
								<button type="button" class="btn btn-primary" id="listBtn"
									onclick="location.href='boardListTable.do?board_champion=${board_champion }'">
									전체 게시물 보기</button></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
	<!-- 
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">게시글 쓰기</h2>
		
		
        <form action="boardWriteOk.do" method="GET">
		<input type="hidden" name="board_champion" value="${board_champion }">
          <table class="table table-striped">
            <tr>
                <td>제목</td>
                <td><input type="text"  class="form-control" name="board_title"></td>
            </tr>
             
            <tr>
                <td>글내용</td>
                <td><textarea rows="10" cols="50" class="form-control" name="board_content"></textarea></td>
            </tr>
            <tr>
                 
                <td colspan="2"  class="text-center">
                    <button type="button"  class="btn btn-primary" id="listBtn" onclick="location.href='boardListTable.do?board_champion=${board_champion }'">전체 게시글보기</button>



                    <input type="submit" value="글쓰기" class="btn btn-success" id="writeSubmit">
                </td>
            </tr>
             
          </table>
        </form>
    </div>
</div>

 -->


</body>
</html>

	</c:otherwise>
</c:choose>   