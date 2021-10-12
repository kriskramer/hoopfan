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

  void changeSeason(String value) {
    _seasonVal = value;
    notifyListeners();
  }

  String get season => _seasonVal;
  List<String> get seasonList => _seasonList;
}
