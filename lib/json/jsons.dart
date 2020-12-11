import 'package:flutter/foundation.dart';

class JsonFiles with ChangeNotifier {
  String _year = "2020";
  String _seasonStage = "2";
  // var _westStandings;
  // var _eastStandings;
  //var _confStandings2;
  //var _divStandings2;
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
  //List<dynamic> _teamNews;
  Map<String, dynamic> _teamPlayers = {}; // teamID,Player_list
  Map<String, dynamic> _teamNews = {}; // teamID,Player_list

  //Nba Api variables
  var _allPlayers;
  var _allTeams;

  void setYear(String year) {
    _year = year;
    notifyListeners();
  }

  void setSeasonStage(String stage) {
    _seasonStage = stage;
    notifyListeners();
  }

  void setTeamNews(String teamId, dynamic news) {
    _teamNews[teamId] = news;
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

  void setEastId(dynamic json) {
    _eastId = json;
    notifyListeners();
  }

  void setWestId(dynamic json) {
    _westId = json;
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

  List<dynamic> getNews(String teamId) => _teamNews[teamId];

  dynamic getTransactions() => _transactions;

  dynamic getAllPlayers() => _allPlayers;
  dynamic getAllTeams() => _allTeams;

  dynamic getGames() => _games;

  Map getEastIdIndex() => _idEastIndex;

  Map getWestIdIndex() => _idWestIndex;

  dynamic getEastIds() => _eastId;

  dynamic getWestIds() => _westId;

  dynamic getSeasons() => _seasons;

  dynamic getStandings() => _confStandings;

  dynamic getConfStandings() => _confStandings;
  dynamic getDivStandings() => _divStandings;

  dynamic getAllTeamStats() => _teamStats;
  dynamic getTeamStats(String teamId) {
    dynamic team;
    if (_teamStats != null) {
      for (var t in _teamStats["league"]["standard"]["regularSeason"]
          ["teams"]) {
        if (t["teamId"] == teamId) {
          team = t;
          break;
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
