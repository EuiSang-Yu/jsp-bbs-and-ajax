<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- 초기화면 배율 설정-->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css"
	rel="stylesheet">


<!--구글폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">


<!-- css파일 불러오기-->

<link rel="stylesheet" href="CSS/signup.css">

<!--아이콘-->



<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<title>OP.IT</title>
</head>
<body>

<jsp:include page="thema.jsp"/>

	<!-- 회원가입 폼 -->
	<section class="signup">
		<script>
		//모든 공백 체크 정규식
		var empJ = /\s/g;
		//아이디 정규식
	
		// 비밀번호 정규식
		var pwJ = /^[A-Za-z0-9]{4,12}$/; 
		// 이름 정규식
		var nameJ = /^[가-힣]{2,6}$/;



		//휴대폰번호 입력제한 
		$(document).on("keyup", "#phone-number", function() {
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3")
					.replace("--", "-") );
			}
		
		);
		$('#userID').blur(function(){
		var idJ = /^[a-zA-Z0-9]$/;
			if(idJ.test($('#userID').val())){
				alert("true");
			}else{
				alert("false");
				
			}
			
		});
		
		
        // Self-executing function
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();

		</script>
		<!-- 전체 div -->

		<div class="registration-form">

			<form action="signupOk.do" class = "needs-validation" method="post" novalidate>
				<div class="form-icon" style="background-color: #C8C7ED">
					<span><i class="icon icon-user"></i></span>

				</div>
				<div class="form-group">
					<input type="text" class="form-control item" id="userID" minlength="5" maxlength="15"
					 placeholder="UserID" name="user_id" required>
						<div class="invalid-feedback" id="iderrMsg">아이디를 입력 해 주세요.</div>
				</div>
				<div class="form-group">
					<input type="password" class="form-control item" id="password" minlength="5" maxlength="15"
					placeholder="Password" name="user_pw" required>
						<div class="invalid-feedback" id="pwerrMsg">비밀번호를 입력 해 주세요.</div>
				</div>
				<div class="form-group">
					<input type="text" class="form-control item" id="username" minlength="2" maxlength="10"
					placeholder="UserName" name="user_name" required>
						<div class="invalid-feedback" id="nameerrMsg">이름을 입력 해 주세요.</div>
				</div>
				<div class="form-group">
					<input type="email" class="form-control item" id="email"
					placeholder="Email" name="user_email" required>
						<div class="invalid-feedback" id="emailerrMsg">이메일을 입력 해 주세요.</div>
				</div>
				<div class="form-group">
					<input type="tel" class="form-control item" id="phone-number" 
					placeholder="Phone Number" name="user_phone" required>
						<div class="invalid-feedback" id="phoneerrMsg">전화번호를 입력 해 주세요.</div>
				</div>

				<div class="form-group">
					<button type="submit" id ="chkBT" class="btn btn-block create-account" >계정
						생성</button>
				</div>

			</form>
			<div class="social-media">
	
				</div>
			</div>
		</div>

	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>
