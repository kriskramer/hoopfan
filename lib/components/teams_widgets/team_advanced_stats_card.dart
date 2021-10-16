import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class TeamAdvancedStatsCard extends StatelessWidget {
  final String teamId;

  TeamAdvancedStatsCard({this.teamId});

  @override
  Widget build(BuildContext context) {
    dynamic advancedStats =
        Provider.of<JsonFiles>(context, listen: false).getAdvancedTeamStats();
    var teamStats = getTeamStats(teamId, advancedStats);

    return teamStats == null
        ? Text('No stats available')
        : Container(
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
                          getCardStat('ORtg', teamStats[8].toString(),
                              teamStats[32].toString()),
                          getCardStat('DRtg', teamStats[10].toString(),
                              teamStats[33].toString()),
                          getCardStat('Net', teamStats[12].toString(),
                              teamStats[34].toString()),
                          getCardStat('Ast %', teamStats[13].toString(),
                              teamStats[35].toString()),
                          getCardStat('Ast/TO', teamStats[14].toString(),
                              teamStats[36].toString()),
                          getCardStat('Ast Ratio', teamStats[15].toString(),
                              teamStats[37].toString()),
                          getCardStat('OReb %', teamStats[16].toString(),
                              teamStats[38].toString()),
                          getCardStat('DReb %', teamStats[17].toString(),
                              teamStats[39].toString()),
                          getCardStat('Reb %', teamStats[18].toString(),
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
                          getCardStat('Tm TO %', teamStats[19].toString(),
                              teamStats[41].toString()),
                          getCardStat('Eff FG %', teamStats[20].toString(),
                              teamStats[42].toString()),
                          getCardStat('TS %', teamStats[21].toString(),
                              teamStats[43].toString()),
                          getCardStat('Est Pace', teamStats[22].toString(), ''),
                          getCardStat('Pace', teamStats[23].toString(),
                              teamStats[44].toString()),
                          getCardStat('Pace/40', teamStats[24].toString(), ''),
                          getCardStat('Poss', teamStats[25].toString(), ''),
                          getCardStat('Pie', teamStats[26].toString(),
                              teamStats[45].toString()),
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
