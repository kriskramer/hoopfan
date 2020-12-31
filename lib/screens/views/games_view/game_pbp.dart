import 'package:flutter/material.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:hoop/components/games_widgets/game_lead_tracker.dart';

import '../../../constant.dart';

class GamePlayByPlay extends StatelessWidget {
  final dynamic gameData;

  GamePlayByPlay({this.gameData});

  @override
  Widget build(BuildContext context) {
    String date = gameData["startDateEastern"];
    String gameId = gameData["gameId"];

    //var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Play by Play'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          FutureBuilder(
            future: Network.getJson(Urls.nbaPlayByPlay(date, gameId, "1")),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var plays = snapshot.data["plays"];
                return ExpansionTile(
                  title: Text('1st quarter'),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: plays.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(plays[index]["clock"] + " - "),
                                getTeamCard(
                                    plays[index]["description"], gameData),
                                Flexible(
                                    child: Text(getPbPDescriptionFormatted(
                                        plays[index]["description"], gameData)))
                              ],
                            ),
                          );
                        }),
                  ],
                );
              }
              return Text('');
            },
          ),
          FutureBuilder(
            future: Network.getJson(Urls.nbaPlayByPlay(date, gameId, "2")),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var plays = snapshot.data["plays"];
                return ExpansionTile(
                  title: Text('2nd quarter'),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: plays.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(plays[index]["clock"] + " - "),
                                getTeamCard(
                                    plays[index]["description"], gameData),
                                Flexible(
                                    child: Text(getPbPDescriptionFormatted(
                                        plays[index]["description"], gameData)))
                              ],
                            ),
                          );
                        }),
                  ],
                );
              }
              return Text('');
            },
          ),
          FutureBuilder(
            future: Network.getJson(Urls.nbaPlayByPlay(date, gameId, "3")),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var plays = snapshot.data["plays"];
                return ExpansionTile(
                  title: Text('3rd quarter'),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: plays.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(plays[index]["clock"] + " - "),
                                getTeamCard(
                                    plays[index]["description"], gameData),
                                Flexible(
                                    child: Text(getPbPDescriptionFormatted(
                                        plays[index]["description"], gameData)))
                              ],
                            ),
                          );
                        }),
                  ],
                );
              }
              return Text('');
            },
          ),
          FutureBuilder(
            future: Network.getJson(Urls.nbaPlayByPlay(date, gameId, "4")),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var plays = snapshot.data["plays"];
                return ExpansionTile(
                  title: Text('4th quarter'),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: plays.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(plays[index]["clock"] + " - "),
                                getTeamCard(
                                    plays[index]["description"], gameData),
                                Flexible(
                                    child: Text(getPbPDescriptionFormatted(
                                        plays[index]["description"], gameData)))
                              ],
                            ),
                          );
                        }),
                  ],
                );
              }
              return Text('');
            },
          ),
          FutureBuilder(
              future: Network.getJson(Urls.nbaPlayByPlay(date, gameId, "1")),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var plays = snapshot.data["plays"];
                  return GameLeadChart(
                    pbp: plays,
                    vTeamId: gameData["vTeam"]["teamId"],
                    hTeamId: gameData["hTeam"]["teamId"],
                    period: "1",
                  );
                }
                return Text('');
              }),
          SizedBox(
            height: 5,
          ),
          FutureBuilder(
              future: Network.getJson(Urls.nbaPlayByPlay(date, gameId, "2")),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var plays = snapshot.data["plays"];
                  return GameLeadChart(
                    pbp: plays,
                    vTeamId: gameData["vTeam"]["teamId"],
                    hTeamId: gameData["hTeam"]["teamId"],
                    period: "2",
                  );
                }
                return Text('');
              }),
          SizedBox(
            height: 5,
          ),
          FutureBuilder(
              future: Network.getJson(Urls.nbaPlayByPlay(date, gameId, "3")),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var plays = snapshot.data["plays"];
                  return GameLeadChart(
                    pbp: plays,
                    vTeamId: gameData["vTeam"]["teamId"],
                    hTeamId: gameData["hTeam"]["teamId"],
                    period: "3",
                  );
                }
                return Text('');
              }),
          SizedBox(
            height: 5,
          ),
          FutureBuilder(
              future: Network.getJson(Urls.nbaPlayByPlay(date, gameId, "4")),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var plays = snapshot.data["plays"];
                  return GameLeadChart(
                    pbp: plays,
                    vTeamId: gameData["vTeam"]["teamId"],
                    hTeamId: gameData["hTeam"]["teamId"],
                    period: "4",
                  );
                }
                return Text('');
              }),
          SizedBox(
            height: 5,
          ),
        ]),
      ),
    );
  }

  //Future<bool> loadData(BuildContext context) async {}

  Widget getTeamCard(String desc, dynamic game) {
    String vTeamTriCode = game["vTeam"]["triCode"];
    String hTeamTriCode = game["hTeam"]["triCode"];

    var vTeamId = gameData["vTeam"]["teamId"];
    var hTeamId = gameData["hTeam"]["teamId"];
    var vTeamColor = ConstantHelper.getTeamColor(vTeamId);
    var vTeamTextColor = ConstantHelper.getTeamTextColor(vTeamId);
    var hTeamColor = ConstantHelper.getTeamColor(hTeamId);
    var hTeamTextColor = ConstantHelper.getTeamTextColor(hTeamId);

    int vTeamIndex = desc.indexOf("[" + vTeamTriCode) + 1;
    int hTeamIndex = desc.indexOf("[" + hTeamTriCode) + 1;

    if (vTeamIndex > 0) {
      return Card(
        elevation: 1,
        child: Container(
          color: Color(vTeamColor),
          padding: EdgeInsets.all(2),
          child: Text(
            vTeamTriCode,
            style: TextStyle(color: Color(vTeamTextColor)),
          ),
        ),
      );
    } else if (hTeamIndex > 0) {
      return Card(
        elevation: 1,
        child: Container(
          color: Color(hTeamColor),
          padding: EdgeInsets.all(2),
          child: Text(
            hTeamTriCode,
            style: TextStyle(color: Color(hTeamTextColor)),
          ),
        ),
      );
    } else {
      return Text('');
    }
  }

  String getPbPDescriptionFormatted(String desc, dynamic game) {
    String vTeamTriCode = game["vTeam"]["triCode"];
    String hTeamTriCode = game["hTeam"]["triCode"];
    desc = desc.replaceAll("[" + vTeamTriCode + "]", "");
    desc = desc.replaceAll("[" + hTeamTriCode + "]", "");
    desc = desc.replaceAll("[" + vTeamTriCode + " ", "[");
    desc = desc.replaceAll("[" + hTeamTriCode + " ", "[");

    return desc;
  }
}
