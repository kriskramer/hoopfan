import 'package:flutter/foundation.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';
import 'package:hoop/models/lead_tracker.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/models/player_box_score.dart';

class JsonFiles with ChangeNotifier {
  String _year = "2022";
  String _seasonStage = "2";
  var _teamStats;
  var _seasons;
  var _transactions;

  LeagueStandingList _allStandings;

  Map _confStandings;
  Map _divStandings;
  var _eastId;
  var _westId;
  var _games;
  Map _idEastIndex = {};
  Map _idWestIndex = {};
  Map<String, dynamic> _teamPlayers = {}; // teamID,Player_list
  Map<String, dynamic> _teamNews = {}; // teamID,Player_list
  Map<String, dynamic> _teamVideos = {};
  Map<String, dynamic> _teamSchedule = {};
  Map<String, dynamic> _previewArticles = {};
  Map<String, dynamic> _recapArticles = {};
  Map<String, dynamic> _gameNews = {};
  Map<String, dynamic> _pbps = {};
  Map<String, FeedList2> _pbpFeed = {};
  Map<String, dynamic> _fullGameLeadTracker = {};
  var _teamStatsEstimated;
  var _teamStatsBase;
  var _teamStatsAdvanced;
  var _teamStatsMisc;
  var _teamStatsFourFactors;
  var _leagueLeaders;
  Map<String, dynamic> _playerSummaryStats = {};
  Map<String, dynamic> _teamStatsShooting = {};
  Map<String, dynamic> _teamLineups = {};
  Map<String, dynamic> _playerShotTypes = {};
  Map<String, dynamic> _playerClutchStats = {};
  Map<String, dynamic> _playerSplitsGeneral = {};
  Map<String, dynamic> _playerSplitsGame = {};
  Map<String, dynamic> _playerSplitsAdvanced = {};
  Map<String, dynamic> _playerGameLog = {};
  var _allBasePlayerStats;
  var _allAdvancedPlayerStats;
  var _allDefensePlayerStats;
  var _nbaNews;
  var _nbaVideos;
  var _todaysGames;
  var _prevGames;
  var _upcomingGames;
  String _selectedDate;
  PlayerBoxScoreList _playerBoxScores;
  Map<String, dynamic> _playerShotChart = {};
  Map<String, dynamic> _currentGameStats = {};
  Map<String, dynamic> _gameCheers = {};
  Map<String, dynamic> _gameBoos = {};
  Map<String, dynamic> _gameFeed = {};

  var _injuryReport;

  bool _isFeatureBlocked = false;

  //Nba Api variables
  var _allPlayers;
  var _allTeams;

  String getToday() {
    DateTime today = DateTime.now();
    String year = today.year.toString();
    String month = today.month.toString();
    String day = today.day.toString();

    return year + month + day;
  }

  void setLeagueStandings(LeagueStandingList list) {
    _allStandings = list;
  }

  void setYear(String year) {
    _year = year;
    notifyListeners();
  }

  void setSeasonStage(String stage) {
    _seasonStage = stage;
    notifyListeners();
  }

  void setLeagueLeaders(dynamic json) {
    _leagueLeaders = json;
    notifyListeners();
  }

  void setNbaNews(dynamic json) {
    _nbaNews = json;
    notifyListeners();
  }

  void setInjuryReport(dynamic json) {
    _injuryReport = json;
    notifyListeners();
  }

  void setNbaVideo(dynamic json) {
    _nbaVideos = json;
    notifyListeners();
  }

  void setGameCheers(String gameId, int cheers) {
    _gameCheers[gameId] = cheers;
  }

  void setGameBoos(String gameId, int boos) {
    _gameBoos[gameId] = boos;
  }

  void setTeamNews(String teamId, dynamic news) {
    _teamNews[teamId] = news;
  }

  void setTeamSchedule(String teamId, dynamic schedule) {
    _teamSchedule[teamId] = schedule;
  }

  // key value is gameId and period concatenated together with a "-"
  void setGamePbp(String gameAndPeriodId, dynamic pbp) {
    _pbps[gameAndPeriodId] = pbp;
  }

  void setPbpFeed(String gameId, FeedList2 pbp) {
    _pbpFeed[gameId] = pbp;
  }

  void setGameLeadTracker(String gameId, LeadTrackerList list) {
    _fullGameLeadTracker[gameId] = list;
  }

  void setTeamVideos(String teamId, dynamic videos) {
    _teamVideos[teamId] = videos;
  }

  void setGameNews(String searchString, dynamic news) {
    _gameNews[searchString] = news;
  }

  void setPlayerSummaryStats(String playerKey, dynamic json) {
    _playerSummaryStats[playerKey] = json;
  }

  void setPlayerShotTypes(String playerId, dynamic json) {
    _playerShotTypes[playerId] = json;
  }

  void setPlayerClutchStats(String playerId, dynamic json) {
    _playerClutchStats[playerId] = json;
  }

  void setPlayerSplitsGeneral(String playerId, dynamic json) {
    _playerSplitsGeneral[playerId] = json;
  }

  void setPlayerSplitsGame(String playerId, dynamic json) {
    _playerSplitsGame[playerId] = json;
  }

  void setPlayerSplitsAdvanced(String playerId, dynamic json) {
    _playerSplitsAdvanced[playerId] = json;
  }

  void setPlayerShotChart(String playerId, dynamic json) {
    _playerShotChart[playerId] = json;
  }

  void setPreviewArticles(String gameId, dynamic article) {
    _previewArticles[gameId] = article;
  }

  void setRecapArticles(String gameId, dynamic article) {
    _recapArticles[gameId] = article;
  }

  void setAllPlayers(dynamic json) {
    _allPlayers = json;
  }

  void setAllTeams(dynamic json) {
    _allTeams = json;
  }

  void setTeamStats(dynamic json) {
    _teamStats = json;
  }

  void setAllBasePlayerStats(dynamic json) {
    _allBasePlayerStats = json;
  }

  void setAllAdvancedPlayerStats(dynamic json) {
    _allAdvancedPlayerStats = json;
  }

  void setAllDefensePlayerStats(dynamic json) {
    _allDefensePlayerStats = json;
  }

  void setEstimatedTeamStats(dynamic json) {
    _teamStatsEstimated = json;
  }

  void setBaseTeamStats(dynamic json) {
    _teamStatsBase = json;
  }

  void setAdvancedTeamStats(dynamic json) {
    _teamStatsAdvanced = json;
  }

  void setMiscTeamStats(dynamic json) {
    _teamStatsMisc = json;
  }

  void setFourFactorsTeamStats(dynamic json) {
    _teamStatsFourFactors = json;
  }

  void setTeamStatsShooting(String teamId, dynamic json) {
    _teamStatsShooting[teamId] = json;
  }

  void setTeamLineups(String teamId, dynamic json) {
    _teamLineups[teamId] = json;
  }

  void setTransactions(dynamic json) {
    _transactions = json;
  }

  void setConfStandings(dynamic json) {
    _confStandings = json;

    notifyListeners();
  }

  void setDivStandings(dynamic json) {
    _divStandings = json;

    notifyListeners();
  }

  void setCurrentGameStats(String gameId, dynamic stats) {
    _currentGameStats[gameId] = stats;
  }

  void setPlayerBoxScores(PlayerBoxScoreList list) {
    _playerBoxScores = list;
  }

  void setSeasons(dynamic json) {
    _seasons = json;
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();

    if (month.length == 1) {
      month = "0" + month;
    }
    if (day.length == 1) {
      day = "0" + day;
    }
    _selectedDate = year + month + day;
  }

  void setEastIdIndex(String teamKey, int listLoc) {
    _idEastIndex[teamKey] = listLoc;
    notifyListeners();
  }

  void setWestIdIndex(String teamKey, int listLoc) {
    _idWestIndex[teamKey] = listLoc;
    notifyListeners();
  }

  void setGames(Map json) {
    _games = json;
  }

  void setUpcomingGames(dynamic json) {
    _upcomingGames = json;
    notifyListeners();
  }

  void setTodaysGames(dynamic json) {
    _todaysGames = json;
    notifyListeners();
  }

  void setPreviousGames(dynamic json) {
    _prevGames = json;
    notifyListeners();
  }

  void setGameFeed(String gameId, FeedList list) {
    _gameFeed[gameId] = list;
  }

  void addTeamPlayers(String teamId, dynamic teamList) {
    _teamPlayers[teamId] = teamList;
  }

  String getYear() => _year;
  String getYearFormatted() {
    var yearPlusOne = (int.parse(_year) + 1).toString();
    return _year + "-" + yearPlusOne;
  }

  String getSeasonStage() => _seasonStage;
  String getSeasonStageFormatted() {
    if (_seasonStage == "1") {
      return "Preseason";
    } else if (_seasonStage == "2") {
      return "Regular Season";
    } else {
      return "Postseason";
    }
  }

  bool getIsFeatureBlocked() => _isFeatureBlocked;
  List<dynamic> getNews(String teamId) => _teamNews[teamId];
  dynamic getTeamVideos(String teamId) => _teamVideos[teamId];

  int getGameCheers(String gameId) => _gameCheers[gameId];
  int getGameBoos(String gameId) => _gameBoos[gameId];

  dynamic getPreviewArticle(String gameId) => _previewArticles[gameId];
  dynamic getRecapArticle(String gameId) => _recapArticles[gameId];
  dynamic getGameNews(String searchString) => _gameNews[searchString];

  dynamic getTeamSchedule(String teamId) => _teamSchedule[teamId];

  dynamic getPlayerSummaryStats(String playerKey) =>
      _playerSummaryStats[playerKey];
  dynamic getPlayerShotTypes(String playerId) => _playerShotTypes[playerId];
  dynamic getPlayerClutchStats(String playerId) => _playerClutchStats[playerId];
  dynamic getPlayerSplitsGeneral(String playerId) =>
      _playerSplitsGeneral[playerId];
  dynamic getPlayerSplitsGame(String playerId) => _playerSplitsGame[playerId];
  dynamic getPlayerSplitsAdvanced(String playerId) =>
      _playerSplitsAdvanced[playerId];

  dynamic getPlayerShotChart(String playerId) => _playerShotChart[playerId];

  dynamic getAllBasePlayerStats() => _allBasePlayerStats;
  dynamic getAllAdvancedPlayerStats() => _allAdvancedPlayerStats;
  dynamic getAllDefensePlayerStats() => _allDefensePlayerStats;

  dynamic getLeagueLeaders() => _leagueLeaders;

  dynamic getPbp(String gameAndPeriodId) => _pbps[gameAndPeriodId];
  dynamic getPbpFeed(String gameId) => _pbpFeed[gameId];

  LeadTrackerList getFullGameLeadTracker(String gameId) =>
      _fullGameLeadTracker[gameId];

  dynamic getCurrentGameStats(String gameId) => _currentGameStats[gameId];

  dynamic getTransactions() => _transactions;

  dynamic getAllPlayers() => _allPlayers;
  dynamic getAllTeams() => _allTeams;

  dynamic getGames() => _games;

  Map getEastIdIndex() => _idEastIndex;

  Map getWestIdIndex() => _idWestIndex;

  dynamic getEastIds() => _eastId;

  dynamic getWestIds() => _westId;

  dynamic getSeasons() => _seasons;

  String getSelectedDate() => _selectedDate;

  FeedList getGameFeed(String gameId) => _gameFeed[gameId];

  LeagueStandingList getLeagueStandings() => _allStandings;
  dynamic getStandings() => _confStandings;
  dynamic getConfStandings() => _confStandings;
  dynamic getDivStandings() => _divStandings;

  dynamic getNbaNews() => _nbaNews;
  dynamic getNbaVideos() => _nbaVideos;

  dynamic getInjuryReport() => _injuryReport;

  PlayerBoxScoreList getPlayerBoxScores() => _playerBoxScores;

  dynamic getUpcomingGames() => _upcomingGames;
  dynamic getTodaysGames() => _todaysGames;
  dynamic getPreviousGames() => _prevGames;

  dynamic getEstimatedTeamStats() => _teamStatsEstimated;
  dynamic getBaseTeamStats() => _teamStatsBase;
  dynamic getAdvancedTeamStats() => _teamStatsAdvanced;
  dynamic getMiscTeamStats() => _teamStatsMisc;
  dynamic getFourFactorsTeamStats() => _teamStatsFourFactors;

  dynamic getTeamStatsShooting(String teamId) {
    return _teamStatsShooting[teamId];
  }

  dynamic getTeamLineups(String teamId) {
    return _teamLineups[teamId];
  }

  dynamic getAllTeamStats() => _teamStats;
  dynamic getTeamStats(String teamId) {
    dynamic team;
    if (_teamStats != null) {
      if (_seasonStage == "1") {
        for (var t in _teamStats["league"]["standard"]["preseason"]["teams"]) {
          if (t["teamId"] == teamId) {
            team = t;
            break;
          }
        }
      } else if (_seasonStage == "2") {
        for (var t in _teamStats["league"]["standard"]["regularSeason"]
            ["teams"]) {
          if (t["teamId"] == teamId) {
            team = t;
            break;
          }
        }
      }
    }
    return team;
  }

  dynamic getTeamRoster(String teamId) => _teamPlayers[teamId];

  String getTeamName(String teamId) {
    String name = "";

    for (var t in _allTeams["league"]["standard"]) {
      if (t["teamId"] == teamId) {
        name = t["fullName"];
      }
    }

    return name;
  }

  dynamic getPlayer(String playerId) {
    dynamic player;

    if (_allPlayers != null) {
      for (var p in _allPlayers["league"]["standard"]) {
        if (p["personId"] == playerId) {
          player = p;
          break;
        }
      }
    }

    return player;
  }

  String getPlayerName(String playerId) {
    String name = "";

    for (var p in _allPlayers["league"]["standard"]) {
      if (p["personId"] == playerId) {
        name = p["firstName"] + " " + p["lastName"];
      }
    }

    return name;
  }
}
