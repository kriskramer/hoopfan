import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/screens/views/teams/team_stats_last_n_games_grids.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class TeamStatsLastNGames extends StatefulWidget {
  final String teamId;
  const TeamStatsLastNGames({this.teamId});

  @override
  _TeamStatsLastNGamesState createState() => _TeamStatsLastNGamesState();
}

class _TeamStatsLastNGamesState extends State<TeamStatsLastNGames> {
  int _valuePer = 1;
  int _valueMeasure = 1;
  String per = "Totals";
  String measure = "Base";
  int _lastNGames = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return NoConnection();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasData) {
            return Column(children: [SizedBox(height: 20), Text('No data')]);
          }
          if (snapshot.hasData) {
            var stats = snapshot.data;

            return Column(children: [
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton(
                        elevation: 5,
                        value: _valuePer,
                        items: [
                          DropdownMenuItem(
                            child: Text("Totals"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("PerGame"),
                            value: 2,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            updatePer(value);
                          });
                        }),
                    SizedBox(
                      width: 20,
                    ),
                    DropdownButton(
                        elevation: 5,
                        value: _valueMeasure,
                        items: [
                          DropdownMenuItem(
                            child: Text("Base"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Advanced"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("Misc"),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text("Four Factors"),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text("Scoring"),
                            value: 5,
                          ),
                          DropdownMenuItem(
                            child: Text("Opponent"),
                            value: 6,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            updateMeasure(value);
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Games"),
                    SizedBox(width: 5),
                    DropdownButton(
                        elevation: 5,
                        value: _lastNGames,
                        items: [
                          DropdownMenuItem(
                            child: Text("0"),
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
                            value: 6,
                          ),
                          DropdownMenuItem(
                            child: Text("8"),
                            value: 6,
                          ),
                          DropdownMenuItem(
                            child: Text("9"),
                            value: 6,
                          ),
                          DropdownMenuItem(
                            child: Text("10"),
                            value: 6,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            updateLastNGames(value);
                          });
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TeamStatsLastNGamesGrid(stats: stats, measure: measure)
            ]);
          } else {
            return NoConnection();
          }
        },
      ),
    );
  }

  Future<dynamic> loadData() async {
    return await Network.getJson(
      Urls.getNbaStatsTeamLastNGames(widget.teamId,
          measureType: measure, perMode: per, lastNGames: _lastNGames),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );
  }

  void updatePer(int value) {
    if (value == 1) {
      _valuePer = 1;
      per = "Totals";
    } else if (value == 2) {
      _valuePer = 2;
      per = "PerGame";
    }
  }

  void updateMeasure(int value) {
    if (value == 1) {
      _valueMeasure = 1;
      measure = "Base";
    } else if (value == 2) {
      _valueMeasure = 2;
      measure = "Advanced";
    } else if (value == 3) {
      _valueMeasure = 3;
      measure = "Misc";
    } else if (value == 4) {
      _valueMeasure = 4;
      measure = "Four Factors";
    } else if (value == 5) {
      _valueMeasure = 5;
      measure = "Scoring";
    } else if (value == 6) {
      _valueMeasure = 6;
      measure = "Opponent";
    }
  }

  void updateLastNGames(int value) {
    _lastNGames = value;
  }
}
