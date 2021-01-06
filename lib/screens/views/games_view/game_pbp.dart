import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
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

    bool isOvertime = gameData["period"]["current"] > 4 ? true : false;

    //var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Play by Play'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(
            height: 8,
          ),
          Text(
              'Tap on the lead tracker to get the play-by-play for that period.'),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedLogo(
                  radius: 30,
                  url: ConstantHelper.getTeamLogo(gameData["vTeam"]["teamId"])),
              SizedBox(
                width: 25,
              ),
              CachedLogo(
                  radius: 30,
                  url: ConstantHelper.getTeamLogo(gameData["hTeam"]["teamId"]))
            ],
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
                    game: gameData,
                  );
                }
                return Text('');
              }),
          // SizedBox(
          //   height: 5,
          // ),
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
                    game: gameData,
                  );
                }
                return Text('');
              }),
          // SizedBox(
          //   height: 5,
          // ),
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
                    game: gameData,
                  );
                }
                return Text('');
              }),
          // SizedBox(
          //   height: 5,
          // ),
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
                    game: gameData,
                  );
                }
                return Text('');
              }),
          // SizedBox(
          //   height: 5,
          // ),
          gameData["period"]["current"] == 5
              ? FutureBuilder(
                  future:
                      Network.getJson(Urls.nbaPlayByPlay(date, gameId, "5")),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var plays = snapshot.data["plays"];
                      return GameLeadChart(
                        pbp: plays,
                        vTeamId: gameData["vTeam"]["teamId"],
                        hTeamId: gameData["hTeam"]["teamId"],
                        period: "OT 1",
                        game: gameData,
                      );
                    }
                    return Text('');
                  })
              : SizedBox(),
          gameData["period"]["current"] == 6
              ? FutureBuilder(
                  future:
                      Network.getJson(Urls.nbaPlayByPlay(date, gameId, "6")),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var plays = snapshot.data["plays"];
                      return GameLeadChart(
                        pbp: plays,
                        vTeamId: gameData["vTeam"]["teamId"],
                        hTeamId: gameData["hTeam"]["teamId"],
                        period: "OT 2",
                        game: gameData,
                      );
                    }
                    return Text('');
                  })
              : SizedBox(),
          SizedBox(
            height: 30,
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
