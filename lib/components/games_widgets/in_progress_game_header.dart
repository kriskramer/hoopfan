import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/game_data.dart';
import 'package:hoop/screens/views/teams/team_main.dart';

class InProgressGameHeader extends StatelessWidget {
  final dynamic game;
  final GameData gameData;
  // Both of these objects are just about the same, the main difference is the dynamic game object has wins and losses included in the team objects

  InProgressGameHeader({this.game, this.gameData});

  @override
  Widget build(BuildContext context) {
    int vFullTimeouts = 0;
    int hFullTimeouts = 0;

    var vScore =
        game["awayTeam"]["score"] == "" ? "0" : game["awayTeam"]["score"];
    var hScore =
        game["homeTeam"]["score"] == "" ? "0" : game["homeTeam"]["score"];
    var seriesWin = game["awayTeam"]["seriesWin"] == ""
        ? "0"
        : game["awayTeam"]["seriesWin"];
    var seriesLoss = game["awayTeam"]["seriesLoss"] == ""
        ? "0"
        : game["awayTeam"]["seriesLoss"];

    if (game["playoffs"] != null) {
      seriesWin = game["playoffs"]["seriesSummaryText"];
      seriesLoss = "";
    }

    var gameStatus = game["gameStatus"];
    bool isOverTime = game["period"] > 4 ? true : false;

    vFullTimeouts = game["awayTeam"]["timeoutsRemaining"];
    hFullTimeouts = game["homeTeam"]["timeoutsRemaining"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 10,
        ),
        Column(children: [
          GestureDetector(
            child: CachedLogo(
                radius: 30,
                url: ConstantHelper.getTeamLogo(
                    game["awayTeam"]["teamId"].toString())),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TeamDetails(nbaTeamId: game["awayTeam"]["teamId"])));
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${game["awayTeam"]["teamTricode"]} (${game["awayTeam"]["wins"]} - ${game["awayTeam"]["losses"]})",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 5,
          ),
          // THis shows the available timeouts
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < vFullTimeouts; i++)
                Container(
                  margin: EdgeInsets.all(1),
                  child: CircleAvatar(
                    backgroundColor: Colors.cyan,
                    minRadius: 4,
                  ),
                ),
              // for (int i = 0; i < vShortTimeouts; i++)
              //   Container(
              //     margin: EdgeInsets.all(1),
              //     child: CircleAvatar(
              //       backgroundColor: Colors.red,
              //       minRadius: 3,
              //     ),
              //   ),
            ],
          )
        ]),
        Column(children: [
          Text(
            "$vScore - $hScore",
            style: TextStyle(fontSize: 30, color: Colors.red),
          ),
          Text(game["gameStatusText"], style: TextStyle(fontSize: 18)),
          SizedBox(
            height: 5,
          ),
          seriesWin == null
              ? SizedBox()
              : Text("Series ($seriesWin - $seriesLoss)"),
        ]),
        Column(children: [
          GestureDetector(
            child: CachedLogo(
                radius: 30,
                url: ConstantHelper.getTeamLogo(
                    game["homeTeam"]["teamId"].toString())),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TeamDetails(nbaTeamId: game["homeTeam"]["teamId"])));
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${game["homeTeam"]["teamTricode"]} (${game["homeTeam"]["wins"]} - ${game["homeTeam"]["losses"]})",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              for (int i = 0; i < hFullTimeouts; i++)
                Container(
                  margin: EdgeInsets.all(1),
                  child: CircleAvatar(
                    backgroundColor: Colors.cyan,
                    minRadius: 4,
                  ),
                ),
              // for (int i = 0; i < int.parse(hShortTimeouts); i++)
              //   Container(
              //     margin: EdgeInsets.all(1),
              //     child: CircleAvatar(
              //       backgroundColor: Colors.red,
              //       minRadius: 3,
              //     ),
              //   ),
            ],
          )
        ]),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  String getCurrentPeriod(dynamic json) {
    var period = json["period"];
    var periodString = "";
    var clock = json["clock"];
    //var isHalftime = json["period"]["isHalftime"];
    var clockString = "";

    if (period == 1) {
      periodString = "1st";
    } else if (period == 2) {
      periodString = "2nd";
    } else if (period == 3) {
      periodString = "3rd";
    } else if (period == 4) {
      periodString = "4th";
    } else if (period > 4) {
      periodString = "OT";
    }

    // if (isHalftime) {
    //   clockString = "Halftime";
    // } else {
    //   clockString = periodString + "  " + clock;
    // }

    return clockString;
  }
}
