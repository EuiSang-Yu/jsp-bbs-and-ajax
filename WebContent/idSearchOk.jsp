<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String user_id = (String)request.getAttribute("result"); %>

<%System.out.print("jsp 파일 user_id :"+ user_id); %>


<% if(user_id == ""){ %>
<script>
	alert('찾으실 아이디가 없습니다.');
	history.back();
</script>
<%}else{ %>
<script>
	alert("회원님의 아이디는 <%=user_id %> 입니다.");
	location.href = 'login.do';
</script>
<%} %>
