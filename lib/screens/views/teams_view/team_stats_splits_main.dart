import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/screens/views/teams_view/team_stats_splits_game.dart';
import 'package:hoop/screens/views/teams_view/team_stats_splits_general.dart';
import 'package:hoop/screens/views/teams_view/team_stats_splits_shooting.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class TeamStatsSplitsView extends StatefulWidget {
  final String teamId;

  const TeamStatsSplitsView({this.teamId});

  @override
  _TeamStatsSplitsViewState createState() => _TeamStatsSplitsViewState();
}

class _TeamStatsSplitsViewState extends State<TeamStatsSplitsView> {
  int _valuePer = 1;
  int _valueMeasure = 1;
  String per = "Totals";
  String measure = "Base";

  bool showGame = true;
  bool showGeneral = false;
  bool showShooting = false;

  dynamic gameStats;
  dynamic generalStats;
  dynamic shootingStats;

  void gameClick() {
    setState(() {
      showGame = true;
      showShooting = false;
      showGeneral = false;
    });
  }

  void shootingClick() {
    setState(() {
      showGame = false;
      showShooting = true;
      showGeneral = false;
    });
  }

  void generalClick() {
    setState(() {
      showGame = false;
      showShooting = false;
      showGeneral = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final teamColor = ConstantHelper.getTeamColor(widget.teamId);
    final teamTextColor = ConstantHelper.getTeamTextColor(widget.teamId);

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
                return Column(
                  children: [
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      layoutBehavior: ButtonBarLayoutBehavior.constrained,
                      children: [
                        ElevatedButton(
                          child: Text(
                            'Game',
                            style: TextStyle(
                                color: showGame
                                    ? Colors.black
                                    : Color(teamTextColor)),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            primary:
                                showGame ? Colors.grey[400] : Color(teamColor),
                          ),
                          onPressed: () {
                            gameClick();
                          },
                        ),
                        ElevatedButton(
                          child: Text(
                            'General',
                            style: TextStyle(
                                color: showGeneral
                                    ? Colors.black
                                    : Color(teamTextColor)),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            primary: showGeneral
                                ? Colors.grey[400]
                                : Color(teamColor),
                          ),
                          onPressed: () {
                            generalClick();
                          },
                        ),
                        ElevatedButton(
                          child: Text(
                            'Shooting',
                            style: TextStyle(
                                color: showShooting
                                    ? Colors.black
                                    : Color(teamTextColor)),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            primary: showShooting
                                ? Colors.grey[400]
                                : Color(teamColor),
                          ),
                          onPressed: () {
                            shootingClick();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                          showShooting
                              ? SizedBox()
                              : DropdownButton(
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          showGame
                              ? TeamStatsSplitsGame(
                                  stats: gameStats, measure: measure)
                              : SizedBox(),
                          showShooting
                              ? TeamStatsSplitsShooting(stats: shootingStats)
                              : SizedBox(),
                          showGeneral
                              ? TeamStatsSplitsGeneral(
                                  stats: generalStats, measure: measure)
                              : SizedBox(),
                        ],
                      ),
                    )
                  ],
                );
              }
              return NoConnection();
            }));
  }

  Future<bool> loadData() async {
    gameStats = await Network.getJson(
      Urls.getNbaStatsTeamSplitsGame(widget.teamId,
          measureType: measure, perMode: per),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );

    // print(Urls.getNbaStatsTeamSplitsGeneral(widget.teamId,
    //     measureType: measure, perMode: per));

    generalStats = await Network.getJson(
      Urls.getNbaStatsTeamSplitsGeneral(widget.teamId,
          measureType: measure, perMode: per),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );

    shootingStats = await Network.getJson(
      Urls.getNbaStatsTeamSplitsShooting(widget.teamId,
          measureType: measure, perMode: per),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );

    return true;
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
}
