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

		<div id="league">
			<!-- 소환사 솔로랭크 정보 -->
			<div id="leagueSolo">
				<%-- 
					솔로랭크 : 랭킹:519,988위(33%), 리그: 솔로랭크5X5, 등급:PLATINUM IV, 리그포인트:36, 승급전:-, 12전 6승 6패(50.00%)
				--%>
				

			</div>

			<!-- 소환사 자유랭크 정보 -->
			<div id="leagueFlex">
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
		api_key = "RGAPI-4f07ac49-ca95-4ccd-b608-a8428582be65";
		
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
		soloSummonerId= "";
		soloSummonerName= "";
		soloLeaguePoints= "";
		soloWins= "";
		soloLosses= "";
		
		flexLeagueId= "";
		flexQueueType= "";
		flexTier= "";
		flexRank= "";
		flexSummonerId = "";
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
		//해당 소환사 모스트 챔피언 url(숙련도기준)
		champion_masteryUrl = "";
		
		ajaxDefault();
		if(cnt == 2){
			ajax(matchListUrl);
		}
		else if(cnt == 3){
			ajax(champion_masteryUrl);
		}
		
		
		function ajaxDefault(){
			$.ajax({
				//async:false,
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
				IconPath = "https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/profile-icons/" + profileIconId + ".jpg";
				$("#summoner_img").append("<img src='" + IconPath + "'>"); // 이미지태그에 이미지추가
			}
			
			
			// 정보를 가져올 URL 요소 셋팅
			if (leagueUrl == ""){
				leagueUrl = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/" + id + "?api_key=" + api_key;
			}
			if (matchListUrl == ""){
				matchListUrl = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/" + accountId + "?season=13&endIndex=10&beginIndex=0&api_key=" + api_key; // 시즌
			}
			if (champion_masteryUrl == ""){
				champion_masteryUrl = "https://kr.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/"  + soloSummonerId + "?api_key=" + api_key;
			}
			
			
						
			// 리그정보까지 확인되었을때 구현
			if (cnt == 1) {
				// league info
				// solo(개인랭크)
				if(jsonObj[0] != null && jsonObj[0] != ""){
					if (soloLeagueId == "")	soloLeagueId = jsonObj[0].leagueId;
					if (soloQueueType == "") soloQueueType = jsonObj[0].queueType;
					if (soloTier == "")	soloTier = jsonObj[0].tier;
					if (soloRank == "")	soloRank = jsonObj[0].rank;
					if (soloSummonerId == "")	soloSummonerId = jsonObj[0].soloSummonerId;
					if (soloSummonerName == "")	soloSummonerName = jsonObj[0].summonerName;
					if (soloLeaguePoints == "")	soloLeaguePoints = jsonObj[0].leaguePoints;
					if (soloWins == "")	soloWins = jsonObj[0].wins;
					if (soloLosses == "") soloLosses = jsonObj[0].losses;
				}
				// flex(자유랭크)
				if(jsonObj[1] != null && jsonObj[1] != ""){
					if (flexLeagueId == "")	flexLeagueId = jsonObj[1].leagueId;
					if (flexQueueType == "") flexQueueType = jsonObj[1].queueType;
					if (flexTier == "") flexTier = jsonObj[1].tier;
					if (flexRank == "")	flexRank = jsonObj[1].rank;
					if (flexSummonerId == "")	flexSummonerId = jsonObj[1].flexSummonerId;
					if (flexSummonerName == "")	flexSummonerName = jsonObj[1].summonerName;
					if (flexLeaguePoints == "")	flexLeaguePoints = jsonObj[1].leaguePoints;
					if (flexWins == "")	flexWins = jsonObj[1].wins;
					if (flexLosses == "") flexLosses = jsonObj[1].losses;
				}
				// 전적검색 페이지 최상단 기본 정보 추가
				$("#summoner_info").append(
						"<h3>"+soloSummonerName+"</h3><br>"
						+"<h7>레벨: "+summonerLevel+"</h7>"
						+"<h7> 랭크: " +soloWins+"승 "+soloLosses+"패" + "</h7>"
						);
				
				
				// 해당 소환사 티어에맞는 티어엠블럼 이미지 추가
				soloChk=0;
				flexChk=0;
				var tierArr = ["IRON", "BRONZE", "SILVER", "GOLD", "PLATINUM", "DIAMOND", "MASTER", "GRANDMASTER", "CHALLENGER"];
				var tierPath = "img/rank_emblems/";
				for(var i=0; i< tierArr.length; i++){
					if(tierArr[i] == soloTier){ $("#leagueSolo").append("<img src='" + tierPath + tierArr[i] +".png'>"); soloChk = 1; }
					if(tierArr[i] == flexTier){ $("#leagueFlex").append("<img src='" + tierPath + tierArr[i] +".png'>"); flexChk = 1; }
				}
				if(soloChk == 0) { $("#leagueSolo").append("<img src='" + tierPath + "UNRANKED" +".png'>"); } 
				if(flexChk == 0) { $("#leagueFlex").append("<img src='" + tierPath + "UNRANKED" +".png'>"); } 
				
				
				// 해당 소환사 솔로,자유 랭크 정보추가
				if(soloChk != 0){
					$("#leagueSolo").append(
							"<div id='soloInfo'>" 
							+ "랭킹: ??? " + "<br>"
							+ "리그: " + soloQueueType + "<br><br>"
							+ "등급: " + soloTier + " " + soloRank + "<br>"
							+ "리그포인트: "+ soloLeaguePoints +"<br>"
							+ "승급전 여부: "+  + "<br>"
							+ "</div>");
				}
				if(flexChk != 0){
					$("#leagueFlex").append(
							"<div id='flexInfo'>" 
							+ "랭킹: ??? " + "<br>"
							+ "리그: " + flexQueueType + "<br><br>"
							+ "등급: " + flexTier + " " + flexRank + "<br>"
							+ "리그포인트: "+ flexLeaguePoints +"<br>"
							+ "승급전 여부: "+  + "<br>"
							+ "</div>")
				}
				
				
			}
			
			
			// 매치정보까지 확인되었을때 구현
			if(cnt == 2){
				
				
			}

			
			
		}

		
		function ajax(info_url) {
			$.ajax({
				//async:false, // 순서가 한번씩 바뀌어서나오는문제 해결필요
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