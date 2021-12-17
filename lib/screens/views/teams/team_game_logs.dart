import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/screens/views/teams/team_stats_game_logs_grids.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class TeamGameLogs extends StatefulWidget {
  final String teamId;

  const TeamGameLogs({this.teamId});

  @override
  _TeamGameLogsState createState() => _TeamGameLogsState();
}

class _TeamGameLogsState extends State<TeamGameLogs> {
  int _valueMeasure = 1;
  String per = "Totals";
  String measure = "Base";

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
                return Column(
                    children: [SizedBox(height: 20), Text('No data')]);
              }
              if (snapshot.hasData) {
                var stats = snapshot.data;
                return Column(children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                        "View team stats for all games in the current season."),
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TeamStatsGameLogsGrid(stats: stats, measure: measure)
                ]);
              }

              return NoConnection();
            }));
  }

  Future<dynamic> loadData() async {
    return await Network.getJson(
      Urls.getNbaStatsTeamGameLogs(widget.teamId,
          measureType: measure, perMode: "Totals"),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );
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
}
