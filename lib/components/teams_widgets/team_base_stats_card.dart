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
    //print(teamId);

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
                          teamStats[29].toString(), width),
                      getCardStat('L', teamStats[4].toString(),
                          teamStats[30].toString(), width),
                      getCardStat('Win %', teamStats[5].toString(),
                          teamStats[31].toString(), width),
                      getCardStat('FGM', teamStats[7].toString(),
                          teamStats[32].toString(), width),
                      getCardStat('FGA', teamStats[8].toString(),
                          teamStats[33].toString(), width),
                      getCardStat('FG %', teamStats[9].toString(),
                          teamStats[34].toString(), width),
                      getCardStat('3PM', teamStats[10].toString(),
                          teamStats[35].toString(), width),
                      getCardStat('3PA', teamStats[11].toString(),
                          teamStats[36].toString(), width),
                      getCardStat('3P %', teamStats[12].toString(),
                          teamStats[37].toString(), width),
                      getCardStat('FTM', teamStats[13].toString(),
                          teamStats[38].toString(), width),
                      getCardStat('FTA', teamStats[14].toString(),
                          teamStats[39].toString(), width),
                      getCardStat('FT %', teamStats[15].toString(),
                          teamStats[40].toString(), width),
                      getCardStat('OReb', teamStats[16].toString(),
                          teamStats[41].toString(), width),
                      getCardStat('DReb', teamStats[17].toString(),
                          teamStats[42].toString(), width),
                      getCardStat('Rebs', teamStats[18].toString(),
                          teamStats[43].toString(), width),
                      getCardStat('Asts', teamStats[19].toString(),
                          teamStats[44].toString(), width),
                      getCardStat('TOs', teamStats[20].toString(),
                          teamStats[45].toString(), width),
                      getCardStat('Stls', teamStats[21].toString(),
                          teamStats[46].toString(), width),
                      getCardStat('Blks', teamStats[22].toString(),
                          teamStats[47].toString(), width),
                      getCardStat('BlkA', teamStats[23].toString(),
                          teamStats[48].toString(), width),
                      getCardStat('PF', teamStats[24].toString(),
                          teamStats[49].toString(), width),
                      getCardStat('PFD', teamStats[25].toString(),
                          teamStats[50].toString(), width),
                      getCardStat('Pts', teamStats[26].toString(),
                          teamStats[51].toString(), width),
                      getCardStat('+/-', teamStats[27].toString(),
                          teamStats[52].toString(), width),
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
