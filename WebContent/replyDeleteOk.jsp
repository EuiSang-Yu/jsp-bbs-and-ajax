<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%  // Controller 로부터 결과 데이터 받음.
	int cnt = (Integer)request.getAttribute("result");
%>


<% if(cnt == 0){ %>
	<script>
		alert("삭제 실패 !!!");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("삭제 성공 !!!");
		location.href = "boardView.do?board_id=${board_id}&board_champion=${board_champion }";
	</script>
<% } %>