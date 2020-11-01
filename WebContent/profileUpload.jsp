<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<c:choose>
	<c:when test="${user_profileImage == '' || user_profileImage == null }">
		<script>
			alert("프로필 사진이 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			
			alert("프로필 사진 업로드에 성공하였습니다.");
			setTimeout(() => {
	            location.href = "myPage.do";            
	         }, 2000);
		</script>
	</c:otherwise>
</c:choose>