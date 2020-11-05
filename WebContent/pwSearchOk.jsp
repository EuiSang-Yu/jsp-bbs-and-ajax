<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String user_pw = (String)request.getAttribute("user_pw"); %>

<%System.out.print("user_pw :"+ user_pw); %>


<% if(user_pw == ""){ %>
<script>
	alert('찾으실 비밀번호가 없습니다.');
	history.back();
</script>
<%}else{ %>
<script>
	alert("회원님의 비밀번호는 <%=user_pw %> 입니다.");
	location.href = 'login.do';
</script>
<%} %>


