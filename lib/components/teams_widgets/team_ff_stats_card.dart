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
                          Text('Team'),
                          getCardStat('Eff FG %', teamStats[7].toString(),
                              teamStats[20].toString()),
                          getCardStat('FTA Rate', teamStats[8].toString(),
                              teamStats[21].toString()),
                          getCardStat('Tm TO %', teamStats[9].toString(),
                              teamStats[22].toString()),
                          getCardStat('OReb %', teamStats[10].toString(),
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
                          getCardStat('Eff FG %', teamStats[11].toString(),
                              teamStats[24].toString()),
                          getCardStat('FTA Rate', teamStats[12].toString(),
                              teamStats[25].toString()),
                          getCardStat('TO %', teamStats[13].toString(),
                              teamStats[26].toString()),
                          getCardStat('OReb %', teamStats[14].toString(),
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
    if (rank.trim() == "") rank = "30";
    var rankMeter = (30 - double.parse(rank)) / 30;
    return Column(children: [
      Row(
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
      ),
      Row(
        children: [
          Container(
            width: 150,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: LinearProgressIndicator(
              color: getProgressBarColor(rankMeter),
              backgroundColor: Colors.grey[50], //Colors.green,
              minHeight: 2,
              value: rankMeter,
              semanticsValue: rank.toString(),
            ),
          )
        ],
      )
    ]);
  }

  Color getProgressBarColor(double value) {
    if (value < .15) {
      return Colors.purple;
    } else if (value < .3) {
      return Colors.red;
    } else if (value < .45) {
      return Colors.deepOrange;
    } else if (value < .6) {
      return Colors.orange;
    } else if (value < .75) {
      return Colors.amber;
    } else if (value < .9) {
      return Colors.green;
    }

    return Colors.lightBlue;
  }
}
