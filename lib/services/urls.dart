import 'package:hoop/services/apikey/key.dart'; // get your own nba-Api key

class Urls {
  static final String _apiBaseUrl = "https://api-nba-v1.p.rapidapi.com";
  static final String _teamBaseUrl = "https://www.nba.com/";
  static final String _sioBaseUrl =
      "https://api.sportsdata.io/v3/nba/stats/json/";

  static String seasonsUrl = "$_apiBaseUrl/seasons/?rapidapi-key=${NbaApi.key}";

  static String getDivisionStandings(String division, String year) {
    return "$_apiBaseUrl/standings/standard/$year/division/$division/?rapidapi-key=${NbaApi.key}";
  }

  static String eastTeamsUrl =
      "$_apiBaseUrl/teams/confName/east/?rapidapi-key=${NbaApi.key}";
  static String westTeamsUrl =
      "$_apiBaseUrl/teams/confName/west/?rapidapi-key=${NbaApi.key}";
  static String seasonGames =
      "$_apiBaseUrl/games/league/standard/2019/?rapidapi-key=${NbaApi.key}";
  static String teamPlayersUrl(String id) =>
      "$_apiBaseUrl/players/teamId/$id/?rapidapi-key=${NbaApi.key}";
  static String link(String team) => _teamBaseUrl + team + "/";

  static String teamGoogleNewsSearch(String team) =>
      //"https://bing-news-search1.p.rapidapi.com/news/search?q=$team&freshness=Day&textFormat=Raw&safeSearch=Off?rapidapi-key=${NbaApi.key}";
      "https://google-search3.p.rapidapi.com/api/v1/news/q=$team?rapidapi-key=${GoogleSearchApi.key}";

  static String teamGoogleImageSearch(String team) =>
      "https://google-search3.p.rapidapi.com/api/v1/images/q=$team?rapidapi-key=${GoogleSearchApi.key}";

  static String getBingVideoSearch(String team) {
    return "https://api.bing.microsoft.com/v7.0/videos/search?q=$team";
  }

  static String sioTeam(String team) =>
      "$_sioBaseUrl/Players/$team?key=e26bf32a407a4c59bb1998de668ba83e";

  // nba data urls ////////////////////////////

  // Returns all usable APIs for today. Not used in the app, but kept here for reference.
  // "http://data.nba.net/10s/prod/v1/today.json"

  // Returns ALL nba games for the given year
  static String nbaFullSchedule(String year) =>
      "http://data.nba.net/10s/prod/v2/$year/schedule.json";

  // Returns all games for the specified TEAM in a given year
  static String nbaTeamSchedule(String teamId, String year) =>
      "http://data.nba.net/prod/v1/$year/teams/$teamId/schedule.json";

  // Returns a list of All teams
  static String nbaAllTeams() =>
      "http://data.nba.net/10s/prod/v2/2020/teams.json";

  // Returns basic data on a team
  static String nbaTeamProfile(String teamId) =>
      "https://www.nba.com/stats/feeds/teams/profile/${teamId}_TeamProfile.js";

  // Returns a list of ALL players in the league
  static String nbaAllPlayers() =>
      "http://data.nba.net/10s/prod/v1/2020/players.json";

  // Returns the team roster for the specified team
  static String nbaTeamRoster(String teamUrlCode) =>
      "http://data.nba.net/10s/prod/v1/2020/teams/$teamUrlCode/roster.json";

  // Returns team stats for all teams
  static String nbaTeamStats(String year) =>
      "http://data.nba.net/10s/prod/v1/$year/team_stats_rankings.json";

  // Returns team stat leaders for given team
  static String nbaTeamStatLeaders(String year, String team) =>
      "http://data.nba.net/10s/prod/v1/$year/teams/$team/leaders.json";

  // Returns player stats
  static String nbaPlayerStats(String season, String personId) =>
      "http://data.nba.net/prod/v1/$season/players/${personId}_profile.json";

  // Returns player transactions
  static String nbaPlayerMovement() =>
      "https://www.nba.com/stats/js/data/playermovement/NBA_Player_Movement.json";

  // Returns player bio
  static String nbaPlayerBio(String playerId) =>
      "http://data.nba.net/json/bios/player_$playerId.json";

  // Returns the box score for a specified game
  static String nbaBoxScore(String gameDate, String gameId) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_boxscore.json";

  // Returns the game book for a specified game
  static String nbaGameBook(String gameDate, String gameId) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_Book.pdf";

  // Returns the play by play for a game by period
  static String nbaPlayByPlay(String gameDate, String gameId, String period) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_pbp_$period.json";

  // Returns the preview article for a specified game
  static String nbaGamePreviewArticle(String gameDate, String gameId) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_preview_article.json";

  static String nbaGameRecapArticle(String gameDate, String gameId) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_recap_article.json";

  static String nbaConferenceStandings() =>
      "http://data.nba.net/10s/prod/v1/current/standings_conference.json";

  static String nbaDivisionStandings() =>
      "http://data.nba.net/10s//prod/v1/current/standings_division.json";

  static String nbaGamesToday() {
    DateTime today = new DateTime.now();
    if (today.hour > 12) {
      String year = today.year.toString();
      String month = today.month.toString().padLeft(2, '0');
      String day = today.day.toString();

      return "http://data.nba.net/10s/prod/v1/${year + month + day}/scoreboard.json";
    } else {
      DateTime yesterday = new DateTime.now().subtract(new Duration(days: 1));

      String year = yesterday.year.toString();
      String month = yesterday.month.toString().padLeft(2, '0');
      String day = yesterday.day.toString().padLeft(2, '0');

      return "http://data.nba.net/10s/prod/v1/${year + month + day}/scoreboard.json";
    }
    //return "http://data.nba.net/10s/prod/v1/20210111/scoreboard.json";
  }

  static String nbaGamesSelectedDate(String date) {
    return "http://data.nba.net/10s/prod/v1/$date/scoreboard.json";
  }

  static String nbaGamesDayMinusOne() {
    DateTime today = new DateTime.now();
    DateTime yesterday = today.subtract(new Duration(days: 1));
    String year = yesterday.year.toString();
    String month = yesterday.month.toString();
    String day = yesterday.day.toString();

    return "http://data.nba.net/10s/prod/v1/${year + month + day}/scoreboard.json";
  }

  static String nbaGamesDayMinusTwo() {
    DateTime today = new DateTime.now();
    DateTime prevDay = today.subtract(new Duration(days: 2));
    String year = prevDay.year.toString();
    String month = prevDay.month.toString();
    String day = prevDay.day.toString();

    return "http://data.nba.net/10s/prod/v1/${year + month + day}/scoreboard.json";
  }

  static String nbaGamesDayMinusThree() {
    DateTime today = new DateTime.now();
    DateTime prevDay = today.subtract(new Duration(days: 1));
    String year = prevDay.year.toString();
    String month = prevDay.month.toString();
    String day = prevDay.day.toString();

    return "http://data.nba.net/10s/prod/v1/${year + month + day}/scoreboard.json";
  }

  // Provides injury updates -- Free to use but please mention that data is powered by FantasyBasketballNerd.com.
  static String getInjuryReport() {
    // NOTE: This data is returned in xml. Need to convert it.
    return "https://www.fantasybasketballnerd.com/service/injuries/";
  }

  // Returns different types of shot pcts for a given player, including dribble shots, closest defender, shot clock, touch time and range.
  static String getNbaStatsPlayerShotTypes(String playerId,
      {String perMode = "Totals"}) {
    return "https://stats.nba.com/stats/playerdashptshots?DateFrom=&DateTo=&GameSegment=&LastNGames=0&LeagueID=00&Location=&Month=0&OpponentTeamID=0&Outcome=&PerMode=$perMode&Period=0&PlayerID=$playerId&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&TeamID=0&VsConference=&VsDivision=";
  }

  // Returns summary stats for all years, including base and advanced
  static String getNbaStatsPlayerYearOverYear(String playerId,
      {String measureType = "Base", String perMode = "Totals"}) {
    return "https://stats.nba.com/stats/playerdashboardbyyearoveryear?DateFrom=&DateTo=&GameSegment=&LastNGames=0&LeagueID=&Location=&MeasureType=$measureType&Month=0&OpponentTeamID=0&Outcome=&PORound=&PaceAdjust=N&PerMode=$perMode&Period=0&PlayerID=$playerId&PlusMinus=N&Rank=N&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&VsConference=&VsDivision=";
  }

  // Returns different types of shot pcts for a given player, including dribble shots, closest defender, shot clock, touch time and range.
  static String getNbaStatsPlayerClutchStats(String playerId,
      {String measureType = "Base", String perMode = "Totals"}) {
    return "https://stats.nba.com/stats/playerdashboardbyclutch?DateFrom=&DateTo=&GameSegment=&LastNGames=0&LeagueID=&Location=&MeasureType=$measureType&Month=0&OpponentTeamID=0&Outcome=&PORound=&PaceAdjust=N&PerMode=$perMode&Period=0&PlayerID=$playerId&PlusMinus=N&Rank=N&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&VsConference=&VsDivision=";
  }

  static String getNbaStatsPlayerSplitsShooting(String playerId,
      {String measureType = "Base", String perMode = "Totals"}) {
    return "https://stats.nba.com/stats/playerdashboardbyshootingsplits?DateFrom=&DateTo=&GameSegment=&LastNGames=0&LeagueID=&Location=&MeasureType=$measureType&Month=0&OpponentTeamID=0&Outcome=&PORound=&PaceAdjust=N&PerMode=$perMode&Period=0&PlayerID=$playerId&PlusMinus=N&Rank=N&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&VsConference=&VsDivision=";
  }

  static String getNbaStatsPlayerSplitsGeneral(String playerId,
      {String measureType = "Base", String perMode = "Totals"}) {
    return "https://stats.nba.com/stats/playerdashboardbygeneralsplits?DateFrom=&DateTo=&GameSegment=&LastNGames=0&LeagueID=&Location=&MeasureType=$measureType&Month=0&OpponentTeamID=0&Outcome=&PORound=&PaceAdjust=N&PerMode=$perMode&Period=0&PlayerID=$playerId&PlusMinus=N&Rank=N&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&VsConference=&VsDivision=";
  }

  static String getNbaStatsPlayerSplitsGame(String playerId,
      {String measureType = "Base", String perMode = "Totals"}) {
    return "https://stats.nba.com/stats/playerdashboardbygamesplits?DateFrom=&DateTo=&GameSegment=&LastNGames=0&LeagueID=&Location=&MeasureType=$measureType&Month=0&OpponentTeamID=0&Outcome=&PORound=&PaceAdjust=N&PerMode=$perMode&Period=0&PlayerID=$playerId&PlusMinus=N&Rank=N&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&VsConference=&VsDivision=";
  }

  // static String getNbaStatsPlayerSplitsAdvanced(String playerId) {
  //   return "https://stats.nba.com/stats/playerdashboardbygamesplits?DateFrom=&DateTo=&GameSegment=&LastNGames=0&LeagueID=&Location=&MeasureType=Advanced&Month=0&OpponentTeamID=0&Outcome=&PORound=&PaceAdjust=N&PerMode=Totals&Period=0&PlayerID=$playerId&PlusMinus=N&Rank=N&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&VsConference=&VsDivision=";
  // }

  // Returns different types of shot pcts for a given team, including dribble shots, closest defender, shot clock, touch time and range.
  static String getNbaStatsTeamShotTypes(String teamId) {
    return "https://stats.nba.com/stats/teamdashptshots?DateFrom=&DateTo=&GameSegment=&LastNGames=0&LeagueID=00&Location=&Month=0&OpponentTeamID=0&Outcome=&PerMode=Totals&Period=0&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&TeamID=$teamId&VsConference=&VsDivision=";
  }

  static String getNbaStatsWinProbability(String gameId) {
    return "https://stats.nba.com/stats/winprobabilitypbp?GameID=$gameId&RunType=each+second";
  }

  static String getNbaStatsTest() {
    //return "https://stats.nba.com/stats/boxscorefourfactorsv2?EndPeriod=1&EndRange=0&GameID=0022000178&RangeType=0&StartPeriod=1&StartRange=0";
    return "https://stats.nba.com/stats/leaguehustlestatsteamleaders?College=&Conference=&Country=&DateFrom=&DateTo=&Division=&DraftPick=&DraftYear=&Height=&LeagueID=&Location=&Month=&OpponentTeamID=&Outcome=&PORound=&PerMode=Totals&PlayerExperience=&PlayerPosition=&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&TeamID=&VsConference=&VsDivision=&Weight=";
  }

  static String getNbaStatsEstimatedMetricsAllTeams() {
    return "https://stats.nba.com/stats/teamestimatedmetrics?LeagueID=00&Season=2020-21&SeasonType=Regular+Season";
  }

  static String getNbaStatsTeamPerformance(String teamId) {
    return "https://stats.nba.com/stats/teamdashboardbyteamperformance?DateFrom=&DateTo=&GameSegment=&LastNGames=0&LeagueID=&Location=&MeasureType=Base&Month=0&OpponentTeamID=0&Outcome=&PORound=&PaceAdjust=N&PerMode=Totals&Period=0&PlusMinus=N&Rank=N&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&TeamID=$teamId&VsConference=&VsDivision=";
  }

  static String getNbaStatsTeamStatistics_Base() {
    return "https://stats.nba.com/stats/leaguedashteamstats?Conference=&DateFrom=&DateTo=&Division=&GameScope=&GameSegment=&LastNGames=0&LeagueID=&Location=&MeasureType=Base&Month=0&OpponentTeamID=0&Outcome=&PORound=&PaceAdjust=N&PerMode=Totals&Period=0&PlayerExperience=&PlayerPosition=&PlusMinus=N&Rank=N&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&StarterBench=&TeamID=&TwoWay=&VsConference=&VsDivision=";
  }

  static String getNbaStatsTeamStatistics_Advanced() {
    return "https://stats.nba.com/stats/leaguedashteamstats?Conference=&DateFrom=&DateTo=&Division=&GameScope=&GameSegment=&LastNGames=0&LeagueID=&Location=&MeasureType=Advanced&Month=0&OpponentTeamID=0&Outcome=&PORound=&PaceAdjust=N&PerMode=Totals&Period=0&PlayerExperience=&PlayerPosition=&PlusMinus=N&Rank=N&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&StarterBench=&TeamID=&TwoWay=&VsConference=&VsDivision=";
  }

  static String getNbaStatsTeamStatistics_Misc() {
    return "https://stats.nba.com/stats/leaguedashteamstats?Conference=&DateFrom=&DateTo=&Division=&GameScope=&GameSegment=&LastNGames=0&LeagueID=&Location=&MeasureType=Misc&Month=0&OpponentTeamID=0&Outcome=&PORound=&PaceAdjust=N&PerMode=Totals&Period=0&PlayerExperience=&PlayerPosition=&PlusMinus=N&Rank=N&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&StarterBench=&TeamID=&TwoWay=&VsConference=&VsDivision=";
  }

  static String getNbaStatsTeamStatistics_FourFactors() {
    return "https://stats.nba.com/stats/leaguedashteamstats?Conference=&DateFrom=&DateTo=&Division=&GameScope=&GameSegment=&LastNGames=0&LeagueID=&Location=&MeasureType=Four Factors&Month=0&OpponentTeamID=0&Outcome=&PORound=&PaceAdjust=N&PerMode=Totals&Period=0&PlayerExperience=&PlayerPosition=&PlusMinus=N&Rank=N&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&StarterBench=&TeamID=&TwoWay=&VsConference=&VsDivision=";
  }

  static String getNbaStatsTeamLineups(String teamId) {
    return "https://stats.nba.com/stats/teamdashlineups?DateFrom=&DateTo=&GameID=&GameSegment=&GroupQuantity=5&LastNGames=0&LeagueID=&Location=&MeasureType=Base&Month=0&OpponentTeamID=0&Outcome=&PORound=&PaceAdjust=N&PerMode=Totals&Period=0&PlusMinus=N&Rank=N&Season=2020-21&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&TeamID=$teamId&VsConference=&VsDivision=";
  }

  static String getNbaStatsLeagueStandings() {
    return "https://stats.nba.com/stats/leaguestandingsv3?LeagueID=00&Season=2020-21&SeasonType=Regular+Season&SeasonYear=";
  }

  // THe video urls need to be parsed from the returned JSON
  static String getNbaPbpEventVideo(String gameId, String eventNum) {
    return "https://stats.nba.com/stats/videoeventsasset?GameEventID=$eventNum&GameID=$gameId";
  }

  // This is a different play-by-play feed than what's being used in the lead tracker. Use this one for the video play-by-play
  // view, so we can show the video flag and actually pull the pbp event video using the previous URL.
  static String getNbaStatsAdvancedPlayByPlay(String gameId,
      [String startPeriod = '1', String endPeriod = '1']) {
    return "https://stats.nba.com/stats/playbyplayv2?EndPeriod=$endPeriod&GameID=$gameId&StartPeriod=$startPeriod";
  }

  static String getNbaStatsBoxScoreSummary(String gameId) {
    return "https://stats.nba.com/stats/boxscoresummaryv2?GameID=$gameId";
  }

  // This pulls the full game. Can eventually create a new version that pulls by quarter.
  static String getNbaStatsBoxScoreAdvanced(String gameId) {
    return "https://stats.nba.com/stats/boxscoreadvancedv2?EndPeriod=0&EndRange=0&GameID=$gameId&RangeType=0&StartPeriod=0&StartRange=0";
  }

  static String getNbaStatsBoxScoreDefensive(String gameId) {
    return "https://stats.nba.com/stats/boxscoredefensive?GameID=$gameId";
  }

  static String getNbaStatsBoxScoreFourFactors(String gameId) {
    return "https://stats.nba.com/stats/boxscorefourfactorsv2?EndPeriod=0&EndRange=0&GameID=$gameId&RangeType=0&StartPeriod=0&StartRange=0";
  }

  static String getNbaStatsPlayerGameLog(String playerId, String season) {
    return "https://stats.nba.com/stats/playergamelog?DateFrom=&DateTo=&LeagueID=&PlayerID=$playerId&Season=$season&SeasonType=Regular+Season";
  }
}
