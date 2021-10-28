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
                      getCardStat('ORtg', teamStats[8].toString(),
                          teamStats[32].toString(), width),
                      getCardStat('DRtg', teamStats[10].toString(),
                          teamStats[33].toString(), width),
                      getCardStat('Net', teamStats[12].toString(),
                          teamStats[34].toString(), width),
                      getCardStat('Ast %', teamStats[13].toString(),
                          teamStats[35].toString(), width),
                      getCardStat('Ast/TO', teamStats[14].toString(),
                          teamStats[36].toString(), width),
                      getCardStat('Ast Ratio', teamStats[15].toString(),
                          teamStats[37].toString(), width),
                      getCardStat('OReb %', teamStats[16].toString(),
                          teamStats[38].toString(), width),
                      getCardStat('DReb %', teamStats[17].toString(),
                          teamStats[39].toString(), width),
                      getCardStat('Reb %', teamStats[18].toString(),
                          teamStats[40].toString(), width),
                      getCardStat('Tm TO %', teamStats[19].toString(),
                          teamStats[41].toString(), width),
                      getCardStat('Eff FG %', teamStats[20].toString(),
                          teamStats[42].toString(), width),
                      getCardStat('TS %', teamStats[21].toString(),
                          teamStats[43].toString(), width),
                      getCardStat(
                          'Est Pace', teamStats[22].toString(), '', width),
                      getCardStat('Pace', teamStats[23].toString(),
                          teamStats[44].toString(), width),
                      getCardStat(
                          'Pace/40', teamStats[24].toString(), '', width),
                      getCardStat('Poss', teamStats[25].toString(), '', width),
                      getCardStat('Pie', teamStats[26].toString(),
                          teamStats[45].toString(), width),
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
              rank == '' ? Text("na") : Text("(" + rank + ")"),
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
