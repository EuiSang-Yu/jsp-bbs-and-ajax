<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% String champion_no = request.getParameter("champion_no"); %>

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
<jsp:include page="noticeListCP.jsp"/>
    <div class="container">
		<table class="table table-bordered table-hover" id="noticeListTable">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>조회수</th>
                    <th>작성날짜</th>
                </tr>
                
		<c:choose>
			<c:when test="${empty list || fn:length(list) == 0 }">
			</c:when>

			<c:otherwise>
				<c:forEach var="dto" items="${list }">  <%-- request.getAttribute("list") --%>
					<tr>
						<td><a href="noticeView.do?uid=${dto.board_no }">${dto.board_no }</a></td>
						<td><a href="noticeView.do?uid=${dto.board_no }">${dto.board_title }</a></td>
						<td><a href="noticeView.do?uid=${dto.board_no }">${dto.board_content }</a></td>
						<td><a href="noticeView.do?uid=${dto.board_no }">${dto.board_viewCnt }</a></td>
						<td><a href="noticeView.do?uid=${dto.board_no }">${dto.board_regDate }</a></td>
					
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
            <a href="noticeWrite.do" class="btn btn-outline-dark" id="writeBtn">작성하기</a>
	</div>
            

</body>




</html>