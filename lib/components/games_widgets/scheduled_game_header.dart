import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/teams/team_main.dart';
import 'package:hoop/utils/formatdate.dart';

class ScheduledGameHeader extends StatelessWidget {
  final dynamic gameData;

  ScheduledGameHeader({this.gameData});

  @override
  Widget build(BuildContext context) {
    var countdown = getStartCountdown(gameData);
    var seriesWin = gameData["awayTeam"]["seriesWin"] == ""
        ? "0"
        : gameData["awayTeam"]["seriesWin"];
    var seriesLoss = gameData["awayTeam"]["seriesLoss"] == ""
        ? "0"
        : gameData["awayTeam"]["seriesLoss"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(children: [
          GestureDetector(
            child: CachedLogo(
                radius: 35,
                url: ConstantHelper.getTeamLogo(
                    gameData["awayTeam"]["teamId"].toString())),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeamDetails(
                          nbaTeamId:
                              gameData["awayTeam"]["teamId"].toString())));
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${gameData["awayTeam"]["teamTricode"]} (${gameData["awayTeam"]["wins"]} - ${gameData["awayTeam"]["losses"]})",
            style: TextStyle(fontSize: 14),
          ),
        ]),
        Column(children: [
          SizedBox(
            height: 10,
          ),
          Text(
            formatDate(gameData["gameTimeUTC"].toString())[0],
            style: TextStyle(fontSize: 18),
          ),
          Text(
            formatDate(gameData["gameTimeUTC"].toString())[1],
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Series ($seriesWin - $seriesLoss)"),
          SizedBox(
            height: 5,
          ),
          countdown != ""
              ? Container(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    countdown,
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                  ))
              : SizedBox(
                  height: 1,
                ),
        ]),
        Column(children: [
          GestureDetector(
            child: CachedLogo(
                radius: 35,
                url: ConstantHelper.getTeamLogo(
                    gameData["homeTeam"]["teamId"].toString())),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeamDetails(
                          nbaTeamId:
                              gameData["homeTeam"]["teamId"].toString())));
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${gameData["homeTeam"]["teamTricode"]} (${gameData["homeTeam"]["wins"]} - ${gameData["homeTeam"]["losses"]})",
            style: TextStyle(fontSize: 14),
          ),
        ]),
      ],
    );
  }

  String getStartCountdown(dynamic game) {
    String startTimeUTC = game["gameTimeUTC"];

    if (startTimeUTC == "") {
      return "";
    }

    DateTime start = DateTime.parse(startTimeUTC);

    Duration duration = start.difference(DateTime.now());

    if (duration.inMinutes < 91 && duration.inMinutes > 0) {
      return "${duration.inMinutes.toString()} min to go!";
    }

    return "";
  }
}
