<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

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
#writeBtn{
	float: right;
}


</style>
</head>

<body>
    <div class="container">
		<table class="table table-bordered table-hover" id="noticeListTable">
                <tr>
                    <th>추천수</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>작성자</th>
                    <th>작성날짜</th>
                    <th>조회수</th>
                </tr>
                
                <tr>
                    <td>1</td>
                    <td>가렌 공략법</td>
                    <td>D점멸을 쓰세요</td>
                    <td>팽이가렌</td>
                    <td>2020-10-23</td>
                    <td>2</td>
                </tr>
		</table>
            <a href="noticeWrite.jsp" class="btn btn-outline-dark" id="writeBtn">작성하기</a>
	</div>
            

</body>

<script>
$(document).ready(function(){
	$("#noticeListTable tr:nth-of-type(2)").click(function(){
		location.href="noticeView.jsp";
	});
});
</script>



</html>