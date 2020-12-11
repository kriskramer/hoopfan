import 'package:flutter/material.dart';

import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class PlayerDetail extends StatelessWidget {
  final dynamic json;
  final int teamColor;

  PlayerDetail({@required this.json, this.teamColor});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Player Details'),
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
                      "https://cdn.nba.com/headshots/nba/latest/1040x760/${json["personId"]}.png",
                  radius: 100,
                ),
                Column(
                  children: [
                    Text(
                      json["firstName"],
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      json["lastName"],
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        Text(
                          "#" + json["jersey"],
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          json["pos"],
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
                      Text('Height', style: TextStyle(color: Colors.white70)),
                      Text(
                          json["heightFeet"] +
                              "\' " +
                              json["heightInches"] +
                              "\" (" +
                              json["heightMeters"] +
                              ")",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Weight', style: TextStyle(color: Colors.white70)),
                      Text(
                          json["weightPounds"] +
                              " (" +
                              json["weightKilograms"] +
                              ")",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Country', style: TextStyle(color: Colors.white70)),
                      Text(json["country"],
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Years Pro',
                          style: TextStyle(color: Colors.white70)),
                      Text(json["yearsPro"],
                          style: TextStyle(color: Colors.white)),
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
                      Text('Age', style: TextStyle(color: Colors.white70)),
                      Text(getAge(json["dateOfBirthUTC"]),
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Birthday', style: TextStyle(color: Colors.white70)),
                      Text(json["dateOfBirthUTC"],
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Drafted', style: TextStyle(color: Colors.white70)),
                      Row(
                        children: [
                          Text("Pick " + json["draft"]["pickNum"],
                              style: TextStyle(color: Colors.white)),
                          Text(" R" + json["draft"]["roundNum"],
                              style: TextStyle(color: Colors.white)),
                          Text(" " + json["draft"]["seasonYear"],
                              style: TextStyle(color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('College', style: TextStyle(color: Colors.white70)),
                      Text(getShortString(json["lastAffiliation"]),
                          style: TextStyle(color: Colors.white)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            // Use a FutureBuilder to get the player data and then build out a data table or some other widget
            FutureBuilder(
                future: Network.getJson(
                    Urls.nbaPlayerStats("2020", json["personId"])),
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

                    return getStatsTable(statsSummary, statsRegSeason);
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

            // This seems to only work for some players. Taking it out for now
            // FutureBuilder(
            //     future: Network.getJson(Urls.nbaPlayerBio(json["personId"])),
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
