import 'package:flutter/material.dart';
import 'package:hoop/components/teams_widgets/team_single_stat.dart';
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
                      TeamSingleStat('W', teamStats[3].toString(),
                          teamStats[29].toString(), width),
                      TeamSingleStat('L', teamStats[4].toString(),
                          teamStats[30].toString(), width),
                      TeamSingleStat('Win %', teamStats[5].toString(),
                          teamStats[31].toString(), width),
                      TeamSingleStat('FGM', teamStats[7].toString(),
                          teamStats[32].toString(), width),
                      TeamSingleStat('FGA', teamStats[8].toString(),
                          teamStats[33].toString(), width),
                      TeamSingleStat('FG %', teamStats[9].toString(),
                          teamStats[34].toString(), width),
                      TeamSingleStat('3PM', teamStats[10].toString(),
                          teamStats[35].toString(), width),
                      TeamSingleStat('3PA', teamStats[11].toString(),
                          teamStats[36].toString(), width),
                      TeamSingleStat('3P %', teamStats[12].toString(),
                          teamStats[37].toString(), width),
                      TeamSingleStat('FTM', teamStats[13].toString(),
                          teamStats[38].toString(), width),
                      TeamSingleStat('FTA', teamStats[14].toString(),
                          teamStats[39].toString(), width),
                      TeamSingleStat('FT %', teamStats[15].toString(),
                          teamStats[40].toString(), width),
                      TeamSingleStat('OReb', teamStats[16].toString(),
                          teamStats[41].toString(), width),
                      TeamSingleStat('DReb', teamStats[17].toString(),
                          teamStats[42].toString(), width),
                      TeamSingleStat('Rebs', teamStats[18].toString(),
                          teamStats[43].toString(), width),
                      TeamSingleStat('Asts', teamStats[19].toString(),
                          teamStats[44].toString(), width),
                      TeamSingleStat('TOs', teamStats[20].toString(),
                          teamStats[45].toString(), width),
                      TeamSingleStat('Stls', teamStats[21].toString(),
                          teamStats[46].toString(), width),
                      TeamSingleStat('Blks', teamStats[22].toString(),
                          teamStats[47].toString(), width),
                      TeamSingleStat('BlkA', teamStats[23].toString(),
                          teamStats[48].toString(), width),
                      TeamSingleStat('PF', teamStats[24].toString(),
                          teamStats[49].toString(), width),
                      TeamSingleStat('PFD', teamStats[25].toString(),
                          teamStats[50].toString(), width),
                      TeamSingleStat('Pts', teamStats[26].toString(),
                          teamStats[51].toString(), width),
                      TeamSingleStat('+/-', teamStats[27].toString(),
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
}
