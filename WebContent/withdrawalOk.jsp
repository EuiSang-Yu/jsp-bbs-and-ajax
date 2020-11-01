<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("회원탈퇴에 실패하였습니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("회원탈퇴에 성공하였습니다.");
		</script>
	</c:otherwise>
</c:choose>

	<%
	session.invalidate();
	System.out.print("유저 세션 종료");
	%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 완료페이지</title>
<link rel="stylesheet" href="CSS/withdrawalOk.css" />
</head>
<body>
	<jsp:include page="thema.jsp"/>
	
<div class="container">

	<div class="message">
		<h2>회원탈퇴가 완료되었습니다.</h2>	
	</div>
	<div id="withdrawalOkView">	
		<img src="" alt="여기에 이미지 추가" />	
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>