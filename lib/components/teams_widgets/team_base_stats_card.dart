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

    var width = MediaQuery.of(context).size.width - 20;

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
                          teamStats[29].toString(), width, teamId, "BASE", "W"),
                      TeamSingleStat('L', teamStats[4].toString(),
                          teamStats[30].toString(), width, teamId, "BASE", "L"),
                      TeamSingleStat(
                          'Win %',
                          teamStats[5].toString(),
                          teamStats[31].toString(),
                          width,
                          teamId,
                          "BASE",
                          "WPCT"),
                      TeamSingleStat(
                          'FGM',
                          teamStats[7].toString(),
                          teamStats[33].toString(),
                          width,
                          teamId,
                          "BASE",
                          "FGM"),
                      TeamSingleStat(
                          'FGA',
                          teamStats[8].toString(),
                          teamStats[34].toString(),
                          width,
                          teamId,
                          "BASE",
                          "FGA"),
                      TeamSingleStat(
                          'FG %',
                          teamStats[9].toString(),
                          teamStats[35].toString(),
                          width,
                          teamId,
                          "BASE",
                          "FGPCT"),
                      TeamSingleStat(
                          '3PM',
                          teamStats[10].toString(),
                          teamStats[36].toString(),
                          width,
                          teamId,
                          "BASE",
                          "FG3M"),
                      TeamSingleStat(
                          '3PA',
                          teamStats[11].toString(),
                          teamStats[37].toString(),
                          width,
                          teamId,
                          "BASE",
                          "FG3A"),
                      TeamSingleStat(
                          '3P %',
                          teamStats[12].toString(),
                          teamStats[38].toString(),
                          width,
                          teamId,
                          "BASE",
                          "FG3PCT"),
                      TeamSingleStat(
                          'FTM',
                          teamStats[13].toString(),
                          teamStats[39].toString(),
                          width,
                          teamId,
                          "BASE",
                          "FTM"),
                      TeamSingleStat(
                          'FTA',
                          teamStats[14].toString(),
                          teamStats[40].toString(),
                          width,
                          teamId,
                          "BASE",
                          "FTA"),
                      TeamSingleStat(
                          'FT %',
                          teamStats[15].toString(),
                          teamStats[41].toString(),
                          width,
                          teamId,
                          "BASE",
                          "FTPCT"),
                      TeamSingleStat(
                          'OReb',
                          teamStats[16].toString(),
                          teamStats[42].toString(),
                          width,
                          teamId,
                          "BASE",
                          "OREB"),
                      TeamSingleStat(
                          'DReb',
                          teamStats[17].toString(),
                          teamStats[43].toString(),
                          width,
                          teamId,
                          "BASE",
                          "DREB"),
                      TeamSingleStat(
                          'Rebs',
                          teamStats[18].toString(),
                          teamStats[44].toString(),
                          width,
                          teamId,
                          "BASE",
                          "REB"),
                      TeamSingleStat(
                          'Asts',
                          teamStats[19].toString(),
                          teamStats[45].toString(),
                          width,
                          teamId,
                          "BASE",
                          "AST"),
                      TeamSingleStat(
                          'TOs',
                          teamStats[20].toString(),
                          teamStats[46].toString(),
                          width,
                          teamId,
                          "BASE",
                          "TOV"),
                      TeamSingleStat(
                          'Stls',
                          teamStats[21].toString(),
                          teamStats[47].toString(),
                          width,
                          teamId,
                          "BASE",
                          "STL"),
                      TeamSingleStat(
                          'Blks',
                          teamStats[22].toString(),
                          teamStats[48].toString(),
                          width,
                          teamId,
                          "BASE",
                          "BLK"),
                      TeamSingleStat(
                          'BlkA',
                          teamStats[23].toString(),
                          teamStats[49].toString(),
                          width,
                          teamId,
                          "BASE",
                          "BLKA"),
                      TeamSingleStat(
                          'PF',
                          teamStats[24].toString(),
                          teamStats[50].toString(),
                          width,
                          teamId,
                          "BASE",
                          "PF"),
                      TeamSingleStat(
                          'PFD',
                          teamStats[25].toString(),
                          teamStats[51].toString(),
                          width,
                          teamId,
                          "BASE",
                          "PFD"),
                      TeamSingleStat(
                          'Pts',
                          teamStats[26].toString(),
                          teamStats[52].toString(),
                          width,
                          teamId,
                          "BASE",
                          "PTS"),
                      TeamSingleStat(
                          '+/-',
                          teamStats[27].toString(),
                          teamStats[53].toString(),
                          width,
                          teamId,
                          "BASE",
                          "PLUSMINUS"),
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
