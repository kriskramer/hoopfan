import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';
import 'package:hoop/models/league_stats/advanced_stats_league.dart';
import 'package:hoop/models/league_stats/base_stats_league.dart';
import 'package:hoop/screens/views/stats/grids/league_stats_advanced_grid.dart';
import 'package:hoop/screens/views/stats/grids/league_stats_base_grid.dart';
import 'package:hoop/screens/views/stats/grids/league_stats_four_factors_grid.dart';
import 'package:hoop/screens/views/stats/grids/league_stats_misc_grid.dart';
import 'package:hoop/screens/views/stats/grids/league_stats_opponent_grid.dart';
import 'package:hoop/screens/views/stats/grids/league_stats_scoring_grid.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class LeagueStats extends StatefulWidget {
  const LeagueStats();

  @override
  State<LeagueStats> createState() => _LeagueStatsState();
}

class _LeagueStatsState extends State<LeagueStats> {
  int _valuePer = 0;
  int _valueMeasure = 0;
  int _valueLastNGames = 0;
  String per = "Totals";
  String measure = "Base";
  bool sort = true;
  int colIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('League Stats'),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FutureBuilder(
              future: loadData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return NoConnection();
                }
                if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasData) {
                  return Column(children: [
                    SizedBox(height: 40),
                    Center(child: Text('No data'))
                  ]);
                }
                if (snapshot.hasData) {
                  dynamic stats = snapshot.data;

                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButton(
                                    elevation: 5,
                                    value: _valueMeasure,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("Base"),
                                        value: 0,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Advanced"),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Misc"),
                                        value: 2,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Four Factors"),
                                        value: 3,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Scoring"),
                                        value: 4,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Opponent"),
                                        value: 5,
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        updateMeasure(value);
                                      });
                                    }),
                                SizedBox(
                                  width: 20,
                                ),
                                DropdownButton(
                                    elevation: 5,
                                    value: _valuePer,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("Totals"),
                                        value: 0,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("PerGame"),
                                        value: 1,
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        updatePer(value);
                                      });
                                    }),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Last N Games: '),
                                SizedBox(
                                  width: 5,
                                ),
                                DropdownButton(
                                    elevation: 5,
                                    value: _valueLastNGames,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("All"),
                                        value: 0,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("1"),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("2"),
                                        value: 2,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("3"),
                                        value: 3,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("4"),
                                        value: 4,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("5"),
                                        value: 5,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("6"),
                                        value: 6,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("7"),
                                        value: 7,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("8"),
                                        value: 8,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("9"),
                                        value: 9,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("10"),
                                        value: 10,
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        updateLastNGames(value);
                                      });
                                    }),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _valueMeasure == 0
                          ? LeagueStatsBaseGrid(stats)
                          : SizedBox(),
                      _valueMeasure == 1
                          ? LeagueStatsAdvancedGrid(stats)
                          : SizedBox(),
                      _valueMeasure == 2
                          ? LeagueStatsMiscGrid(stats)
                          : SizedBox(),
                      _valueMeasure == 3
                          ? LeagueStatsFourFactorsGrid(stats)
                          : SizedBox(),
                      _valueMeasure == 5
                          ? LeagueStatsOpponentGrid(stats)
                          : SizedBox(),
                      _valueMeasure == 4
                          ? LeagueStatsScoringGrid(stats)
                          : SizedBox(),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  );
                }
                return NoConnection();
              })),
    );
  }

  Future<dynamic> loadData() async {
    dynamic stats;

    stats = await Network.getJson(
      Urls.getNbaStatsTeamStatistics(
          lastNGames: _valueLastNGames.toString(),
          perMode: per,
          measureType: measure),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );

    return stats;
  }

  void updatePer(int value) {
    if (value == 0) {
      _valuePer = 0;
      per = "Totals";
    } else if (value == 1) {
      _valuePer = 1;
      per = "PerGame";
    }
  }

  void updateMeasure(int value) {
    if (value == 0) {
      _valueMeasure = 0;
      measure = "Base";
    } else if (value == 1) {
      _valueMeasure = 1;
      measure = "Advanced";
    } else if (value == 2) {
      _valueMeasure = 2;
      measure = "Misc";
    } else if (value == 3) {
      _valueMeasure = 3;
      measure = "Four Factors";
    } else if (value == 4) {
      _valueMeasure = 4;
      measure = "Scoring";
    } else if (value == 5) {
      _valueMeasure = 5;
      measure = "Opponent";
    }
  }

  void updateLastNGames(int value) {
    _valueLastNGames = value;
  }
}
