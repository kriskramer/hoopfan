import 'package:flutter/material.dart';

import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/player_widgets/player_clutch_stats_table.dart';
import 'package:hoop/components/player_widgets/player_game_log.dart';
import 'package:hoop/components/player_widgets/player_shooting_stats_table.dart';
import 'package:hoop/components/player_widgets/player_splits_advanced_table.dart';
import 'package:hoop/components/player_widgets/player_splits_game_table.dart';
import 'package:hoop/components/player_widgets/player_splits_general_table.dart';
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
  bool showSplits = false;
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
      showSplits = false;
      showDefense = false;
    });
  }

  void shootingClick() {
    setState(() {
      showSummary = false;
      showShooting = true;
      showClutch = false;
      showSplits = false;
      showDefense = false;
    });
  }

  void clutchClick() {
    setState(() {
      showSummary = false;
      showShooting = false;
      showClutch = true;
      showSplits = false;
      showDefense = false;
    });
  }

  void splitsClick() {
    setState(() {
      showSummary = false;
      showShooting = false;
      showClutch = false;
      showSplits = true;
      showDefense = false;
    });
  }

  void defenseClick() {
    setState(() {
      showSummary = false;
      showShooting = false;
      showClutch = false;
      showSplits = false;
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
      appBar: AppBar(
        title: Text(
          'Player Details',
          style: TextStyle(color: Color(teamTextColor)),
        ),
        backgroundColor: teamColor != null
            ? Color(teamColor)
            : Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
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
            FutureBuilder(
                future: Network.getJson(
                    Urls.nbaPlayerStats("2020", player["personId"])),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    //print(snapshot.data);
                    var statsSummary = snapshot.data["league"]["standard"]
                        ["stats"]["careerSummary"];
                    var statsLatest =
                        snapshot.data["league"]["standard"]["stats"]["latest"];
                    var statsRegSeason = snapshot.data["league"]["standard"]
                        ["stats"]["regularSeason"];

                    //print(statsSummary);
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('View: '),
                            SizedBox(
                              width: 40,
                            ),
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
                                    splitsClick();
                                  }
                                }),
                          ],
                        ),
                        _valueType > 1
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Measure: '),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  DropdownButton(
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
                                      }),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  showTotalsDropDown()
                                      ? DropdownButton(
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
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 10,
                        ),
                        showSummary
                            ? getStatsTable(
                                statsSummary, statsRegSeason, teamId)
                            : SizedBox(),
                        showShooting
                            ? PlayerShootingStatsTable(
                                playerId: widget.playerId,
                              )
                            : SizedBox(),
                        showClutch
                            ? PlayerClutchStatsTable(
                                playerId: widget.playerId,
                                measure: measure,
                                per: per,
                              )
                            : SizedBox(),
                        showSplits
                            ? Column(
                                children: [
                                  // PlayerSplitsGeneralTable(
                                  //   playerId: widget.playerId,
                                  // ),
                                  PlayerSplitsGameTable(
                                    playerId: widget.playerId,
                                    measure: measure,
                                    per: per,
                                  ),
                                  // PlayerSplitsAdvancedTable(
                                  //   playerId: widget.playerId,
                                  // ),
                                ],
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            size: 50,
                          ),
                          Text("An error occured!"),
                        ],
                      ),
                    );
                  } else if (snapshot.data == null) {
                    return NoConnection();
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  //return Text('data');
                }),

            // The bio seems to only work for some players. Taking it out for now
            // FutureBuilder(
            //     future: Network.getplayer(Urls.nbaPlayerBio(player["personId"])),
            //     builder:
            //         (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //       var widget;
            //       if (snapshot.hasData) {
            //         print(snapshot.data);
            //         var bio = snapshot.data["Bio"];
            //         widget = Column(
            //           children: [
            //             Text(bio["professional"]
            //                 .toString()
            //                 .replaceAll("</br>", "")),
            //           ],
            //         );
            //       } else if (snapshot.hasError) {
            //         return Center(
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Icon(
            //                 Icons.error,
            //                 size: 50,
            //               ),
            //               Text("An error occured!"),
            //             ],
            //           ),
            //         );
            //       } else if (snapshot.data == null) {
            //         return NoConnection();
            //       } else {
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //       return widget;
            //     }),
          ],
        ),
      ),
    );
  }

  Widget getStatsTable(dynamic summary, dynamic seasons, String teamId) {
    var table;
    List<DataRow> rows = new List<DataRow>();

    // Generate summary row
    rows.add(DataRow(cells: [
      DataCell(Text(
        "Career",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["min"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["ppg"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["rpg"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["apg"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["spg"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["bpg"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["fgm"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["fga"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["fgp"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["ftm"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["fta"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["ftp"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["tpm"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["tpa"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["tpp"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["plusMinus"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["points"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["offReb"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["defReb"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["totReb"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["assists"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["blocks"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["steals"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["turnovers"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    ]));

    // Generate a row for each season
    for (int i = 0; i < seasons["season"].length; i++) {
      var s = seasons["season"][i];
      rows.add(DataRow(cells: [
        DataCell(Text(s["seasonYear"].toString()), onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayerGameLogTable(
                  playerId: widget.playerId,
                  season: s["seasonYear"].toString(),
                  teamId: teamId),
            ),
          );
        }),
        DataCell(Text(s["total"]["min"])),
        DataCell(Text(s["total"]["ppg"])),
        DataCell(Text(s["total"]["rpg"])),
        DataCell(Text(s["total"]["apg"])),
        DataCell(Text(s["total"]["spg"])),
        DataCell(Text(s["total"]["bpg"])),
        DataCell(Text(s["total"]["fgm"])),
        DataCell(Text(s["total"]["fga"])),
        DataCell(Text(s["total"]["fgp"])),
        DataCell(Text(s["total"]["ftm"])),
        DataCell(Text(s["total"]["fta"])),
        DataCell(Text(s["total"]["ftp"])),
        DataCell(Text(s["total"]["tpm"])),
        DataCell(Text(s["total"]["tpa"])),
        DataCell(Text(s["total"]["tpp"])),
        DataCell(Text(s["total"]["plusMinus"])),
        DataCell(Text(s["total"]["points"])),
        DataCell(Text(s["total"]["offReb"])),
        DataCell(Text(s["total"]["defReb"])),
        DataCell(Text(s["total"]["totReb"])),
        DataCell(Text(s["total"]["assists"])),
        DataCell(Text(s["total"]["blocks"])),
        DataCell(Text(s["total"]["steals"])),
        DataCell(Text(s["total"]["turnovers"])),
      ]));
    }

    table = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
          columnSpacing: 14,
          dataRowHeight: 30,
          headingRowHeight: 30,
          headingTextStyle:
              TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
          headingRowColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return Colors.grey[300]; // Use the default value.
          }),
          columns: [
            DataColumn(label: Text("Year")),
            DataColumn(label: Text("MIN")),
            DataColumn(label: Text("PPG")),
            DataColumn(label: Text("RPG")),
            DataColumn(label: Text("APG")),
            DataColumn(label: Text("SPG")),
            DataColumn(label: Text("BPG")),
            DataColumn(label: Text("FGM")),
            DataColumn(label: Text("FGA")),
            DataColumn(label: Text("FG%")),
            DataColumn(label: Text("FTM")),
            DataColumn(label: Text("FTA")),
            DataColumn(label: Text("FT%")),
            DataColumn(label: Text("3PM")),
            DataColumn(label: Text("3PA")),
            DataColumn(label: Text("3P%")),
            DataColumn(label: Text("+/-")),
            DataColumn(label: Text("Pts")),
            DataColumn(label: Text("Off Reb")),
            DataColumn(label: Text("Def Reb")),
            DataColumn(label: Text("Tot Reb")),
            DataColumn(label: Text("Asts")),
            DataColumn(label: Text("Blks")),
            DataColumn(label: Text("Stls")),
            DataColumn(label: Text("TOs")),
          ],
          rows: rows),
    );

    return table;
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

  bool showTotalsDropDown() {
    if (_valueType == 2) {
      return true;
    } else if (_valueType == 4) {
      return true;
    }

    return false;
  }
}
