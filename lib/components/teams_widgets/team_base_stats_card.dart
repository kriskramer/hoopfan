import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class TeamBaseStatsCard extends StatelessWidget {
  final String teamId;

  TeamBaseStatsCard({this.teamId});

  @override
  Widget build(BuildContext context) {
    dynamic baseStats =
        Provider.of<JsonFiles>(context, listen: false).getBaseTeamStats();
    var teamStats = getTeamStats(teamId, baseStats);

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
                    getCardStat('FGM', teamStats[7].toString()),
                    getCardStat('FGA', teamStats[8].toString()),
                    getCardStat('FG %', teamStats[9].toString()),
                    getCardStat('3PM', teamStats[10].toString()),
                    getCardStat('3PA', teamStats[11].toString()),
                    getCardStat('3P %', teamStats[12].toString()),
                    getCardStat('FTM', teamStats[13].toString()),
                    getCardStat('FTA', teamStats[14].toString()),
                    getCardStat('FT %', teamStats[15].toString()),
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
                    getCardStat('OReb', teamStats[16].toString()),
                    getCardStat('DReb', teamStats[17].toString()),
                    getCardStat('Rebs', teamStats[18].toString()),
                    getCardStat('Asts', teamStats[19].toString()),
                    getCardStat('TOs', teamStats[20].toString()),
                    getCardStat('Stls', teamStats[21].toString()),
                    getCardStat('Blks', teamStats[22].toString()),
                    getCardStat('BlkA', teamStats[23].toString()),
                    getCardStat('PF', teamStats[24].toString()),
                    getCardStat('PFD', teamStats[25].toString()),
                    getCardStat('Pts', teamStats[26].toString()),
                    getCardStat('+/-', teamStats[27].toString()),
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
          width: 65,
          child: Text(
            label,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red[900]),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          padding: EdgeInsets.all(5),
          width: 65,
          child: Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
