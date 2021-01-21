import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class TeamFourFactorsStatsCard extends StatelessWidget {
  final String teamId;

  TeamFourFactorsStatsCard({this.teamId});

  @override
  Widget build(BuildContext context) {
    dynamic stats = Provider.of<JsonFiles>(context, listen: false)
        .getFourFactorsTeamStats();
    var teamStats = getTeamStats(teamId, stats);

    return Container(
      child: Column(children: [
        Card(
          elevation: 4,
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
                    getCardStat('Eff FG %', teamStats[7].toString()),
                    getCardStat('FTA Rate', teamStats[8].toString()),
                    getCardStat('Tm TO %', teamStats[9].toString()),
                    getCardStat('OReb %', teamStats[10].toString()),
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
                    getCardStat('Eff FG %', teamStats[11].toString()),
                    getCardStat('FTA Rate', teamStats[12].toString()),
                    getCardStat('TO %', teamStats[13].toString()),
                    getCardStat('OReb %', teamStats[14].toString()),
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

  Widget getCardStat(String label, String value) {
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
      ],
    );
  }
}
