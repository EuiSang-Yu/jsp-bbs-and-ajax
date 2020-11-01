<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<!-- 초기화면 배율 설정-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!--구글폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">


<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!--아이콘-->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">

<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">


<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- css파일 불러오기-->
<link rel="stylesheet" href="CSS/login.css">
<!-- 

1) login.jsp : 로그인을 할때 보여지는 폼 화면

2) loginCommand : 실질적으로 값을 전달받아 처리하는 페이지

3) loginOK.jsp : 로그인 버튼 눌렀을때 결과를 알려주는 페이지 (로그인 완료)

4) thema.jsp : 저장된 값과 비교하여 로그인 기능을 처리하는 페이지

5) themaLoginCommand.java :

6) logout.jsp : 로그아웃 페이지

 -->


<title>OP.IT</title>
</head>
<body>
	<jsp:include page="thema.jsp" />

	<!-- 로그인 부분 -->
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<!--  로그인 왼쪽 이미지 -->
					<img src="img/1.png" alt="PNG">
				</div>
				<!-- 로그인 폼 -->
				<div class="login">
					<!-- method="post"는 POST 방식을 이용하여 URL 경로를 숨기는 기능 -->
					<form class="login100-form validate-form" action="loginOk.do"
						method="get">
						<span class="login100-form-title"> <!-- 제목 -->
							<p class="loginfont" style="font-size: 40px;">OP.IT 로그인</p>
						</span>

						<div class="wrap-input100 validate-input">
							<input class="input100" type="text" name="user_id"
								placeholder="아이디를 입력해주세요."> <span class="focus-input100"></span>
							<span class="symbol-input100"> <!-- 아이디 아이콘 --> <i
								class="fa fa-envelope" aria-hidden="true"></i>
							</span>
						</div>

						<div class="wrap-input100 validate-input"
							data-validate="Password is required">
							<input class="input100" type="password" name="user_pw"
								placeholder="비밀번호를 입력해주세요."> <span
								class="focus-input100"></span> <span class="symbol-input100">
								<i class="fa fa-lock" aria-hidden="true"></i> <!-- 비밀번호 아이콘 -->
							</span>
						</div>

						<div class="container-login100-form-btn">
							<button type="submit" class="login100-form-btn">로그인</button>
						</div>
						<br>
						<div class="text-center p-t-12">
							<a class="txt1" href="idSearch.do"> 아이디찾기 </a> <a class="txt2"
								href="pwSearch.do"> 비밀번호 찾기 </a>
						</div>
						<!-- 카카오 로그인 -->
						<a id="kakao-login-btn"></a> <a
							href="http://developers.kakao.com/logout"></a>
						<script type='text/javascript'>
							// 사용할 앱의 JavaScript 키를 설정해 주세요.
							Kakao.init('50e0127f513ee387d3b10a3312f2fb89'); //카카오개발자홈페이지에서 발급받은 자바스크립트 키를 입력함
							// 카카오 로그인 버튼을 생성합니다.
							Kakao.Auth.createLoginButton({
								container : '#kakao-login-btn',
								success : function(authObj) {
									alert(JSON.stringify(authObj));
							         Kakao.API.request({
							        	 
							               url: '/v1/user/me',
							 
							               success: function(res) { //res가 참일때, 자료를 성공적으로 보냈을때 출력되는 부분
							 
							                     console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
							 
							                     console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
							 
							                     console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
							                             
							                     // res.properties.nickname으로도 접근 가능 )
							                     console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
							          
							         
							          var kakaonickname = res.properties.nickname;    //카카오톡 닉네임을 변수에 저장
							          var kakaoe_mail = res.properties.kaccount_email;    //카카오톡 이메일을 변수에 저장함
							         
							          
							 
							          //카카오톡의 닉네임과,mail을 url에 담아 같이 페이지를 이동한다.
							          window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/hansub_project/home?kakaonickname="+kakaonickname+"&kakaoe_mail="+kakaoe_mail);
							      
							                   }
							                 })
							               },
								},
								fail : function(err) {
									alert(JSON.stringify(err));
								}
							});
							//]]>
						</script>

						<div class="text-center p-t-136">
							<a class="txt3" href="signUp.jsp"> 계정생성 <i
								class="fas fa-arrow-right aria-hidden="true"></i>
							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="footer.jsp" />




</body>
</html>


