<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
.board_menu{
	border: none;
}

</style>
</head>

<body>
<jsp:include page="boardListChamp.jsp"/>
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
				<form id="frm_list" action="boardView.do?board_no=${dto.board_no}" method="get">
					<c:forEach var="dto" items="${list }">  <%-- request.getAttribute("list") --%>
							<tr>
								<td><button class="board_menu" type="submit">${dto.board_no }</button></td>
								<td><button class="board_menu" type="submit">${dto.board_title }</button></td>
								<td><button class="board_menu" type="submit">${dto.board_content }</button></td>
								<td><button class="board_menu" type="submit">${dto.board_viewCnt }</button></td>
								<td><button class="board_menu" type="submit">${dto.board_regDate }</button></td>
							</tr>
					</c:forEach>
				</form>
			</c:otherwise>
		</c:choose>
		</table>
            <a href="boardWrite.do" class="btn btn-outline-dark" id="writeBtn">작성하기</a>
	</div>
            

</body>




</html>