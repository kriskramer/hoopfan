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
    print(teamId);
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
                    getCardStat(
                        'W', teamStats[3].toString(), teamStats[29].toString()),
                    getCardStat(
                        'L', teamStats[4].toString(), teamStats[30].toString()),
                    getCardStat('Win %', teamStats[5].toString(),
                        teamStats[31].toString()),
                    getCardStat('FGM', teamStats[7].toString(),
                        teamStats[32].toString()),
                    getCardStat('FGA', teamStats[8].toString(),
                        teamStats[33].toString()),
                    getCardStat('FG %', teamStats[9].toString(),
                        teamStats[34].toString()),
                    getCardStat('3PM', teamStats[10].toString(),
                        teamStats[35].toString()),
                    getCardStat('3PA', teamStats[11].toString(),
                        teamStats[36].toString()),
                    getCardStat('3P %', teamStats[12].toString(),
                        teamStats[37].toString()),
                    getCardStat('FTM', teamStats[13].toString(),
                        teamStats[38].toString()),
                    getCardStat('FTA', teamStats[14].toString(),
                        teamStats[39].toString()),
                    getCardStat('FT %', teamStats[15].toString(),
                        teamStats[40].toString()),
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
                    getCardStat('OReb', teamStats[16].toString(),
                        teamStats[41].toString()),
                    getCardStat('DReb', teamStats[17].toString(),
                        teamStats[42].toString()),
                    getCardStat('Rebs', teamStats[18].toString(),
                        teamStats[43].toString()),
                    getCardStat('Asts', teamStats[19].toString(),
                        teamStats[44].toString()),
                    getCardStat('TOs', teamStats[20].toString(),
                        teamStats[45].toString()),
                    getCardStat('Stls', teamStats[21].toString(),
                        teamStats[46].toString()),
                    getCardStat('Blks', teamStats[22].toString(),
                        teamStats[47].toString()),
                    getCardStat('BlkA', teamStats[23].toString(),
                        teamStats[48].toString()),
                    getCardStat('PF', teamStats[24].toString(),
                        teamStats[49].toString()),
                    getCardStat('PFD', teamStats[25].toString(),
                        teamStats[50].toString()),
                    getCardStat('Pts', teamStats[26].toString(),
                        teamStats[51].toString()),
                    getCardStat('+/-', teamStats[27].toString(),
                        teamStats[52].toString()),
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
        Container(
          child: Text("(" + rank + ")"),
        )
      ],
    );
  }
}
