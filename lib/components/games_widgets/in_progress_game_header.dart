import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/teams/team_main.dart';

class InProgressGameHeader extends StatelessWidget {
  final dynamic gameData;

  InProgressGameHeader({this.gameData});

  @override
  Widget build(BuildContext context) {
    int vFullTimeouts = 0;
    int hFullTimeouts = 0;

    var vScore = gameData["awayTeam"]["score"] == ""
        ? "0"
        : gameData["awayTeam"]["score"];
    var hScore = gameData["homeTeam"]["score"] == ""
        ? "0"
        : gameData["homeTeam"]["score"];
    var seriesWin = gameData["awayTeam"]["seriesWin"] == ""
        ? "0"
        : gameData["awayTeam"]["seriesWin"];
    var seriesLoss = gameData["awayTeam"]["seriesLoss"] == ""
        ? "0"
        : gameData["awayTeam"]["seriesLoss"];

    if (gameData["playoffs"] != null) {
      seriesWin = gameData["playoffs"]["seriesSummaryText"];
      seriesLoss = "";
    }

    var gameStatus = gameData["gameStatus"];
    bool isOverTime = gameData["period"] > 4 ? true : false;

    vFullTimeouts = gameData["awayTeam"]["timeoutsRemaining"];
    hFullTimeouts = gameData["homeTeam"]["timeoutsRemaining"];

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
                    gameData["awayTeam"]["teamId"].toString())),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeamDetails(
                          nbaTeamId: gameData["awayTeam"]["teamId"])));
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${gameData["awayTeam"]["teamTricode"]} (${gameData["awayTeam"]["wins"]} - ${gameData["awayTeam"]["losses"]})",
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
          Text(gameData["gameStatusText"], style: TextStyle(fontSize: 18)),
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
                    gameData["homeTeam"]["teamId"].toString())),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeamDetails(
                          nbaTeamId: gameData["homeTeam"]["teamId"])));
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${gameData["homeTeam"]["teamTricode"]} (${gameData["homeTeam"]["wins"]} - ${gameData["homeTeam"]["losses"]})",
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
