<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/withdrawal.css" />
</head>
<body>
<jsp:include page="thema.jsp"></jsp:include>

<div class="container">
	<div class="outer">
		<div class="goWithdrawal">
			<div class="withdrawalNeed">
			<h4>회원탈퇴를 신청하였습니다.<br>회원탈퇴 하시겠습니까?</h4>
			</div>
			<div class="inner">
				<button type="button" id="withdrawalYesOrNoBtn" class="btn btn-secondary">Cancel</button>
				<button type="button" id="withdrawalYesOrNoBtn" class="btn btn-primary">OK</button>			
			</div>
		</div>
	</div>
</div>
</body>
</html>