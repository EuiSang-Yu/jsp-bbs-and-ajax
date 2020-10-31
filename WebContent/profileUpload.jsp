<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<meta http-equiv="refresh" content="10">

<c:choose>
	<c:when test="${user_profileImage == '' || user_profileImage == null }">
	
		${user_profileImage == 'defaultProfile2.png'}
		
	</c:when>
	<c:otherwise>
		<script>
			
			alert("프로필 사진 업로드에 성공하였습니다.");
			location.href = "myPage.do";
		</script>
	</c:otherwise>
</c:choose>