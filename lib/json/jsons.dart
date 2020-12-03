import 'package:flutter/foundation.dart';

class JsonFiles with ChangeNotifier {
  String _year = "2019";
  var _westStandings;
  var _eastStandings;
  var _seasons;
  List _southwestStandings = new List();
  List _centralStandings = new List();
  List _atlanticStandings = new List();
  List _southeastStandings = new List();
  List _pacificStandings = new List();
  List _northwestStandings = new List();
  Map _confStandings;
  Map _divStandings;
  var _eastId;
  var _westId;
  var _games;
  Map _idEastIndex = {};
  Map _idWestIndex = {};
  List<dynamic> _teamNews;
  Map<String, dynamic> _teamPlayers = {}; // teamID,Player_list

  //Nba Api variables
  var _allPlayers;
  var _allTeams;

  void setYear(String year) {
    _year = year;
    print(_year);
    notifyListeners();
  }

  void setTeamNews(List<dynamic> news) {
    _teamNews = news;
  }

  void setAllPlayers(dynamic json) {
    _allPlayers = json;
  }

  void setAllTeams(dynamic json) {
    _allTeams = json;
  }

  void setWestStandings(dynamic json) {
    _westStandings = json;

    for (int i = 0; i < _westStandings["api"]["standings"].length; i++) {
      var team = _westStandings["api"]["standings"][i];
      if (team["division"]["name"] == "southwest") {
        _southwestStandings.add(team);
      }
      if (team["division"]["name"] == "northwest") {
        _northwestStandings.add(team);
      }
      if (team["division"]["name"] == "pacific") {
        _pacificStandings.add(team);
      }
    }
    notifyListeners();
  }

  void setEastStandings(dynamic json) {
    _eastStandings = json;

    for (int i = 0; i < _eastStandings["api"]["standings"].length; i++) {
      var team = _eastStandings["api"]["standings"][i];
      if (team["division"]["name"] == "atlantic") {
        _atlanticStandings.add(team);
      }
      if (team["division"]["name"] == "central") {
        _centralStandings.add(team);
      }
      if (team["division"]["name"] == "southeast") {
        _southeastStandings.add(team);
      }
    }
    notifyListeners();
  }

  void setSeasons(dynamic json) {
    _seasons = json;
    notifyListeners();
  }

  void setConferenceStandings() {
    if (_eastStandings && _westStandings) {
      _confStandings.addAll(_eastStandings);
      _confStandings.addAll(_westStandings);
    }
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

  List<dynamic> getNews() => _teamNews;

  dynamic getAllPlayers() => _allPlayers;
  dynamic getAllTeams() => _allTeams;

  dynamic getGames() => _games;

  Map getEastIdIndex() => _idEastIndex;

  Map getWestIdIndex() => _idWestIndex;

  dynamic getEastIds() => _eastId;

  dynamic getWestIds() => _westId;

  dynamic getSeasons() => _seasons;

  dynamic getEastStandings() => _eastStandings;

  dynamic getWestStandings() => _westStandings;

  dynamic getConfStandings() => _confStandings;

  dynamic getSouthwestStandings() {
    _southwestStandings.clear();
    for (int i = 0; i < _westStandings["api"]["standings"].length; i++) {
      var team = _westStandings["api"]["standings"][i];
      if (team["division"]["name"] == "southwest") {
        _southwestStandings.add(team);
      }
    }

    return _southwestStandings;
  }

  dynamic getSoutheastStandings() {
    _southeastStandings.clear();
    for (int i = 0; i < _eastStandings["api"]["standings"].length; i++) {
      var team = _eastStandings["api"]["standings"][i];
      if (team["division"]["name"] == "southeast") {
        _southeastStandings.add(team);
      }
    }

    return _southeastStandings;
  }

  dynamic getNorthwestStandings() {
    _northwestStandings.clear();
    for (int i = 0; i < _westStandings["api"]["standings"].length; i++) {
      var team = _westStandings["api"]["standings"][i];
      if (team["division"]["name"] == "northwest") {
        _northwestStandings.add(team);
      }
    }

    return _northwestStandings;
  }

  dynamic getCentralStandings() {
    _centralStandings.clear();
    for (int i = 0; i < _eastStandings["api"]["standings"].length; i++) {
      var team = _eastStandings["api"]["standings"][i];
      if (team["division"]["name"] == "central") {
        _centralStandings.add(team);
      }
    }

    return _centralStandings;
  }

  dynamic getAtlanticStandings() {
    _atlanticStandings.clear();
    for (int i = 0; i < _eastStandings["api"]["standings"].length; i++) {
      var team = _eastStandings["api"]["standings"][i];
      if (team["division"]["name"] == "atlantic") {
        _atlanticStandings.add(team);
      }
    }

    return _atlanticStandings;
  }

  dynamic getPacificStandings() {
    _pacificStandings.clear();
    for (int i = 0; i < _westStandings["api"]["standings"].length; i++) {
      var team = _westStandings["api"]["standings"][i];
      if (team["division"]["name"] == "pacific") {
        _pacificStandings.add(team);
      }
    }

    return _pacificStandings;
  }

  dynamic getTeamRoster(String teamId) => _teamPlayers[teamId];
}
