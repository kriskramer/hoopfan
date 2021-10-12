import 'package:flutter/foundation.dart';

class SeasonProv with ChangeNotifier {
  String _seasonVal = "2021-22"; // value of the current season

  List<String> _seasonList = [
    "2021-22",
    "2020-21",
    "2019-20",
    "2018-19",
    "2017-18",
    "2016-17",
    "2015-16",
    "2014-15",
    "2013-14",
    // "2012-13",
    // "2011-12",
    // "2010-11",
  ];

  bool _confSelected = true;
  bool _divSelected = false;
  bool _leagueSelected = false;

  void changeSeason(String value) {
    _seasonVal = value;
    notifyListeners();
  }

  void setView({bool league, bool conference, bool division}) {
    _leagueSelected = league;
    _divSelected = division;
    _confSelected = conference;
    notifyListeners();
  }

  String get season => _seasonVal;
  List<String> get seasonList => _seasonList;
  bool get confView => _confSelected;
  bool get divView => _divSelected;
  bool get leagueView => _leagueSelected;
}
