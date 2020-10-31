<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String user_id = request.getAttribute("user_id")+""; %>

<%System.out.print(user_id); %>
<script>
	alert(<%=user_id %>);
	location.href = 'login.do';
</script>

