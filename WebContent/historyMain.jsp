<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>전적 검색 페이지</title>
<link rel="stylesheet" href="CSS/historyMain.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<%-- search_id : name값 --%>
	<%
		String search_id = (String) request.getAttribute("search_id");
	%>


	<jsp:include page="thema.jsp" />

	<div class="container">

		<!-- 소환사 기본정보 -->
		<div id="summoner">
			<%-- 
			소환사의 기본정보 : 닉네임, 레벨, 랭크(?승?패) -> 이번시즌 
			--%>
			<div id="summoner_img">
				
			</div>
			<div id="summoner_info">
				
			</div>
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


	<script>
		
		// 전적 검색창에 입력한 아이디
		search_id = "<%=search_id%>";
		// 라이엇 공식 API발급키
		api_key = "RGAPI-8f48b1b1-8ddd-46ba-8abd-cfc81e6a7075";
		
		// summoner info
		id = "";
		accountId = "";
		puuid = "";
		profileIconId = "";
		IconPath = "";
		summonerLevel = "";
		cnt = 0;
		
		// league info
		soloLeagueId = "";
		soloQueueType= "";
		soloTier= "";
		soloRank= "";
		soloSummonerName= "";
		soloLeaguePoints= "";
		soloWins= "";
		soloLosses= "";
		
		flexLeagueId= "";
		flexQueueType= "";
		flexTier= "";
		flexRank= "";
		flexSummonerName= "";
		flexLeaguePoints= "";
		flexWins= "";
		flexLosses= "";

		
		//소환사 기본정보 json url
		summonerUrl = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"	+ search_id + "?api_key=" + api_key;
		
		//해당 소환사의 랭크(솔로,자유) 정보 url
		leagueUrl = "";
		//해당 소환사 최근 게임 url
		matchListUrl = "";
		
		ajaxDefault();
		if(cnt == 2){
			ajax(matchListUrl);
		}
		
		function ajaxDefault(){
			$.ajax({
				type : "GET",
				url : summonerUrl,
				cache : false,
				dataType : "JSON",
				success : function(data, status) {
					if (status == "success")
						parseJSON(data);
					cnt = cnt + 1;
					ajax(leagueUrl);
				},
				error : function(xhr, status, error) {
					alert("에러 발생");
				}
			});
		}
		

		function parseJSON(jsonObj) {
			// 기본정보 셋팅
			// summoner info
			if (id == "")
				id = jsonObj.id;
			if (accountId == "")
				accountId = jsonObj.accountId;
			if (puuid == "")
				puuid = jsonObj.puuid;
			if (profileIconId == "")
				profileIconId = jsonObj.profileIconId;
			if (summonerLevel == "")
				summonerLevel = jsonObj.summonerLevel;
			if (IconPath == null || IconPath == "") {
				IconPath = "https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/profile-icons/"
						+ profileIconId + ".jpg";
				$("#summoner_img").append("<img src='" + IconPath + "'>");
			}

			if (cnt != 0) {
				// league info
				// solo(개인랭크)
				if (soloLeagueId == "")	soloLeagueId = jsonObj[1].leagueId;
				if (soloQueueType == "") soloQueueType = jsonObj[1].queueType;
				if (soloTier == "")	soloTier = jsonObj[1].tier;
				if (soloRank == "")	soloRank = jsonObj[1].rank;
				if (soloSummonerName == "")	soloSummonerName = jsonObj[1].summonerName;
				if (soloLeaguePoints == "")	soloLeaguePoints = jsonObj[1].leaguePoints;
				if (soloWins == "")	soloWins = jsonObj[1].wins;
				if (soloLosses == "") soloLosses = jsonObj[1].losses;

				// flex(자유랭크)
				if (flexLeagueId == "")
					flexLeagueId = jsonObj[0].leagueId;
				if (flexQueueType == "")
					flexQueueType = jsonObj[0].queueType;
				if (flexTier == "")
					flexTier = jsonObj[0].tier;
				if (flexRank == "")
					flexRank = jsonObj[0].rank;
				if (flexSummonerName == "")
					flexSummonerName = jsonObj[0].summonerName;
				if (flexLeaguePoints == "")
					flexLeaguePoints = jsonObj[0].leaguePoints;
				if (flexWins == "")
					flexWins = jsonObj[0].wins;
				if (flexLosses == "")
					flexLosses = jsonObj[0].losses;
			}

			// URL 요소 셋팅
			if (leagueUrl == "")
				leagueUrl = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/"
						+ id + "?api_key=" + api_key;
			if (matchListUrl == "")
				matchListUrl = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/"
						+ accountId
						+ "?season=13&endIndex=10&beginIndex=0&api_key="
						+ api_key; // 시즌수정요망

			if (cnt == 0) {
				alert("해당유저 고유ID값 : " + id);
				alert("해당유저 고유accountID값 : " + accountId);
				alert("해당유저 puuid값 : " + puuid);
				alert("해당유저 profileIconId값 : " + profileIconId);
			}

			if (cnt == 1) {
				alert("sololeagueId : " + soloLeagueId);
				alert("soloqueueType : " + soloQueueType);
				alert("solotier : " + soloTier);
				alert("solorank : " + soloRank);
				alert("solosummonerName : " + soloSummonerName);
				alert("sololeaguePoints : " + soloLeaguePoints);
				alert("solowins : " + soloWins);
				alert("sololosses : " + soloLosses);
			}
			
			//$("#summoner_info").append(obj);
		}

		function ajax(info_url) {
			$.ajax({
				type : "GET",
				url : info_url,
				cache : false,
				dataType : "JSON",
				success : function(data, status) {
					if (status == "success"){
						parseJSON(data);
						cnt = cnt + 1;
					}
				},
				error : function(xhr, status, error) {
					alert("에러 발생");
				}
			});
		}
	</script>

</body>
</html>