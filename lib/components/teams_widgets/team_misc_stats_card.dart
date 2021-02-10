import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class TeamMiscStatsCard extends StatelessWidget {
  final String teamId;

  TeamMiscStatsCard({this.teamId});

  @override
  Widget build(BuildContext context) {
    dynamic stats =
        Provider.of<JsonFiles>(context, listen: false).getMiscTeamStats();
    var teamStats = getTeamStats(teamId, stats);

    return Container(
      child: Column(children: [
        Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Team'),
                    getCardStat('Pts off TOs', teamStats[7].toString(),
                        teamStats[20].toString()),
                    getCardStat('2nd Chance Pts', teamStats[8].toString(),
                        teamStats[21].toString()),
                    getCardStat('FB Pts', teamStats[9].toString(),
                        teamStats[22].toString()),
                    getCardStat('Pts in Paint', teamStats[10].toString(),
                        teamStats[23].toString()),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Opponent'),
                    getCardStat('Pts off TOs', teamStats[11].toString(),
                        teamStats[24].toString()),
                    getCardStat('2nd Chance Pts', teamStats[12].toString(),
                        teamStats[25].toString()),
                    getCardStat('FB Pts', teamStats[13].toString(),
                        teamStats[26].toString()),
                    getCardStat('Pts in Paint', teamStats[14].toString(),
                        teamStats[27].toString()),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )
              ]),
        ),
      ]),
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

  Widget getCardStat(String label, String value, String rank) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: 75,
          child: Text(
            label,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red[900]),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          padding: EdgeInsets.all(5),
          width: 75,
          child: Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        ),
        rank == ''
            ? Container(
                child: Text('na'),
              )
            : Container(
                child: Text("(" + rank + ")"),
              )
      ],
    );
  }
}
