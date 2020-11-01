<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String user_pw = request.getAttribute("user_pw")+""; %>

<%System.out.print("user_pw :"+ user_pw); %>
<script>
	alert(<%=user_pw %>);
	location.href = 'login.do';
</script>

