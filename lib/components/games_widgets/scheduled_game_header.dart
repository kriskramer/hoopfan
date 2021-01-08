import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/teams_view/teaminfo.dart';

class ScheduledGameHeader extends StatelessWidget {
  final dynamic gameData;

  ScheduledGameHeader({this.gameData});

  @override
  Widget build(BuildContext context) {
    var countdown = getStartCountdown(gameData);
    var seriesWin = gameData["vTeam"]["seriesWin"] == ""
        ? "0"
        : gameData["vTeam"]["seriesWin"];
    var seriesLoss = gameData["vTeam"]["seriesLoss"] == ""
        ? "0"
        : gameData["vTeam"]["seriesLoss"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(children: [
          GestureDetector(
            child: CachedLogo(
                radius: 40,
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
            style: TextStyle(fontSize: 18),
          ),
        ]),
        Column(children: [
          Text(formatDate(gameData["startDateEastern"]),
              style: TextStyle(fontSize: 18)),
          Text(gameData["startTimeEastern"], style: TextStyle(fontSize: 18)),
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
                radius: 40,
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
            style: TextStyle(fontSize: 18),
          ),
        ]),
      ],
    );
  }

  String formatDate(String date) {
    String d = "";

    var dt = DateTime.parse(date);
    d = "${dt.month}-${dt.day}-${dt.year}";

    return d;
  }

  String getStartCountdown(dynamic game) {
    String startTimeUTC = game["startTimeUTC"];

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
