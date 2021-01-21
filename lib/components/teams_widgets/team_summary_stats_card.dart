import 'package:flutter/material.dart';
import 'dart:math';
import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class TeamSummaryStats extends StatelessWidget {
  final dynamic teamId;

  TeamSummaryStats({this.teamId});

  @override
  Widget build(BuildContext context) {
    final ta = ConstantHelper.getTeamDetailsBasic(teamId);
    final standingsJson = Provider.of<JsonFiles>(context, listen: false)
        .getStandings()["league"]["standard"]["conference"];

    var standings = getTeamStandingsFromJson(teamId, standingsJson, ta[3]);

    //final social = team[2]["SocialSites"];

    final teamStats =
        Provider.of<JsonFiles>(context, listen: false).getTeamStats(teamId);

    return Container(
      //width: deviceWidth - 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300], width: 1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                stat(teamStats == null ? "0" : teamStats["ppg"]["avg"],
                    teamStats == null ? "0" : teamStats["ppg"]["rank"], "PPG"),
                stat(
                    teamStats == null ? "0" : teamStats["oppg"]["avg"],
                    teamStats == null ? "0" : teamStats["oppg"]["rank"],
                    "OPPG"),
                stat(teamStats == null ? "0" : teamStats["eff"]["avg"],
                    teamStats == null ? "0" : teamStats["eff"]["rank"], "EFF"),
                stat(
                    teamStats == null
                        ? "0"
                        : getPythagorean(
                            teamStats["ppg"]["avg"].toString(),
                            teamStats["oppg"]["avg"].toString(),
                            standings["win"],
                            standings["loss"]),
                    "",
                    "Pyth W-L"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                stat(teamStats == null ? "0" : teamStats["fgp"]["avg"],
                    teamStats == null ? "0" : teamStats["fgp"]["rank"], "FG%"),
                stat(teamStats == null ? "0" : teamStats["tpp"]["avg"],
                    teamStats == null ? "0" : teamStats["tpp"]["rank"], "3P%"),
                stat(teamStats == null ? "0" : teamStats["ftp"]["avg"],
                    teamStats == null ? "0" : teamStats["ftp"]["rank"], "FT%"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                stat(
                    teamStats == null ? "0" : teamStats["orpg"]["avg"],
                    teamStats == null ? "0" : teamStats["orpg"]["rank"],
                    "ORPG"),
                stat(
                    teamStats == null ? "0" : teamStats["drpg"]["avg"],
                    teamStats == null ? "0" : teamStats["drpg"]["rank"],
                    "DRPG"),
                stat(
                    teamStats == null ? "0" : teamStats["trpg"]["avg"],
                    teamStats == null ? "0" : teamStats["trpg"]["rank"],
                    "TRPG"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                stat(teamStats == null ? "0" : teamStats["apg"]["avg"],
                    teamStats == null ? "0" : teamStats["apg"]["rank"], "APG"),
                stat(teamStats == null ? "0" : teamStats["spg"]["avg"],
                    teamStats == null ? "0" : teamStats["spg"]["rank"], "SPG"),
                stat(teamStats == null ? "0" : teamStats["bpg"]["avg"],
                    teamStats == null ? "0" : teamStats["bpg"]["rank"], "BPG"),
              ],
            ),
            SizedBox(height: 10),
          ]),
        ],
      ),
    );
  }

  Widget stat(String value, String rank, String desc) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          rank == "" ? "$desc" : "$desc ($rank)",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  String getPythagorean(
      String ppgString, String oppgString, String wins, String losses) {
    int w = int.parse(wins);
    int l = int.parse(losses);
    int games = w + l;
    double ppg = double.parse(ppgString);
    double oppg = double.parse(oppgString);

    double pyth = games * (pow(ppg, 16.5) / (pow(ppg, 16.5) + pow(oppg, 16.5)));
    String pythW = pyth.toStringAsFixed(0);
    String pythL = (games - int.parse(pythW)).toString();
    return pythW + "-" + pythL;
  }

  String getORtg(String points, String fga, String fta, String turnovers) {
    double ortg = 100 *
        int.parse(points) /
        (int.parse(fga) + (0.44 * int.parse(fta)) + int.parse(turnovers));

    return ortg.toStringAsFixed(2);
  }

  String getDRtg(
      String opponentPoints, String fga, String fta, String turnovers) {
    double drtg = 100 *
        int.parse(opponentPoints) /
        (int.parse(fga) + (0.44 * int.parse(fta)) + int.parse(turnovers));

    return drtg.toStringAsFixed(2);
  }

  dynamic getTeamStandingsFromJson(
      String teamId, dynamic json, String conference) {
    dynamic team;

    if (conference.toLowerCase() == "east") {
      for (var t in json["east"]) {
        if (t["teamId"] == teamId) {
          team = t;
          break;
        }
      }
    } else {
      for (var t in json["west"]) {
        if (t["teamId"] == teamId) {
          team = t;
          break;
        }
      }
    }

    return team;
  }
}
