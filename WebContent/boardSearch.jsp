<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String user_id = (String)session.getAttribute("user_id");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title></title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap">
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="~/Content/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css"  />
<script src="/Content/bootstrap-select/bootstrap-select.min.js" ></script>



<style>
#writeBtn {
	float: right;
}

.board_menu {
	border: none;
}

#noticeListTable {
	margin-top: 100px;
	width: 100%;
	table-layout: fixed;
}

#searchKind{
	height:30px;
}

#searchForm{
	float: right;
	margin-top: 100px;
	margin-bottom: 60px;
}

</style>
</head>

<body>


	<jsp:include page="boardListChamp.jsp" />
	

	<div class="container">
		
		<form id="searchForm" action="boardSearch.do">
		<input type="hidden" name="board_champion" value="${board_champion }"/>
		
		<select id="searchKindId" class="selectpicker" name="searchKind">
    		<option value="board_title">제목</option>
			<option value="board_writer">작성자</option>
		</select>
		
		<input type="text" name="searchText"/>
		<input type="submit" value="찾기"/>
		</form>
		
		<table class="table table-bordered table-hover" id="noticeListTable">
			<tr>
				<th>추천순</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성날짜</th>
			</tr>

			<c:choose>
				<c:when test="${empty searchList || fn:length(searchList) == 0 }">
				</c:when>

				<c:otherwise>
					<c:forEach var="dto" items="${searchList }">
						
						<tr>
							<td><a class="board_menu"
								href="boardView.do?board_id=${dto.board_likeCnt}&board_champion=${dto.board_champion }">${dto.board_likeCnt }</a></td>
							<td><a class="board_menu"
								href="boardView.do?board_id=${dto.board_id}&board_champion=${dto.board_champion }">${dto.board_title }</a></td>
							<td><a class="board_menu"
								href="boardView.do?board_id=${dto.board_id}&board_champion=${dto.board_champion }">${dto.board_writer }</a></td>
							<td><a class="board_menu"
								href="boardView.do?board_id=${dto.board_id}&board_champion=${dto.board_champion }">${dto.board_viewCnt }</a></td>
							<td><a class="board_menu"
								href="boardView.do?board_id=${dto.board_id}&board_champion=${dto.board_champion }">${dto.board_regDate }</a></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

		<a href="boardWrite.do?board_champion=${board_champion }"
			class="btn btn-outline-dark" id="writeBtn">작성하기</a>

	</div>


</body>



</html>