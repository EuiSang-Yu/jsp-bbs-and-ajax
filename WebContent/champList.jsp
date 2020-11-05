<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String user_id = (String)session.getAttribute("user_id");
%>

<c:set var="championKey" value="<%= new int [] {
86,
3,
41,
79,
104,
150,
267,
75,
111,
56,
20,
76,
518,
122,
131,
119,
13,
497,
33,
99,
68,
58,
89,
421,
107,
236,
876,
11,
57,
90,
54,
82,
25,
36,
21,
432,
110,
254,
45,
67,
161,
106,
201,
63,
8,
53,
112,
78,
14,
517,
35,
235,
113,
875,
37,
16,
98,
102,
50,
72,
15,
5,
134,
27,
412,
103,
32,
136,
427,
268,
84,
266,
523,
12,
1,
34,
22,
157,
245,
60,
62,
516,
61,
2,
777,
83,
77,
6,
19,
350,
39,
28,
81,
420,
59,
498,
143,
154,
40,
24,
238,
101,
126,
142,
115,
202,
26,
222,
31,
43,
164,
38,
30,
69,
145,
121,
55,
429,
85,
51,
141,
10,
96,
42,
133,
240,
246,
203,
44,
91,
163,
223,
48,
18,
23,
4,
29,
17,
555,
80,
9,
114,
105,
74,
120
} %>"/>


<!DOCTYPE html>
<html lang="ko">
<head>
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

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OP.IT</title>
<style>
.championList {
	float: left;
	margin: 10px;
}

.championList:hover img {
	opacity: 0.7;
}

#champTitle {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

#champSubTitle {
	margin: 20px;
	text-align: center;
}

.clear{
	clear: both;
}

</style>
</head>
<body>
	<jsp:include page="thema.jsp" />
	<div class="container">
		<h1 id="champTitle">챔피언 공략 게시판</h1>
		<h3 id="champSubTitle">챔피언을 선택해 주세요</h3>

		<c:forEach var="i"  begin="0" end="144" varStatus="status">

			<div class="championList">
				<a href="boardListTable.do?board_champion=${championKey[i] }">
					<img class="championListImg"
						src="img/championImg/RiotX_ChampionList${championKey[i] }.jpg" alt="">
				</a>
			</div>

		</c:forEach>
		<div class="clear"></div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>



</html>
<<<<<<< HEAD
=======
 
>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git
