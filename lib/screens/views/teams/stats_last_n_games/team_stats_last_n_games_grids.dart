import 'package:flutter/material.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';
import 'package:hoop/screens/views/teams/stats_last_n_games/team_stats_last_n_games.dart';
import 'package:hoop/screens/views/teams/stats_last_n_games/team_stats_last_n_games_advanced_trends_chart.dart';
import 'package:hoop/screens/views/teams/stats_last_n_games/team_stats_last_n_games_base_trends_chart.dart';
import 'package:hoop/screens/views/teams/stats_last_n_games/team_stats_last_n_games_four_factors_trends_chart.dart';
import 'package:hoop/screens/views/teams/stats_last_n_games/team_stats_last_n_games_misc_trends_chart.dart';
import 'package:hoop/screens/views/teams/stats_last_n_games/team_stats_last_n_games_opponent_trends_chart.dart';
import 'package:hoop/screens/views/teams/stats_last_n_games/team_stats_last_n_games_scoring_trends_chart.dart';

class TeamStatsLastNGamesGrid extends StatelessWidget {
  final dynamic stats;
  final String measure;

  const TeamStatsLastNGamesGrid({this.stats, this.measure});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Text(
            'Last N Games',
            style: TextStyle(fontSize: 20),
          ),
          getDataGrid(stats, 0, measure, context),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Last 5 Games',
            style: TextStyle(fontSize: 20),
          ),
          getDataGrid(stats, 1, measure, context),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Last 10 Games',
            style: TextStyle(fontSize: 20),
          ),
          getDataGrid(stats, 2, measure, context),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Last 15 Games',
            style: TextStyle(fontSize: 20),
          ),
          getDataGrid(stats, 3, measure, context),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Last 20 Games',
            style: TextStyle(fontSize: 20),
          ),
          getDataGrid(stats, 4, measure, context),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Game Number',
            style: TextStyle(fontSize: 20),
          ),
          getDataGrid(stats, 5, measure, context),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  List<DataRow> getVariableBaseRows(
      dynamic stats, int typeNum, BuildContext context) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][typeNum]["rowSet"].length; i++) {
      list.add(getBaseDataRow(stats, typeNum, i, context));
    }
    return list;
  }

  List<DataRow> getVariableAdvancedRows(
      dynamic stats, int typeNum, BuildContext context) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][typeNum]["rowSet"].length; i++) {
      list.add(getAdvancedDataRow(stats, typeNum, i, context));
    }
    return list;
  }

  List<DataRow> getVariableMiscRows(
      dynamic stats, int typeNum, BuildContext context) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][typeNum]["rowSet"].length; i++) {
      list.add(getMiscDataRow(stats, typeNum, i, context));
    }
    return list;
  }

  List<DataRow> getVariableFourFactorRows(
      dynamic stats, int typeNum, BuildContext context) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][typeNum]["rowSet"].length; i++) {
      list.add(getFourFactorDataRow(stats, typeNum, i, context));
    }
    return list;
  }

  List<DataRow> getVariableScoringRows(
      dynamic stats, int typeNum, BuildContext context) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][typeNum]["rowSet"].length; i++) {
      list.add(getScoringDataRow(stats, typeNum, i, context));
    }
    return list;
  }

  List<DataRow> getVariableOpponentRows(
      dynamic stats, int typeNum, BuildContext context) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][typeNum]["rowSet"].length; i++) {
      list.add(getOpponentDataRow(stats, typeNum, i, context));
    }
    return list;
  }

  DataRow getBaseDataRow(
      dynamic stats, int typeNum, int setNum, BuildContext context) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 1, "", context),
      getDataCell(stats, typeNum, setNum, 2, "", context),
      getDataCell(stats, typeNum, setNum, 3, "", context),
      getDataCell(stats, typeNum, setNum, 4, "", context),
      getDataCell(stats, typeNum, setNum, 5, "", context),
      getDataCell(stats, typeNum, setNum, 6, "", context),
      getDataCell(stats, typeNum, setNum, 7, "FGM", context),
      getDataCell(stats, typeNum, setNum, 8, "FGA", context),
      getDataCell(stats, typeNum, setNum, 9, "FG %", context),
      getDataCell(stats, typeNum, setNum, 10, "3PM", context),
      getDataCell(stats, typeNum, setNum, 11, "3PA", context),
      getDataCell(stats, typeNum, setNum, 12, "3P %", context),
      getDataCell(stats, typeNum, setNum, 13, "FTM", context),
      getDataCell(stats, typeNum, setNum, 14, "FTA", context),
      getDataCell(stats, typeNum, setNum, 15, "FT %", context),
      getDataCell(stats, typeNum, setNum, 16, "OREB", context),
      getDataCell(stats, typeNum, setNum, 17, "DREB", context),
      getDataCell(stats, typeNum, setNum, 18, "REB", context),
      getDataCell(stats, typeNum, setNum, 19, "AST", context),
      getDataCell(stats, typeNum, setNum, 20, "TOV", context),
      getDataCell(stats, typeNum, setNum, 21, "STL", context),
      getDataCell(stats, typeNum, setNum, 22, "BLK", context),
      getDataCell(stats, typeNum, setNum, 23, "BLKA", context),
      getDataCell(stats, typeNum, setNum, 24, "PF", context),
      getDataCell(stats, typeNum, setNum, 25, "PFD", context),
      getDataCell(stats, typeNum, setNum, 26, "PTS", context),
      getDataCell(stats, typeNum, setNum, 27, "+/-", context),
    ]);
  }

  DataRow getAdvancedDataRow(
      dynamic stats, int typeNum, int setNum, BuildContext context) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 1, "", context),
      getDataCell(stats, typeNum, setNum, 2, "", context),
      getDataCell(stats, typeNum, setNum, 3, "", context),
      getDataCell(stats, typeNum, setNum, 4, "", context),
      getDataCell(stats, typeNum, setNum, 5, "", context),
      getDataCell(stats, typeNum, setNum, 6, "", context),
      getDataCell(stats, typeNum, setNum, 8, "ORtg", context),
      getDataCell(stats, typeNum, setNum, 10, "DRtg", context),
      getDataCell(stats, typeNum, setNum, 12, "Net", context),
      getDataCell(stats, typeNum, setNum, 13, "Ast %", context),
      getDataCell(stats, typeNum, setNum, 14, "AstTov", context),
      getDataCell(stats, typeNum, setNum, 15, "Ast Rto", context),
      getDataCell(stats, typeNum, setNum, 16, "OReb %", context),
      getDataCell(stats, typeNum, setNum, 17, "DReb %", context),
      getDataCell(stats, typeNum, setNum, 18, "Reb %", context),
      getDataCell(stats, typeNum, setNum, 19, "TmTov %", context),
      getDataCell(stats, typeNum, setNum, 20, "eFG %", context),
      getDataCell(stats, typeNum, setNum, 21, "TS %", context),
      getDataCell(stats, typeNum, setNum, 23, "Pace", context),
      getDataCell(stats, typeNum, setNum, 24, "Pace/40", context),
      getDataCell(stats, typeNum, setNum, 25, "Poss", context),
      getDataCell(stats, typeNum, setNum, 26, "PIE", context),
    ]);
  }

  DataRow getMiscDataRow(
      dynamic stats, int typeNum, int setNum, BuildContext context) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 1, "", context),
      getDataCell(stats, typeNum, setNum, 2, "", context),
      getDataCell(stats, typeNum, setNum, 3, "", context),
      getDataCell(stats, typeNum, setNum, 4, "", context),
      getDataCell(stats, typeNum, setNum, 5, "", context),
      getDataCell(stats, typeNum, setNum, 6, "", context),
      getDataCell(stats, typeNum, setNum, 7, "PtsOffTov", context),
      getDataCell(stats, typeNum, setNum, 8, "Pts2ndChance", context),
      getDataCell(stats, typeNum, setNum, 9, "PtsFB", context),
      getDataCell(stats, typeNum, setNum, 10, "PtsPaint", context),
      getDataCell(stats, typeNum, setNum, 11, "OppPtsOffTov", context),
      getDataCell(stats, typeNum, setNum, 12, "OppPts2ndChance", context),
      getDataCell(stats, typeNum, setNum, 13, "OppPtsFB", context),
      getDataCell(stats, typeNum, setNum, 14, "OppPtsPaint", context),
    ]);
  }

  DataRow getFourFactorDataRow(
      dynamic stats, int typeNum, int setNum, BuildContext context) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 1, "", context),
      getDataCell(stats, typeNum, setNum, 2, "", context),
      getDataCell(stats, typeNum, setNum, 3, "", context),
      getDataCell(stats, typeNum, setNum, 4, "", context),
      getDataCell(stats, typeNum, setNum, 5, "", context),
      getDataCell(stats, typeNum, setNum, 6, "", context),
      getDataCell(stats, typeNum, setNum, 7, "eFG", context),
      getDataCell(stats, typeNum, setNum, 11, "OppEFG", context),
      DataCell(VerticalDivider(color: Colors.black)),
      getDiffDataCell(stats, typeNum, setNum, 7, 11),
      DataCell(VerticalDivider(color: Colors.black)),
      getDataCell(stats, typeNum, setNum, 8, "FtaRate", context),
      getDataCell(stats, typeNum, setNum, 12, "OppFtaRate", context),
      DataCell(VerticalDivider(color: Colors.black)),
      getDiffDataCell(stats, typeNum, setNum, 8, 12),
      DataCell(VerticalDivider(color: Colors.black)),
      getDataCell(stats, typeNum, setNum, 9, "TmTovPct", context),
      getDataCell(stats, typeNum, setNum, 13, "OppTmTovPct", context),
      DataCell(VerticalDivider(color: Colors.black)),
      getDiffDataCell(stats, typeNum, setNum, 9, 13),
      DataCell(VerticalDivider(color: Colors.black)),
      getDataCell(stats, typeNum, setNum, 10, "ORebPct", context),
      getDataCell(stats, typeNum, setNum, 14, "OppORebPct", context),
      DataCell(VerticalDivider(color: Colors.black)),
      getDiffDataCell(stats, typeNum, setNum, 10, 14),
    ]);
  }

  DataRow getScoringDataRow(
      dynamic stats, int typeNum, int setNum, BuildContext context) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 1, "", context),
      getDataCell(stats, typeNum, setNum, 2, "", context),
      getDataCell(stats, typeNum, setNum, 3, "", context),
      getDataCell(stats, typeNum, setNum, 4, "", context),
      getDataCell(stats, typeNum, setNum, 5, "", context),
      getDataCell(stats, typeNum, setNum, 6, "", context),
      getDataCell(stats, typeNum, setNum, 7, "PCT_FGA_2P", context),
      getDataCell(stats, typeNum, setNum, 8, "PCT_FGA_3P", context),
      getDataCell(stats, typeNum, setNum, 9, "PCT_PTS_2P", context),
      getDataCell(stats, typeNum, setNum, 10, "PCT_PTS_2P_MR", context),
      getDataCell(stats, typeNum, setNum, 11, "PCT_PTS_3P", context),
      getDataCell(stats, typeNum, setNum, 12, "PCT_PTS_FB", context),
      getDataCell(stats, typeNum, setNum, 13, "PCT_PTS_FT", context),
      getDataCell(stats, typeNum, setNum, 14, "PCT_PTS_OFF_TOV", context),
      getDataCell(stats, typeNum, setNum, 15, "PCT_PTS_PAINT", context),
      getDataCell(stats, typeNum, setNum, 16, "PCT_AST_2PM", context),
      getDataCell(stats, typeNum, setNum, 17, "PCT_UAST_2PM", context),
      getDataCell(stats, typeNum, setNum, 18, "PCT_AST_3PM", context),
      getDataCell(stats, typeNum, setNum, 19, "PCT_UAST_3PM", context),
      getDataCell(stats, typeNum, setNum, 20, "PCT_AST_FGM", context),
      getDataCell(stats, typeNum, setNum, 21, "PCT_UAST_FGM", context),
    ]);
  }

  DataRow getOpponentDataRow(
      dynamic stats, int typeNum, int setNum, BuildContext context) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 1, "", context),
      getDataCell(stats, typeNum, setNum, 2, "", context),
      getDataCell(stats, typeNum, setNum, 3, "", context),
      getDataCell(stats, typeNum, setNum, 4, "", context),
      getDataCell(stats, typeNum, setNum, 5, "", context),
      getDataCell(stats, typeNum, setNum, 6, "", context),
      getDataCell(stats, typeNum, setNum, 7, "FGM", context),
      getDataCell(stats, typeNum, setNum, 8, "FGA", context),
      getDataCell(stats, typeNum, setNum, 9, "FG %", context),
      getDataCell(stats, typeNum, setNum, 10, "3PM", context),
      getDataCell(stats, typeNum, setNum, 11, "3PA", context),
      getDataCell(stats, typeNum, setNum, 12, "3P %", context),
      getDataCell(stats, typeNum, setNum, 13, "FTM", context),
      getDataCell(stats, typeNum, setNum, 14, "FTA", context),
      getDataCell(stats, typeNum, setNum, 15, "FT %", context),
      getDataCell(stats, typeNum, setNum, 16, "OREB", context),
      getDataCell(stats, typeNum, setNum, 17, "DREB", context),
      getDataCell(stats, typeNum, setNum, 18, "REB", context),
      getDataCell(stats, typeNum, setNum, 19, "AST", context),
      getDataCell(stats, typeNum, setNum, 20, "TOV", context),
      getDataCell(stats, typeNum, setNum, 21, "STL", context),
      getDataCell(stats, typeNum, setNum, 22, "BLK", context),
      getDataCell(stats, typeNum, setNum, 23, "BLKA", context),
      getDataCell(stats, typeNum, setNum, 24, "PF", context),
      getDataCell(stats, typeNum, setNum, 25, "PFD", context),
      getDataCell(stats, typeNum, setNum, 26, "PTS", context),
      getDataCell(stats, typeNum, setNum, 27, "+/-", context),
    ]);
  }

  // DataCell getDataCell(dynamic stats, int typeNum, int setNum, int valueNum) {
  //   if (stats["resultSets"][typeNum]["rowSet"].length == 0) {
  //     return DataCell(Text('0.0'));
  //   }

  //   return DataCell(Text(
  //       stats["resultSets"][typeNum]["rowSet"][setNum][valueNum].toString()));
  // }

  List<DataColumn> getBaseDataColumns() {
    List<DataColumn> list = [];

    list.add(DataColumn(label: Text('Value')));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('GP'), statName: "GP")));
    list.add(DataColumn(
        label: StatInfoDialog(
      label: Text('W'),
      statName: "W",
    )));
    list.add(DataColumn(
        label: StatInfoDialog(
      label: Text('L'),
      statName: "L",
    )));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('W %'), statName: "Win %")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('Min'), statName: "MIN")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('FGM'), statName: "FGM")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('FGA'), statName: "FGA")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('FG %'), statName: "FG %")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('3PM'), statName: "3PM")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('3PA'), statName: "3PA")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('3P %'), statName: "3P %")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('FTM'), statName: "FTM")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('FTA'), statName: "FTA")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('FT %'), statName: "FT %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('OREB'), statName: "OREB")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('DREB'), statName: "DREB")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('REB'), statName: "REB")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('AST'), statName: "AST")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('TOV'), statName: "TOV")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('STL'), statName: "STL")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('BLK'), statName: "BLK")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('BLKA'), statName: "BLKA")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('PF'), statName: "PF")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('PFD'), statName: "PFD")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('PTS'), statName: "PTS")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('+/-'), statName: "PLUSMINUS")));

    return list;
  }

  List<DataColumn> getAdvancedDataColumns() {
    List<DataColumn> list = [];

    list.add(DataColumn(label: Text('Value')));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('GP'), statName: "GP")));
    list.add(DataColumn(
        label: StatInfoDialog(
      label: Text('W'),
      statName: "W",
    )));
    list.add(DataColumn(
        label: StatInfoDialog(
      label: Text('L'),
      statName: "L",
    )));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('W %'), statName: "Win %")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('Min'), statName: "MIN")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('ORtg'), statName: "ORtg")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('DRtg'), statName: "DRtg")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('Net'), statName: "NET")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Ast %'), statName: "AST %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Ast/Tov'), statName: "AST/TO")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Ast Rto'), statName: "AST RATIO")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('OReb %'), statName: "OReb %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('DReb %'), statName: "DReb %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Reb %'), statName: "REB %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Tm Tov %'), statName: "TM TOV %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('eFG %'), statName: "eFG %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('TS %'), statName: "TS %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Pace'), statName: "PACE")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Pace/40'), statName: "Pace/40")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Poss'), statName: "POSS")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('Pie'), statName: "PIE")));

    return list;
  }

  List<DataColumn> getMiscDataColumns() {
    List<DataColumn> list = [];

    //list.add(DataColumn(label: Text('Group')));
    list.add(DataColumn(label: Text('Value')));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('GP'), statName: "GP")));
    list.add(DataColumn(
        label: StatInfoDialog(
      label: Text('W'),
      statName: "W",
    )));
    list.add(DataColumn(
        label: StatInfoDialog(
      label: Text('L'),
      statName: "L",
    )));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('W %'), statName: "Win %")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('Min'), statName: "MIN")));
    list.add(DataColumn(
        label: StatInfoDialog(
            label: Text('Pts off Tov'), statName: "Pts off Tov")));
    list.add(DataColumn(
        label: StatInfoDialog(
            label: Text('Pts 2nd Ch'), statName: "Pts 2nd Chance")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Pts Fb'), statName: "Pts Fb")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('Pts Paint'), statName: "Pts Paint")));
    list.add(DataColumn(
        label: StatInfoDialog(
            label: Text('Opp Pts off Tov'), statName: "Opp Pts off Tov")));
    list.add(DataColumn(
        label: StatInfoDialog(
            label: Text('Opp Pts 2nd Ch'), statName: "Opp Pts 2nd Ch")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('Opp Pts Fb'), statName: "Opp Pts Fb")));
    list.add(DataColumn(
        label: StatInfoDialog(
            label: Text('Opp Pts Paint'), statName: "Opp Pts Paint")));

    return list;
  }

  List<DataColumn> getFourFactorDataColumns() {
    List<DataColumn> list = [];

    //list.add(DataColumn(label: Text('Group')));
    list.add(DataColumn(label: Text('Value')));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('GP'), statName: "GP")));
    list.add(DataColumn(
        label: StatInfoDialog(
      label: Text('W'),
      statName: "W",
    )));
    list.add(DataColumn(
        label: StatInfoDialog(
      label: Text('L'),
      statName: "L",
    )));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('W %'), statName: "Win %")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('Min'), statName: "MIN")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('eFG %'), statName: "eFG %")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('Opp eFg %'), statName: "Opp eFg %")));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('Diff')));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('FTA Rate'), statName: "FTA RATE")));
    list.add(DataColumn(
        label: StatInfoDialog(
            label: Text('Opp FTA Rate'), statName: "Opp FTA Rate")));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('Diff')));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Tm Tov %'), statName: "TM TOV %")));
    list.add(DataColumn(
        label: StatInfoDialog(
            label: Text('Opp Tm Tov %'), statName: "Opp Tm Tov %")));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('Diff')));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('OReb %'), statName: "OREB %")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('Opp OReb %'), statName: "Opp OReb %")));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('Diff')));

    return list;
  }

  List<DataColumn> getScoringDataColumns() {
    List<DataColumn> list = [];

    //list.add(DataColumn(label: Text('Group')));
    list.add(DataColumn(label: Text('Value')));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('GP'), statName: "GP")));
    list.add(DataColumn(
        label: StatInfoDialog(
      label: Text('W'),
      statName: "W",
    )));
    list.add(DataColumn(
        label: StatInfoDialog(
      label: Text('L'),
      statName: "L",
    )));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('W %'), statName: "Win %")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('Min'), statName: "MIN")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('% FGA 2P'), statName: "% FGA 2P")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('% FGA 3P'), statName: "% FGA 3P")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('% Pts 2P'), statName: "% Pts 2P")));
    list.add(DataColumn(
        label: StatInfoDialog(
            label: Text('% Pts 2P MR'), statName: "% Pts 2P MR")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('% Pts 3P'), statName: "% Pts 3P")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('% Pts FB'), statName: "% Pts FB")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('% Pts FT'), statName: "% Pts FT")));
    list.add(DataColumn(
        label: StatInfoDialog(
            label: Text('% Pts off Tov'), statName: "% Pts off Tov")));
    list.add(DataColumn(
        label: StatInfoDialog(
            label: Text('% Pts Paint'), statName: "% Pts PITP")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('% Ast 2P'), statName: "% Ast 2P")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('% UAst 2P'), statName: "% UAst 2P")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('% Ast 3P'), statName: "% Ast 3P")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('% UAst 3P'), statName: "% UAst 3P")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('% Ast FGM'), statName: "% Ast FGM")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('% UAst FGM'), statName: "% UAst FGM")));

    return list;
  }

  List<DataColumn> getOpponentDataColumns() {
    List<DataColumn> list = [];

    //list.add(DataColumn(label: Text('Group')));
    list.add(DataColumn(label: Text('Value')));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('GP'), statName: "GP")));
    list.add(DataColumn(
        label: StatInfoDialog(
      label: Text('W'),
      statName: "W",
    )));
    list.add(DataColumn(
        label: StatInfoDialog(
      label: Text('L'),
      statName: "L",
    )));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('W %'), statName: "Win %")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('Min'), statName: "MIN")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp FGM'), statName: "Opp FGM")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp FGA'), statName: "Opp FGA")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp FG %'), statName: "Opp FG %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp 3PM'), statName: "Opp 3PM")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp 3PA'), statName: "Opp 3PA")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp 3P %'), statName: "Opp 3P %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp FTM'), statName: "Opp FTM")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp FTA'), statName: "Opp FTA")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp FT %'), statName: "Opp FT %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp OREB'), statName: "Opp OREB")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp DREB'), statName: "Opp DREB")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp REB'), statName: "Opp REB")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp AST'), statName: "Opp AST")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp TOV'), statName: "Opp TOV")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp STL'), statName: "Opp STL")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp BLK'), statName: "Opp BLK")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp BLKA'), statName: "Opp BLKA")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp PF'), statName: "Opp PF")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp PFD'), statName: "Opp PFD")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Opp PTS'), statName: "Opp PTS")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('Opp +/-'), statName: "Opp PLUSMINUS")));

    return list;
  }

  DataCell getDataCell(dynamic stats, int typeNum, int setNum, int valueNum,
      String statName, BuildContext context) {
    if (stats["resultSets"][typeNum]["rowSet"].length == 0) {
      return DataCell(Text('0.0'));
    }

    String cellValue =
        stats["resultSets"][typeNum]["rowSet"][setNum][valueNum].toString();

    cellValue = cellValue.replaceAll("T00:00:00", "");

    if (statName == "") {
      return DataCell(Text(cellValue));
    } else if (measure == "Base") {
      return DataCell(GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return TeamStatsLastNGamesBaseCharts(stats, statName);
                });
          },
          child: Text(cellValue)));
    } else if (measure == "Advanced") {
      return DataCell(GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return TeamStatsLastNGamesAdvancedCharts(stats, statName);
                });
          },
          child: Text(cellValue)));
    } else if (measure == "Misc") {
      return DataCell(GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return TeamStatsLastNGamesMiscCharts(stats, statName);
                });
          },
          child: Text(cellValue)));
    } else if (measure == "Four Factors") {
      return DataCell(GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return TeamStatsLastNGamesFourFactorsCharts(stats, statName);
                });
          },
          child: Center(child: Text(cellValue))));
    } else if (measure == "Scoring") {
      return DataCell(GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return TeamStatsLastNGamesScoringCharts(stats, statName);
                });
          },
          child: Center(child: Text(cellValue))));
    } else if (measure == "Opponent") {
      return DataCell(GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return TeamStatsLastNGamesOpponentCharts(stats, statName);
                });
          },
          child: Center(child: Text(cellValue))));
    }

    return DataCell(Text(cellValue));
  }

  DataCell getDiffDataCell(
      dynamic stats, int typeNum, int setNum, int value1, int value2) {
    String cellValue1 =
        stats["resultSets"][typeNum]["rowSet"][setNum][value1].toString();
    String cellValue2 =
        stats["resultSets"][typeNum]["rowSet"][setNum][value2].toString();
    double v1 = 0.0;
    double v2 = 0.0;
    double v3 = 0.0;

    if (cellValue1 != "" && cellValue1 != null) {
      v1 = double.parse(cellValue1);
    }

    if (cellValue2 != "" && cellValue2 != null) {
      v2 = double.parse(cellValue2);
    }

    v3 = v1 - v2;

    Widget c;

    v3 > 0
        ? c = Container(
            alignment: Alignment.center,
            width: 10,
            child: Icon(
              Icons.arrow_drop_up,
              color: Colors.green,
            ))
        : c = Container(
            alignment: Alignment.center,
            width: 10,
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.red,
            ));

    return DataCell(Row(children: [
      Text(v3.toStringAsFixed(2),
          style: TextStyle(fontWeight: FontWeight.w500)),
      c
    ]));
  }

  Widget getDataGrid(
      dynamic stats, int typeNum, String measure, BuildContext context) {
    if (measure.toUpperCase() == "BASE") {
      return getBaseDataGrid(stats, typeNum, measure, context);
    } else if (measure.toUpperCase() == "ADVANCED") {
      return getAdvancedDataGrid(stats, typeNum, measure, context);
    } else if (measure.toUpperCase() == "MISC") {
      return getMiscDataGrid(stats, typeNum, measure, context);
    } else if (measure.toUpperCase() == "FOUR FACTORS") {
      return getFourFactorDataGrid(stats, typeNum, measure, context);
    } else if (measure.toUpperCase() == "SCORING") {
      return getScoringDataGrid(stats, typeNum, measure, context);
    } else if (measure.toUpperCase() == "OPPONENT") {
      return getOpponentDataGrid(stats, typeNum, measure, context);
    }

    return SizedBox();
  }

  Widget getBaseDataGrid(
      dynamic stats, int typeNum, String measure, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 15,
        headingRowHeight: 25,
        dataRowHeight: 25,
        // dataRowColor: MaterialStateProperty.resolveWith<Color>(
        //     (Set<MaterialState> states) {
        //   return Colors.green[300];
        // }),
        headingTextStyle:
            TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
        headingRowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Colors.grey[300];
        }),
        columns: [...getBaseDataColumns()],
        rows: [
          // The number of rows here is dynamic, based on the actual number of months the season currently ha
          ...getVariableBaseRows(stats, typeNum, context),
        ],
      ),
    );
  }

  Widget getAdvancedDataGrid(
      dynamic stats, int typeNum, String measure, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 15,
        headingRowHeight: 25,
        dataRowHeight: 25,
        headingTextStyle:
            TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
        headingRowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Colors.grey[300];
        }),
        columns: [...getAdvancedDataColumns()],
        rows: [
          // The number of rows here is dynamic, based on the actual number of months the season currently ha
          ...getVariableAdvancedRows(stats, typeNum, context),
        ],
      ),
    );
  }

  Widget getMiscDataGrid(
      dynamic stats, int typeNum, String measure, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 15,
        headingRowHeight: 25,
        dataRowHeight: 25,
        headingTextStyle:
            TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
        headingRowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Colors.grey[300];
        }),
        columns: [...getMiscDataColumns()],
        rows: [
          // The number of rows here is dynamic, based on the actual number of months the season currently ha
          ...getVariableMiscRows(stats, typeNum, context),
        ],
      ),
    );
  }

  Widget getFourFactorDataGrid(
      dynamic stats, int typeNum, String measure, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 15,
        headingRowHeight: 25,
        dataRowHeight: 25,
        headingTextStyle:
            TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
        headingRowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Colors.grey[300];
        }),
        columns: [...getFourFactorDataColumns()],
        rows: [
          // The number of rows here is dynamic, based on the actual number of months the season currently ha
          ...getVariableFourFactorRows(stats, typeNum, context),
        ],
      ),
    );
  }

  Widget getScoringDataGrid(
      dynamic stats, int typeNum, String measure, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 15,
        headingRowHeight: 25,
        dataRowHeight: 25,
        headingTextStyle:
            TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
        headingRowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Colors.grey[300];
        }),
        columns: [...getScoringDataColumns()],
        rows: [
          // The number of rows here is dynamic, based on the actual number of months the season currently ha
          ...getVariableScoringRows(stats, typeNum, context),
        ],
      ),
    );
  }

  Widget getOpponentDataGrid(
      dynamic stats, int typeNum, String measure, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 15,
        headingRowHeight: 25,
        dataRowHeight: 25,
        headingTextStyle:
            TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
        headingRowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Colors.grey[300];
        }),
        columns: [...getOpponentDataColumns()],
        rows: [
          // The number of rows here is dynamic, based on the actual number of months the season currently ha
          ...getVariableOpponentRows(stats, typeNum, context),
        ],
      ),
    );
  }
}
