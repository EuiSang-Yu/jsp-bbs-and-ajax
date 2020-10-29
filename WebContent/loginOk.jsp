<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>



<%  
	int cnt = (Integer)request.getAttribute("result");
	String user_id = request.getAttribute("user_id")+"";
%>



<% if(cnt == 0){ %>
	<script>
		alert("로그인 실패 !!!");
		history.back();
	</script>
<% } else { 
		session.setAttribute("user_id", user_id);
		System.out.print("유저 세션 생성");
%>
	<script>
		alert("로그인 성공 !!!");
		location.href = "index.jsp";
	</script>
		
<%

} %>