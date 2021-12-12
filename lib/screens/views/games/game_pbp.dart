import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/model/lead_tracker.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:hoop/components/games_widgets/game_lead_tracker.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class GamePlayByPlay extends StatelessWidget {
  final dynamic gameData;

  GamePlayByPlay({this.gameData});

  @override
  Widget build(BuildContext context) {
    String date = gameData["startDateEastern"];
    String gameId = gameData["gameId"];
    LeadTrackerList list = LeadTrackerList();

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
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
                'Tap a row in the lead tracker to see scoring trends up to that moment in the game.'),
          ),
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
          getLeadTrackerBuilder(date, gameData, "1", context, list),
          gameData["period"]["current"] >= 2
              ? getLeadTrackerBuilder(date, gameData, "2", context, list)
              : SizedBox(),
          gameData["period"]["current"] >= 3
              ? getLeadTrackerBuilder(date, gameData, "3", context, list)
              : SizedBox(),
          gameData["period"]["current"] >= 4
              ? getLeadTrackerBuilder(date, gameData, "4", context, list)
              : SizedBox(),
          gameData["period"]["current"] >= 5
              ? getLeadTrackerBuilder(date, gameData, "5", context, list)
              : SizedBox(),
          gameData["period"]["current"] >= 6
              ? getLeadTrackerBuilder(date, gameData, "6", context, list)
              : SizedBox(),
          SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }

  //Future<bool> loadData(BuildContext context) async {}

  Widget getLeadTrackerBuilder(String date, dynamic gameData, String period,
      BuildContext context, LeadTrackerList list) {
    String date = gameData["startDateEastern"];
    String gameId = gameData["gameId"];
    Future<dynamic> _pbpFeed;

    // String gameAndPeriodId = gameId + "-" + period;
    // if (Provider.of<JsonFiles>(context, listen: false)
    //         .getPbp(gameAndPeriodId) !=
    //     null) {
    //   _pbpFeed = Provider.of<JsonFiles>(context, listen: false)
    //       .getPbp(gameAndPeriodId);
    // } else {
    _pbpFeed = Network.getJson(Urls.nbaPlayByPlay(date, gameId, period));
    // }

    return FutureBuilder(
        future:
            _pbpFeed, //Network.getJson(Urls.nbaPlayByPlay(date, gameId, period)),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var plays = snapshot.data["plays"];

            Provider.of<JsonFiles>(context, listen: false)
                .setGamePbp(gameId + "-" + period, plays);

            return GameLeadChart(
              pbp: plays,
              vTeamId: gameData["vTeam"]["teamId"],
              hTeamId: gameData["hTeam"]["teamId"],
              period: period,
              game: gameData,
            );
          }
          return Text('');
        });
  }

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
