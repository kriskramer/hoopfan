import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class TeamStatsSmall extends StatelessWidget {
  final String teamId;

  const TeamStatsSmall(this.teamId);

  @override
  Widget build(BuildContext context) {
    dynamic baseStats =
        Provider.of<JsonFiles>(context, listen: false).getBaseTeamStats();
    var teamStats = getTeamStats(teamId, baseStats);

    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            standing("${teamStats[9]}", "FG %"),
            standing("${teamStats[12]}", "3P %"),
            standing("${teamStats[15]}", "FT %"),
            standing("${teamStats[19]}", "Asts"),
            standing("${teamStats[20]}", "TOs"),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            standing("${teamStats[18]}", "Reb"),
            standing("${teamStats[21]}", "Stls"),
            standing("${teamStats[22]}", "Blks"),
            standing("${teamStats[24]}", "PFs"),
            standing("${teamStats[27]}", "+/-"),
          ],
        ),
      ]),
    );
  }

  Widget standing(String value, String desc) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            "$desc",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          Container(
              height: 1,
              width: 30,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400], width: 1))),
          Text(
            value,
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  dynamic getTeamStats(String teamId, dynamic stats) {
    dynamic team;
    for (var t in stats["resultSets"][0]["rowSet"]) {
      if (t[0].toString() == teamId) {
        team = t;
      }
    }

    return team;
  }
}
