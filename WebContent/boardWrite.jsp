<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %> 
<%@ page import="com.command.*" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OP.IT</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>

<style>
#writeSubmit {
	float: right;
}

</style>

</head>
<body>



<jsp:include page="thema.jsp"/>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">게시글 쓰기</h2>

        <form action="boardWriteOk.do" method="GET">
          <table class="table table-striped">
            <tr>
                <td>제목</td>
                <td><input type="text"  class="form-control" name="board_title"></td>
            </tr>
             
            <tr>
                <td>글내용</td>
                <td><textarea rows="10" cols="50" name="board_content" class="form-control"></textarea></td>
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
 
 
<script>
//CKEDITOR 적용 

 
</script>
</body>
</html>