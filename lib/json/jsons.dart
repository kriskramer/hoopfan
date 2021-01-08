import 'package:flutter/foundation.dart';
import 'package:hoop/model/lead_tracker.dart';

class JsonFiles with ChangeNotifier {
  String _year = "2020";
  String _seasonStage = "2";
  var _teamStats;
  var _seasons;
  var _transactions;

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
  Map<String, dynamic> _previewArticles = {};
  Map<String, dynamic> _recapArticles = {};
  Map<String, dynamic> _gameNews = {};
  Map<String, dynamic> _pbps = {};
  Map<String, dynamic> _fullGameLeadTracker = {};
  var _nbaNews;
  var _nbaVideos;
  var _todaysGames;
  var _prevGames;
  var _upcomingGames;
  String _selectedDate;

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

  void setYear(String year) {
    _year = year;
    notifyListeners();
  }

  void setSeasonStage(String stage) {
    _seasonStage = stage;
    notifyListeners();
  }

  void setNbaNews(dynamic json) {
    _nbaNews = json;
    notifyListeners();
  }

  void setNbaVideo(dynamic json) {
    _nbaVideos = json;
    notifyListeners();
  }

  void setTeamNews(String teamId, dynamic news) {
    _teamNews[teamId] = news;
  }

  // key value is gameId and period concatenated together with a "-"
  void setGamePbp(String gameAndPeriodId, dynamic pbp) {
    _pbps[gameAndPeriodId] = pbp;
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

  // void setEastId(dynamic json) {
  //   _eastId = json;
  //   notifyListeners();
  // }

  // void setWestId(dynamic json) {
  //   _westId = json;
  //   notifyListeners();
  // }

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

  List<dynamic> getNews(String teamId) => _teamNews[teamId];
  dynamic getTeamVideos(String teamId) => _teamVideos[teamId];

  dynamic getPreviewArticle(String gameId) => _previewArticles[gameId];
  dynamic getRecapArticle(String gameId) => _recapArticles[gameId];
  dynamic getGameNews(String searchString) => _gameNews[searchString];

  dynamic getPbp(String gameAndPeriodId) => _pbps[gameAndPeriodId];
  LeadTrackerList getFullGameLeadTracker(String gameId) =>
      _fullGameLeadTracker[gameId];

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

  dynamic getStandings() => _confStandings;

  dynamic getConfStandings() => _confStandings;
  dynamic getDivStandings() => _divStandings;

  dynamic getNbaNews() => _nbaNews;
  dynamic getNbaVideos() => _nbaVideos;

  dynamic getUpcomingGames() => _upcomingGames;
  dynamic getTodaysGames() => _todaysGames;
  dynamic getPreviousGames() => _prevGames;

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
