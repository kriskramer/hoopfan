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

    var width = MediaQuery.of(context).size.width - 35;

    return teamStats == null
        ? Text('No stats available')
        : Container(
            child: Column(children: [
              Container(
                child: Row(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('Team'),
                      getCardStat('Eff FG %', teamStats[7].toString(),
                          teamStats[20].toString(), width),
                      getCardStat('FTA Rate', teamStats[8].toString(),
                          teamStats[21].toString(), width),
                      getCardStat('Tm TO %', teamStats[9].toString(),
                          teamStats[22].toString(), width),
                      getCardStat('OReb %', teamStats[10].toString(),
                          teamStats[23].toString(), width),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Opponent'),
                      getCardStat('Eff FG %', teamStats[11].toString(),
                          teamStats[24].toString(), width),
                      getCardStat('FTA Rate', teamStats[12].toString(),
                          teamStats[25].toString(), width),
                      getCardStat('TO %', teamStats[13].toString(),
                          teamStats[26].toString(), width),
                      getCardStat('OReb %', teamStats[14].toString(),
                          teamStats[27].toString(), width),
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

  Widget getCardStat(String label, String value, String rank, double width) {
    if (rank.trim() == "") rank = "30";
    var rankMeter = (30 - double.parse(rank)) / 30;
    return Container(
      height: 25,
      child: Stack(children: [
        Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: LinearProgressIndicator(
            color: getProgressBarColor(rankMeter),
            backgroundColor: Colors.grey[50], //Colors.green,
            minHeight: 22,
            value: rankMeter,
            semanticsValue: rank.toString(),
          ),
        ),
        Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  width: 65,
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      //color: Colors.red[900]
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  value,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ]),
              Text("(" + rank + ")"),
            ],
          ),
        )
      ]),
    );
  }

  Color getProgressBarColor(double value) {
    if (value < .15) {
      return Colors.purple.withAlpha(125);
    } else if (value < .3) {
      return Colors.red.withAlpha(125);
    } else if (value < .45) {
      return Colors.deepOrange.withAlpha(125);
    } else if (value < .6) {
      return Colors.orange.withAlpha(125);
    } else if (value < .75) {
      return Colors.amber.withAlpha(125);
    } else if (value < .9) {
      return Colors.green.withAlpha(125);
    }

    return Colors.lightBlue.withAlpha(125);
  }
}
