import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class TeamEstimatedStatsCard extends StatelessWidget {
  final String teamId;

  TeamEstimatedStatsCard({this.teamId});

  @override
  Widget build(BuildContext context) {
    dynamic estimatedStats =
        Provider.of<JsonFiles>(context, listen: false).getEstimatedTeamStats();
    var teamStats = getTeamEstimatedStats(teamId, estimatedStats);

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
                    getCardStat('W', teamStats[3].toString()),
                    getCardStat('L', teamStats[4].toString()),
                    getCardStat('Win %', teamStats[5].toString()),
                    getCardStat('ORtg', teamStats[7].toString()),
                    getCardStat('DRtg', teamStats[8].toString()),
                    getCardStat('Net', teamStats[9].toString()),
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
                    getCardStat('Pace', teamStats[10].toString()),
                    getCardStat('Ast Ratio', teamStats[11].toString()),
                    getCardStat('TO %', teamStats[15].toString()),
                    getCardStat('OReb %', teamStats[12].toString()),
                    getCardStat('DReb %', teamStats[13].toString()),
                    getCardStat('Reb %', teamStats[14].toString()),
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

  dynamic getTeamEstimatedStats(String teamId, dynamic stats) {
    dynamic team;
    for (var t in stats["resultSet"]["rowSet"]) {
      if (t[1].toString() == teamId) {
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
