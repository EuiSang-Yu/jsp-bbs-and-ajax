<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<!-- 초기화면 배율 설정-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--구글폰트-->

<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">


<!-- css파일 불러오기-->
<link rel="stylesheet" href="CSS/signupOk.css">


<!--아이콘-->

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>





<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">

<meta charset="UTF-8">
<title>OP.IT</title>
</head>
<body>

	<jsp:include page="thema.jsp" />

<%  // Controller 로부터 결과 데이터 받음.
	int cnt = (Integer)request.getAttribute("result");
%>


<% if(cnt == 0){ %>
	<script>
		alert("회원정보를 입력해주세요.");
		history.back();
	</script>
<% } else { %>
	
	<section>
		<div id="signOk">
			<div class="container">
				<p>>> 회원가입 완료
			</div>
		</div>
		<hr>
	</section>
	<section class="my-5">
		<div id="signupCon">
			<div class="container">

				<h2 class="welcome">환영합니다!</h2>
				<div>
					<p class="signup">OP.IT 회원가입이 성공적으로 완료되었습니다!</p>
				</div>
				<br>
				<div>
					<p class="signupMemo">
						OP.IT 는 항상 회원님들의 입장에서 보다 좋은<br> 서비스를 받을 수 있도록 노력하겠습니다. <br>
						감사합니다.
					</p>
				</div>
				<br>
				<div align="center">
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='index.jsp'">메인으로</button>
					<button type="button" class="btn btn-secondary" onclick="location.href='login.do'">로그인</button>
				</div>
			</div>
		</div>

	</section>
<% } %>


	<jsp:include page="footer.jsp" />

</body>
</html>