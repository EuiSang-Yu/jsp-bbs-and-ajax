<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!--
	  ,ad8888ba,   88888888ba        8888888888    	 888888888888888
	 d8"'    `"8b  88      "8b       	 88   			   888
	d8'        `8b 88      ,8P      	 d8          	   888
	88          88 88aaaaaa8P'      	 88                888
	88          88 88""""""'        	 88                888
	Y8,        ,8P 88               	 Y8                888
	 Y8a.    .a8P  88                	 Y8                888
	  `"Y8888Y"'   88       		 8888888888            888

	
	dev@op.it
-->


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
			<div id="summoner_img"></div>
			<div id="summoner_info"></div>
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


		<!-- 챔피언 숙련도 상위 10개  정보 -->
		<div id="champion_mastery">
			<%-- 
									숙련도 총합 : ?? 점
				[챔피언 이미지파일] 르블랑 							395,843 점 
				[챔피언 이미지파일] 자르반4세						185,200 점
							
			--%>
			<div id="mastery_img"></div>
			<div id="mastery_info"></div>

		</div>

		<!-- 최근 플레이한 게임 -->
		<div id="recentPlay">
			<%-- 
																	<최근 게임 목록>  
				메뉴 - 승/패 	챔피언 	타입	 		KDA 		S/R 		팀 					아이템 			LV/GOLD/CS 		
					   승		럭스		솔로랭크 		평점5.00		점멸/점화		가렌/야스오...등		몰락/도란검...		레벨9				
					   							2/1/3														골드5,562			
					   																						CS103
			--%>


		</div>

	</div>





	<script>
		
		// 전적 검색창에 입력한 아이디
		search_id = "<%=search_id%>";
		// 라이엇 공식 API발급키
		api_key = "RGAPI-d3f580d9-95f6-425a-b532-78dce0f48462";
		
		// summoner info //
		id = "";
		accountId = "";
		puuid = "";
		profileIconId = "";
		IconPath = "";
		summonerLevel = "";
		cnt = 0;
		
		// league info //
		// solo info
		soloLeagueId = "";
		soloQueueType= "";
		soloTier= "";
		soloRank= "";
		soloSummonerId= "";
		soloSummonerName= "";
		soloLeaguePoints= "";
		soloWins= "";
		soloLosses= "";
		// flex info
		flexLeagueId= "";
		flexQueueType= "";
		flexTier= "";
		flexRank= "";
		flexSummonerId = "";
		flexSummonerName= "";
		flexLeaguePoints= "";
		flexWins= "";
		flexLosses= "";
		
		// champion_mastery info //
		championId = new Array();
		championLevel= new Array();
		championPoints= new Array();
		summonerId= new Array(); //soloSummonerId 와 같음
		
		// matchlist 10개만 //
		mlist_gameId= new Array(); // 중요! --> 이 값으로 게임 자세한 정보 get
		mlist_champion= new Array(); // 해당소환사가 플레이한 챔피언 번호
		mlist_queue= new Array(); // 게임종류(일반,칼바람,솔랭,자유랭 등)
		mlist_timestamp= new Array(); //시간
		
		// 게임종류 이름 매핑(일반,칼바람,솔랭,자유랭 등)
		mapLabel = "";
		mapType = "";
		mapName = "";
		
		// matches 10개 //
		matches_gameMode= new Array(10); // URF, ARAM(칼바람), CLASSIC(일반,랭크겜) 
		matches_gameType= new Array(10);
		matches_teams = new Array(10); // 양 쪽 팀 정보 2차원배열 ㄱㄱ
		matches_participants = new Array(10);
		matches_participantIdentities = new Array(10); // 10명중에 한명한명 정보 2차원ㄱㄱ
		for (var i = 0; i < matches_gameMode.length; i++) { 
			matches_teams[i] = new Array();
			matches_participants[i] = new Array();
			matches_participantIdentities[i] = new Array();
		}
		
		
		//소환사 기본정보 json url
		summonerUrl = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"	+ search_id + "?api_key=" + api_key;
		//해당 소환사의 랭크(솔로,자유) 정보 url
		leagueUrl = "";
		//해당 소환사 모스트 챔피언 10개 url(숙련도기준)
		champion_masteryUrl = "";
		//해당 소환사 최근 게임 10판만 url
		matchListUrl = "";
		//검색한 게임 1판에 대한 정보 url
		matchesUrl = "";
		
		
		// 챔피언 번호 매핑 셋팅
		champMap = {
			1:'애니',
			2:'올라프',
		    3:'갈리오',
		    4:'트위스티드페이트',
		    5:'신짜오',
		    6:'우르곳',
		    7:'르블랑',
		    8:'블라디미르',
		    9:'피들스틱',
		    10:'케일',
		    11:'마스터 이',
		    12:'알리스타',
		    13:'라이즈',
		    14:'사이온',
		    15:'시비르',
		    16:'소라카',
		    17:'티모',
		    18:'트리스타나',
		    19:'워윅',
		    20:'누누와윌럼프',
		    21:'미스포춘',
		    22:'애쉬',
		    23:'트린다미어',
		    24:'잭스',
		    25:'모르가나',
		    26:'질리언',
		    27:'신지드',
		    28:'이블린',
		    29:'트위치',
		    30:'카서스',
		    31:'초가스',
		    32:'아무무',
		    33:'람머스',
		    34:'애니비아',
		    35:'샤코',
		    36:'문도박사',
		    37:'소나',
		    38:'카사딘',
		    39:'이렐리아',
		    40:'잔나',
		    41:'갱플랭크',
		    42:'코르키',
		    43:'카르마',
		    44:'타릭',
		    45:'베이가',
		    48:'트런들',
		    50:'스웨인',
		    51:'케이틀린',
		    53:'블리츠크랭크',
		    54:'말파이트',
		    55:'카타리나',
		    56:'녹턴',
		    57:'마오카이',
		    58:'레넥톤',
		    59:'자르반4세',
		    60:'엘리스',
		    61:'오리아나',
		    62:'오공',
		    63:'브랜드',
		    64:'리신',
		    67:'베인',
		    68:'럼블',
		    69:'카시오페아',
		    72:'스카너',
		    74:'하이머딩거',
		    75:'나서스',
		    76:'니달리',
		    77:'우디르',
		    78:'뽀삐',
		    79:'그라가스',
		    80:'판테온',
		    81:'이즈리얼',
		    82:'모데카이저',
		    83:'요릭',
		    84:'아칼리',
		    85:'케넨',
		    86:'가렌',
		    89:'레오나',
		    90:'말자하',
		    91:'탈론',
		    92:'리븐',
		    96:'코그모',
		    98:'쉔',
		    99:'럭스',
		    101:'제라스',
		    102:'쉬바나',
		    103:'아리',
		    104:'그레이브즈',
		    105:'피즈',
		    106:'볼리베어',
		    107:'렝가',
		    110:'바루스',
		    111:'노틸러스',
		    112:'빅토르',
		    113:'세주아니',
		    114:'피오라',
		    115:'직스',
		    117:'룰루',
		    119:'드레이븐',
		    120:'헤카림',
		    121:'카직스',
		    122:'다리우스',
		    126:'제이스',
		    127:'리산드라',
		    131:'다이애나',
		    133:'퀸',
		    134:'신드라',
		    136:'아우렐리온 솔',
		    141:'케인',
		    142:'조이',
		    143:'자이라',
		    145:'카이사',
		    147:'세라핀',
		    150:'나르',
		    154:'자크',
		    157:'야스오',
		    161:'벨코즈',
		    163:'탈리야',
		    164:'카밀',
		    201:'브라움',
		    202:'진',
		    203:'킨드레드',
		    222:'징크스',
		    223:'탐켄치',
		    235:'세나',
		    236:'루시안',
		    238:'제드',
		    240:'클레드',
		    245:'에코',
		    246:'키아나',
		    254:'바이',
		    266:'아트록스',
		    267:'나미',
		    268:'아지르',
		    350:'유미',
		    360:'사미라',
		    412:'쓰레쉬',
		    420:'일라오이',
		    421:'렉사이',
		    427:'아이번',
		    429:'칼리스타',
		    432:'바드',
		    497:'라칸',
		    498:'자야',
		    516:'오른',
		    517:'사일러스',
		    518:'니코',
		    523:'아펠리오스',
		    555:'파이크',
		    777:'요네',
		    875:'세트',
		    876:'릴리아'
		}
		
		
		
		// 처음 소환사 기본정보 및 다른정보 얻을 때 필요한 id값들 get
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
		
		// 나머지 모든 정보 get
		function ajax(info_url) {
			$.ajax({
				//async:false, // 순서가 한번씩 바뀌어서나오는문제 해결필요
				type : "GET",
				url : info_url,
				cache : false,
				dataType : "JSON",
				success : function(data, status) {
					//alert("cnt: "+cnt+"     info_url: "+info_url);
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
			
			
			// 리그정보까지 확인되었을때 구현
			if (cnt == 1) {
				// league info
				// solo(개인랭크)
				if(jsonObj[0] != null && jsonObj[0] != ""){
					if (soloLeagueId == "")	soloLeagueId = jsonObj[0].leagueId;
					if (soloQueueType == "") soloQueueType = jsonObj[0].queueType;
					if (soloTier == "")	soloTier = jsonObj[0].tier;
					if (soloRank == "")	soloRank = jsonObj[0].rank;
					if (soloSummonerId == "")	soloSummonerId = jsonObj[0].summonerId;
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
					if (flexSummonerId == "")	flexSummonerId = jsonObj[1].summonerId;
					if (flexSummonerName == "")	flexSummonerName = jsonObj[1].summonerName;
					if (flexLeaguePoints == "")	flexLeaguePoints = jsonObj[1].leaguePoints;
					if (flexWins == "")	flexWins = jsonObj[1].wins;
					if (flexLosses == "") flexLosses = jsonObj[1].losses;
				}
				
				
				
				// 전적검색 페이지 최상단 기본 정보 추가
				$("#summoner_info").append(
						"<br><h2><b>"+soloSummonerName+"</b></h2><br>"
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
							"<div id='soloInfo'><br>" 
							+ "랭킹: ??? " + "<br>"
							+ "리그: " + soloQueueType + "<br><br>"
							+ "등급: " + soloTier + " " + soloRank + "<br>"
							+ "리그포인트: "+ soloLeaguePoints +"<br>"
							+ "승급전 여부: "+  + "<br>"
							+ "</div>");
				}
				if(flexChk != 0){
					$("#leagueFlex").append(
							"<div id='flexInfo'><br>" 
							+ "랭킹: ??? " + "<br>"
							+ "리그: " + flexQueueType + "<br><br>"
							+ "등급: " + flexTier + " " + flexRank + "<br>"
							+ "리그포인트: "+ flexLeaguePoints +"<br>"
							+ "승급전 여부: "+  + "<br>"
							+ "</div>")
				}
				
				// 정보를 가져올 URL 요소 셋팅
				if (champion_masteryUrl == ""){
					champion_masteryUrl = "https://kr.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/" + soloSummonerId + "?api_key=" + api_key;
				}
				// 다음 정보 가지러 재귀호출
				ajax(champion_masteryUrl);
			}
			
			
			// 챔피언 마스터리(숙련도 탑 10개만)
			if(cnt == 2){
				var masteryPath = "img/champImg_mini/";
				for(var i=0; i< 10; i++){
					if (championId[i] == "") championId[i] = jsonObj[i].championId;
					if (championLevel[i] == "") championLevel[i] = jsonObj[i].championLevel;
					if (championPoints[i] == "") championPoints[i] = jsonObj[i].championPoints;						
					
					if(championId[i] != "undefined") {
						$("#mastery_img").append("<div class='mastery_imgs" + "'><img src='" + masteryPath + jsonObj[i].championId +".png'></div>");
						$("#mastery_info").append("<div class='mastery_infos'" + "'><b>" 
								+ champMap[(jsonObj[i].championId)] + "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b> <initLevel>레벨: " 
								+ jsonObj[i].championLevel + "&nbsp&nbsp&nbsp&nbsp&nbsp</initLevel> <initPoint>" 
								+ jsonObj[i].championPoints + "점</initPoint></div>" ); 
					}
				}
				
				// 정보를 가져올 URL 요소 셋팅
				if (matchListUrl == ""){
					matchListUrl = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/" + accountId + "?endIndex=5&beginIndex=0&api_key=" + api_key;
				}
				// 다음 정보 가지러 재귀호출
				ajax(matchListUrl);
			}
			
			
			// 매치리스트(20판) --> gameId 가져와야됨
			if(cnt == 3){
				for(var i=0; i < 5; i++){
					mlist_gameId[i] = jsonObj.matches[i].gameId 		// mlist_gameId[0] : 0번 인덱스에 있는 게임한판 전적
					mlist_champion[i] = jsonObj.matches[i].champion
					mlist_queue[i] = jsonObj.matches[i].queue // 게임종류(칼바람, 일반, 솔로랭크, 자유랭크, URF 등) 구분
					mlist_timestamp[i] = jsonObj.matches[i].timestamp
				}
				
				
				// 정보를 가져올 URL 요소 셋팅
				matchesCnt = 0;
				for(var i=0; i<10; i++){
					if (matchesUrl == ""){
						matchesUrl = "https://kr.api.riotgames.com/lol/match/v4/matches/" + mlist_gameId[i] + "?api_key=" + api_key;
					}
					// 다음 정보 가지러 재귀호출
					ajax(matchesUrl);
				}
				
			}

			
			
			// 매치 1게임 자세한 정보 -> gameId 기준
			if(cnt >= 4 && cnt <= 13){
				/* 
				matches_gameMode= new Array(10); // URF, ARAM(칼바람), CLASSIC(일반,랭크겜)  matches_teams[10][?]
				matches_gameType= new Array(10);
				matches_teams = new Array(10); // 양 쪽 팀 정보  2차원
				matches_participants = new Array(10); // 2차원
				matches_participantIdentities = new Array(); // 10명중에 한명한명 정보 2차원
				*/
				
				
				
			}
			
			
		}

		
		
		
		
		
		ajaxDefault(); // 첫 ajax(소환사 기본정도 고유id값들, 레벨 가져오고 시작해야됨!!)
		
		
	</script>




</body>
</html>