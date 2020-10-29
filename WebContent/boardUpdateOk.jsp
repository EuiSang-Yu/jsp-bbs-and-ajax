<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("수정에 실패하였습니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("수정에 성공하였습니다.");
			location.href = "boardView.do?board_id=${param.board_id}&board_champion=${param.board_champion }";
		</script>
	</c:otherwise>
</c:choose>