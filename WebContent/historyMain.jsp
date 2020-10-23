<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>전적 검색 페이지</title>
<link rel="stylesheet" href="CSS/historyMain.css"/>
</head>
<body>
	<jsp:include page="thema.jsp"/>
	
	<div class="container">
	
	<!-- 소환사 기본정보 -->
	<div id="summoner">
		<%-- 
			소환사의 기본정보 : 닉네임, 레벨, 랭크(?승?패) -> 이번시즌 
		--%>
		
		
	</div>
	
	<div class="league">
		<!-- 소환사 솔로랭크 정보 -->
		<div id="leagueSolo">
			<%-- 
				솔로랭크 : 랭킹:519,988위(33%), 리그: 솔로랭크5X5, 등급:PLATINUM IV, 리그포인트:36, 승급전:-, 12전 6승 6패(50.00%)
			--%>
			
			
		</div>
		
		<!-- 소환사 자유랭크 정보 -->
		<div id="leagueFree">
			<%-- 
				자유랭크 : 랭킹:519,988위(33%), 리그: 자유랭크5X5, 등급:SILVER IV, 리그포인트:72, 승급전:진행중, , 112전 49승 63패(43.75%)
			--%>
			
			
		</div>
	</div>
	
	
	<!-- 모스트 챔피언 정보 -->
	<div id="leagueMost">
		<%-- 
																S2020 전체(2020시즌)  
				메뉴 - 챔피언 	게임수 	승률	 	KDA 	킬 		데스 		어시스트 	CS 		평균골드 		트리플킬 	쿼드라킬 	펜타킬 	승 	패
					   아칼리	29		44.82 	1.88	12.6	9.2		4.6		149.7	12,721		8		0		1		13	16				
		--%>
		
		
	</div>
	
	<!-- 최근 플레이한 게임 -->
	<div id="recentPlay">
		<%-- 
																	<최근 게임 목록>  
				메뉴 - 승/패 	챔피언 	타입	 	KDA 		킬관여율 		S/R 		팀 					아이템 			LV/GOLD/CS 		플레이타임 		와드 
					   승		럭스		랭크 		평점5.00		28%			점멸/점화		가렌/야스오...등		몰락/도란검...		레벨9				15분 19초		2	
					   						2/1/3																	골드5,562			3일 전
					   																								CS103
		--%>
		
		
	</div>


</div>
</body>
</html>