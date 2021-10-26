import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hoop/components/player_widgets/player_clutch_stats_table.dart';
import 'package:hoop/components/player_widgets/player_shooting_stats_table.dart';
import 'package:hoop/components/player_widgets/player_splits_game_table.dart';
import 'package:hoop/components/player_widgets/player_splits_general_table.dart';
import 'package:hoop/components/player_widgets/player_splits_shooting_table.dart';
import 'package:hoop/components/player_widgets/player_year_over_year_advanced_table.dart';
import 'package:hoop/components/player_widgets/player_year_over_year_base_table.dart';

class PlayerDetailedStats extends StatefulWidget {
  final String playerId;
  final String playerName;
  const PlayerDetailedStats(this.playerId, this.playerName);

  @override
  _PlayerDetailedStatsState createState() => _PlayerDetailedStatsState();
}

class _PlayerDetailedStatsState extends State<PlayerDetailedStats> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detailed Player Stats"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(15),
                  child:
                      Text(widget.playerName, style: TextStyle(fontSize: 20))),
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
        ),
      ),
    );
  }
}
