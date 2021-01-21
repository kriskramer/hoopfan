import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/teams_view/team_main.dart';

class InProgressGameHeader extends StatelessWidget {
  final dynamic gameData;
  final dynamic stats;

  InProgressGameHeader({this.gameData, this.stats});

  @override
  Widget build(BuildContext context) {
    var vFullTimeouts = "0";
    var vShortTimeouts = "0";
    var hFullTimeouts = "0";
    var hShortTimeouts = "0";

    var vScore =
        gameData["vTeam"]["score"] == "" ? "0" : gameData["vTeam"]["score"];
    var hScore =
        gameData["hTeam"]["score"] == "" ? "0" : gameData["hTeam"]["score"];
    var seriesWin = gameData["vTeam"]["seriesWin"] == ""
        ? "0"
        : gameData["vTeam"]["seriesWin"];
    var seriesLoss = gameData["vTeam"]["seriesLoss"] == ""
        ? "0"
        : gameData["vTeam"]["seriesLoss"];

    var gameStatus = gameData["statusNum"];
    bool isOverTime = gameData["period"]["current"] > 4 ? true : false;

    if (stats != null) {
      vFullTimeouts = stats["vTeam"]["totals"]["full_timeout_remaining"];
      vShortTimeouts = stats["vTeam"]["totals"]["short_timeout_remaining"];
      hFullTimeouts = stats["hTeam"]["totals"]["full_timeout_remaining"];
      hShortTimeouts = stats["hTeam"]["totals"]["short_timeout_remaining"];
    }

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
                url: ConstantHelper.getTeamLogo(gameData["vTeam"]["teamId"])),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TeamDetails(nbaTeamId: gameData["vTeam"]["teamId"])));
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${gameData["vTeam"]["triCode"]} (${gameData["vTeam"]["win"]} - ${gameData["vTeam"]["loss"]})",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          // THis shows the available timeouts
          Row(
            children: [
              for (int i = 0; i < int.parse(vFullTimeouts); i++)
                Container(
                  margin: EdgeInsets.all(1),
                  child: CircleAvatar(
                    backgroundColor: Colors.cyan,
                    minRadius: 4,
                  ),
                ),
              for (int i = 0; i < int.parse(vShortTimeouts); i++)
                Container(
                  margin: EdgeInsets.all(1),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    minRadius: 3,
                  ),
                ),
            ],
          )
        ]),
        Column(children: [
          Text(
            "$vScore - $hScore",
            style: TextStyle(fontSize: 36, color: Colors.red),
          ),
          gameStatus == 2
              ? Text(getCurrentPeriod(gameData), style: TextStyle(fontSize: 24))
              : gameStatus == 3
                  ? Text(isOverTime ? 'Final / OT' : 'Final',
                      style: TextStyle(fontSize: 24))
                  : Text(''),
          SizedBox(
            height: 5,
          ),
          Text("Series ($seriesWin - $seriesLoss)"),
        ]),
        Column(children: [
          GestureDetector(
            child: CachedLogo(
                radius: 30,
                url: ConstantHelper.getTeamLogo(gameData["hTeam"]["teamId"])),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TeamDetails(nbaTeamId: gameData["hTeam"]["teamId"])));
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${gameData["hTeam"]["triCode"]} (${gameData["hTeam"]["win"]} - ${gameData["hTeam"]["loss"]})",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              for (int i = 0; i < int.parse(hFullTimeouts); i++)
                Container(
                  margin: EdgeInsets.all(1),
                  child: CircleAvatar(
                    backgroundColor: Colors.cyan,
                    minRadius: 4,
                  ),
                ),
              for (int i = 0; i < int.parse(hShortTimeouts); i++)
                Container(
                  margin: EdgeInsets.all(1),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    minRadius: 3,
                  ),
                ),
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
    var period = json["period"]["current"];
    var periodString = "";
    var clock = json["clock"];
    var isHalftime = json["period"]["isHalftime"];
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

    if (isHalftime) {
      clockString = "Halftime";
    } else {
      clockString = periodString + "  " + clock;
    }

    return clockString;
  }
}
