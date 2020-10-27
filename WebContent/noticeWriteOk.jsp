<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>


<%  // Controller 로부터 결과 데이터 받음.
	int cnt = (Integer)request.getAttribute("result");
%>


<% if(cnt == 0){ %>
	<script>
		alert("등록실패 !!!");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("등록 성공, 리스트를 출력합니다");
<<<<<<< HEAD
		location.href = "noticeListNT.jsp";
=======
		location.href = "noticeListNT.do";
>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git
	</script>
<% } %>