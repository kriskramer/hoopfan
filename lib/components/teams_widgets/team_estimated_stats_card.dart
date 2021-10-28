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
                      getCardStat('W', teamStats[3].toString(),
                          teamStats[17].toString(), width),
                      getCardStat('L', teamStats[4].toString(),
                          teamStats[18].toString(), width),
                      getCardStat('Win %', teamStats[5].toString(),
                          teamStats[19].toString(), width),
                      getCardStat('ORtg', teamStats[7].toString(),
                          teamStats[20].toString(), width),
                      getCardStat('DRtg', teamStats[8].toString(),
                          teamStats[21].toString(), width),
                      getCardStat('Net', teamStats[9].toString(),
                          teamStats[22].toString(), width),
                      getCardStat('Pace', teamStats[10].toString(),
                          teamStats[23].toString(), width),
                      getCardStat('Ast Ratio', teamStats[11].toString(),
                          teamStats[24].toString(), width),
                      getCardStat('TO %', teamStats[15].toString(),
                          teamStats[25].toString(), width),
                      getCardStat('OReb %', teamStats[12].toString(),
                          teamStats[26].toString(), width),
                      getCardStat('DReb %', teamStats[13].toString(),
                          teamStats[27].toString(), width),
                      getCardStat('Reb %', teamStats[14].toString(),
                          teamStats[28].toString(), width),
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
