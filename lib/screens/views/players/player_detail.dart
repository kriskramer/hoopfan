import 'package:flutter/material.dart';

import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/player_widgets/datatables/player_stats_summary_datatable.dart';
import 'package:hoop/components/player_widgets/player_clutch_stats_table.dart';
import 'package:hoop/components/player_widgets/player_game_log.dart';
import 'package:hoop/components/player_widgets/player_shooting_stats_table.dart';
import 'package:hoop/components/player_widgets/player_splits_advanced_table.dart';
import 'package:hoop/components/player_widgets/player_splits_game_table.dart';
import 'package:hoop/components/player_widgets/player_splits_general_table.dart';
import 'package:hoop/components/player_widgets/player_splits_shooting_table.dart';
import 'package:hoop/components/player_widgets/player_year_over_year_advanced_table.dart';
import 'package:hoop/components/player_widgets/player_year_over_year_base_table.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class PlayerDetail extends StatefulWidget {
  final String playerId;

  PlayerDetail({@required this.playerId});

  @override
  _PlayerDetailState createState() => _PlayerDetailState();
}

class _PlayerDetailState extends State<PlayerDetail> {
  bool showSummary = true;
  bool showShooting = false;
  bool showClutch = false;
  bool showSplitsGame = false;
  bool showSplitsGeneral = false;
  bool showSplitsShooting = false;
  bool showDefense = false;

  int _valueType = 1;
  int _valueMeasure = 1;
  int _valuePer = 1;
  String measure = "Base";
  String per = "Totals";

  void summaryClick() {
    setState(() {
      showSummary = true;
      showShooting = false;
      showClutch = false;
      showSplitsGame = false;
      showSplitsGeneral = false;
      showSplitsShooting = false;
      showDefense = false;
    });
  }

  void shootingClick() {
    setState(() {
      showSummary = false;
      showShooting = true;
      showClutch = false;
      showSplitsGame = false;
      showSplitsGeneral = false;
      showSplitsShooting = false;
      showDefense = false;
    });
  }

  void clutchClick() {
    setState(() {
      showSummary = false;
      showShooting = false;
      showClutch = true;
      showSplitsGame = false;
      showSplitsGeneral = false;
      showSplitsShooting = false;
      showDefense = false;
    });
  }

  void splitsGameClick() {
    setState(() {
      showSummary = false;
      showShooting = false;
      showClutch = false;
      showSplitsGame = true;
      showSplitsGeneral = false;
      showSplitsShooting = false;
      showDefense = false;
    });
  }

  void splitsGeneralClick() {
    setState(() {
      showSummary = false;
      showShooting = false;
      showClutch = false;
      showSplitsGame = false;
      showSplitsGeneral = true;
      showSplitsShooting = false;
      showDefense = false;
    });
  }

  void splitsShootingClick() {
    setState(() {
      showSummary = false;
      showShooting = false;
      showClutch = false;
      showSplitsGame = false;
      showSplitsGeneral = false;
      showSplitsShooting = true;
      showDefense = false;
    });
  }

  void defenseClick() {
    setState(() {
      showSummary = false;
      showShooting = false;
      showClutch = false;
      showSplitsGame = false;
      showSplitsGeneral = false;
      showSplitsShooting = false;
      showDefense = true;
    });
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
    } else if (value == 7) {
      _valueMeasure = 7;
      measure = "Usage";
    }
  }

  void updatePer(int value) {
    if (value == 1) {
      _valuePer = 1;
      per = "Totals";
    } else if (value == 2) {
      _valuePer = 2;
      per = "PerGame";
    } else if (value == 3) {
      _valuePer = 3;
      per = "Per48";
    } else if (value == 4) {
      _valuePer = 4;
      per = "Per36";
    } else if (value == 5) {
      _valuePer = 5;
      per = "PerPossession";
    } else if (value == 6) {
      _valuePer = 6;
      per = "Per100Possessions";
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var player = Provider.of<JsonFiles>(context, listen: false)
        .getPlayer(widget.playerId);

    var teamId = player["teamId"];
    var teamColor = ConstantHelper.getTeamColor(teamId);
    var teamTextColor = ConstantHelper.getTeamTextColor(teamId);

    print(widget.playerId);
    print(player["teamId"]);

    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'Player Details',
          style: TextStyle(color: Color(teamTextColor)),
        ),
        backgroundColor: teamColor != null
            ? Color(teamColor)
            : Theme.of(context).primaryColor,
      ),
      body: newMethod(player, deviceWidth, teamColor, teamTextColor),
    );
  }

  SafeArea newMethod(
      player, double deviceWidth, int teamColor, int teamTextColor) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                CachedLogo(
                  url:
                      "https://cdn.nba.com/headshots/nba/latest/1040x760/${player["personId"]}.png",
                  radius: deviceWidth * 0.22,
                ),
                Column(
                  children: [
                    Text(
                      player["firstName"],
                      style: TextStyle(fontSize: 28),
                    ),
                    Text(
                      getShortString(player["lastName"]),
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        Text(
                          "#" + player["jersey"],
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          player["pos"],
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              width: deviceWidth,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Color(teamColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Height',
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                      Text(
                          player["heightFeet"] +
                              "\' " +
                              player["heightInches"] +
                              "\" (" +
                              player["heightMeters"] +
                              ")",
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Weight',
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                      Text(
                          player["weightPounds"] +
                              " (" +
                              player["weightKilograms"] +
                              ")",
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Country',
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                      Text(player["country"],
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Years Pro',
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                      Text(player["yearsPro"],
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              width: deviceWidth,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Color(teamColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Age',
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                      Text(getAge(player["dateOfBirthUTC"]),
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Birthday',
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                      Text(player["dateOfBirthUTC"],
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Drafted',
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                      Row(
                        children: [
                          Text("Pick " + player["draft"]["pickNum"],
                              style: TextStyle(
                                  color: Color(teamTextColor), fontSize: 12)),
                          Text(" R" + player["draft"]["roundNum"],
                              style: TextStyle(
                                  color: Color(teamTextColor), fontSize: 12)),
                          Text(" " + player["draft"]["seasonYear"],
                              style: TextStyle(
                                  color: Color(teamTextColor), fontSize: 12)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('College',
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                      Text(getShortString(player["lastAffiliation"]),
                          style: TextStyle(
                              color: Color(teamTextColor), fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // Use a FutureBuilder to get the player data and then build out a data table or some other widget
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton(
                        value: _valueType,
                        items: [
                          DropdownMenuItem(
                            child: Text("Summary"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Shooting"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("Clutch"),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text("Splits - Game"),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text("Splits - General"),
                            value: 5,
                          ),
                          DropdownMenuItem(
                            child: Text("Splits - Shooting"),
                            value: 6,
                          )
                        ],
                        onChanged: (value) {
                          if (value == 1) {
                            _valueType = 1;
                            _valueMeasure = 1;
                            _valuePer = 1;
                            summaryClick();
                          } else if (value == 2) {
                            _valueType = 2;
                            _valueMeasure = 1;
                            _valuePer = 1;
                            shootingClick();
                          } else if (value == 3) {
                            _valueType = 3;
                            _valueMeasure = 1;
                            _valuePer = 1;
                            clutchClick();
                          } else if (value == 4) {
                            _valueType = 4;
                            _valueMeasure = 1;
                            _valuePer = 1;
                            splitsGameClick();
                          } else if (value == 5) {
                            _valueType = 5;
                            _valueMeasure = 1;
                            _valuePer = 1;
                            splitsGeneralClick();
                          } else if (value == 6) {
                            _valueType = 6;
                            _valueMeasure = 1;
                            _valuePer = 1;
                            splitsShootingClick();
                          }
                        }),
                    showMeasureDropdown()
                        ? DropdownButton(
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
                              DropdownMenuItem(
                                child: Text("Usage"),
                                value: 7,
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                updateMeasure(value);
                              });
                            })
                        : SizedBox(),
                    SizedBox(
                      width: 20,
                    ),
                    showPerModeDropdown()
                        ? DropdownButton(
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
                              DropdownMenuItem(
                                child: Text("Per48"),
                                value: 3,
                              ),
                              DropdownMenuItem(
                                child: Text("Per36"),
                                value: 4,
                              ),
                              DropdownMenuItem(
                                child: Text("PerPoss"),
                                value: 5,
                              ),
                              DropdownMenuItem(
                                child: Text("Per100Poss"),
                                value: 6,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                updatePer(value);
                              });
                            })
                        : SizedBox(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                showSummary
                    ? Column(
                        children: [
                          Text('Base', style: TextStyle(fontSize: 18)),
                          PlayerYearOverYearBaseTable(
                            playerId: widget.playerId,
                            measure: 'Base',
                            per: per,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Advanced', style: TextStyle(fontSize: 18)),
                          PlayerYearOverYearAdvancedTable(
                            playerId: widget.playerId,
                            measure: 'Advanced',
                            per: per,
                          ),
                        ],
                      )
                    : SizedBox(),
                showShooting
                    ? PlayerShootingStatsTable(
                        playerId: widget.playerId,
                        perMode: per,
                      )
                    : SizedBox(),
                showClutch
                    ? PlayerClutchStatsTable(
                        playerId: widget.playerId,
                        measure: measure,
                        per: per,
                      )
                    : SizedBox(),
                showSplitsGame
                    ? Column(
                        children: [
                          PlayerSplitsGameTable(
                            playerId: widget.playerId,
                            measure: measure,
                            per: per,
                          ),
                        ],
                      )
                    : SizedBox(),
                showSplitsGeneral
                    ? Column(
                        children: [
                          PlayerSplitsGeneralTable(
                            playerId: widget.playerId,
                            measure: measure,
                            per: per,
                          ),
                        ],
                      )
                    : SizedBox(),
                showSplitsShooting
                    ? Column(
                        children: [
                          PlayerSplitsShootingTable(
                            playerId: widget.playerId,
                            measure: measure,
                            per: per,
                          ),
                        ],
                      )
                    : SizedBox(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String getAge(String utcDob) {
    var dob = DateTime.parse(utcDob);
    var now = DateTime.now();
    var age = now.difference(dob);
    var years = age.inDays / 365;
    return years.floor().toString();
  }

  String getShortString(String value) {
    if (value.length > 14) {
      return value.substring(0, 13) + "...";
    } else {
      return value;
    }
  }

  bool showMeasureDropdown() {
    if (_valueType > 1 && _valueType != 6) {
      return true;
    }

    return false;
  }

  bool showPerModeDropdown() {
    if (_valueType <= 2) {
      return true;
    } else if (_valueType >= 4) {
      return true;
    }

    return false;
  }
}
