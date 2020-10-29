<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("user_id");
%>

<script>
alret("로그아웃 되었습니다. 감사합니다.");
location.href = "index.jsp";
</script>