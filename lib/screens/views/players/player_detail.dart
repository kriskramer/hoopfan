import 'package:flutter/material.dart';

import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class PlayerDetail extends StatelessWidget {
  final String playerId;

  PlayerDetail({@required this.playerId});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var player =
        Provider.of<JsonFiles>(context, listen: false).getPlayer(playerId);

    var teamColor = ConstantHelper.getTeamColor(player["teamId"]);
    var teamTextColor = ConstantHelper.getTeamTextColor(player["teamId"]);

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
                  radius: 100,
                ),
                Column(
                  children: [
                    Text(
                      player["firstName"],
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      player["lastName"],
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
                          style: TextStyle(color: Color(teamTextColor))),
                      Text(
                          player["heightFeet"] +
                              "\' " +
                              player["heightInches"] +
                              "\" (" +
                              player["heightMeters"] +
                              ")",
                          style: TextStyle(color: Color(teamTextColor))),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Weight',
                          style: TextStyle(color: Color(teamTextColor))),
                      Text(
                          player["weightPounds"] +
                              " (" +
                              player["weightKilograms"] +
                              ")",
                          style: TextStyle(color: Color(teamTextColor))),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Country',
                          style: TextStyle(color: Color(teamTextColor))),
                      Text(player["country"],
                          style: TextStyle(color: Color(teamTextColor))),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Years Pro',
                          style: TextStyle(color: Color(teamTextColor))),
                      Text(player["yearsPro"],
                          style: TextStyle(color: Color(teamTextColor))),
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
                          style: TextStyle(color: Color(teamTextColor))),
                      Text(getAge(player["dateOfBirthUTC"]),
                          style: TextStyle(color: Color(teamTextColor))),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Birthday',
                          style: TextStyle(color: Color(teamTextColor))),
                      Text(player["dateOfBirthUTC"],
                          style: TextStyle(color: Color(teamTextColor))),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Drafted',
                          style: TextStyle(color: Color(teamTextColor))),
                      Row(
                        children: [
                          Text("Pick " + player["draft"]["pickNum"],
                              style: TextStyle(color: Color(teamTextColor))),
                          Text(" R" + player["draft"]["roundNum"],
                              style: TextStyle(color: Color(teamTextColor))),
                          Text(" " + player["draft"]["seasonYear"],
                              style: TextStyle(color: Color(teamTextColor))),
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
                          style: TextStyle(color: Color(teamTextColor))),
                      Text(getShortString(player["lastAffiliation"]),
                          style: TextStyle(color: Color(teamTextColor))),
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
                        Text(
                          'Per Game Stats',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        getStatsTable(statsSummary, statsRegSeason)
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

  Widget getStatsTable(dynamic summary, dynamic seasons) {
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
        DataCell(Text(s["seasonYear"].toString())),
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
    if (value.length > 16) {
      return value.substring(0, 15) + "...";
    } else {
      return value;
    }
  }
}
