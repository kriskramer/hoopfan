import 'package:flutter/material.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';
import 'package:hoop/screens/views/teams/game_logs/team_stats_game_log_advanced_trends_chart.dart';
import 'package:hoop/screens/views/teams/game_logs/team_stats_game_log_base_trends_chart.dart';

class TeamStatsGameLogsGrid extends StatelessWidget {
  final dynamic stats;
  final String measure;

  const TeamStatsGameLogsGrid({this.stats, this.measure});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Text(
            'Game Logs',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Tap a value to see a chart display for that data column."),
          SizedBox(
            height: 10,
          ),
          getDataGrid(stats, 0, measure, context),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  List<DataRow> getVariableBaseRows(dynamic stats, BuildContext context) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][0]["rowSet"].length; i++) {
      list.add(getBaseDataRow(stats, i, context));
    }
    return list;
  }

  List<DataRow> getVariableAdvancedRows(dynamic stats, BuildContext context) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][0]["rowSet"].length; i++) {
      list.add(getAdvancedDataRow(stats, i, context));
    }
    return list;
  }

  List<DataRow> getVariableMiscRows(dynamic stats, BuildContext context) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][0]["rowSet"].length; i++) {
      list.add(getMiscDataRow(stats, i, context));
    }
    return list;
  }

  List<DataRow> getVariableFourFactorRows(dynamic stats, BuildContext context) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][0]["rowSet"].length; i++) {
      list.add(getFourFactorDataRow(stats, i, context));
    }
    return list;
  }

  List<DataRow> getVariableScoringRows(dynamic stats, BuildContext context) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][0]["rowSet"].length; i++) {
      list.add(getScoringDataRow(stats, i, context));
    }
    return list;
  }

  List<DataRow> getVariableOpponentRows(dynamic stats, BuildContext context) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][0]["rowSet"].length; i++) {
      list.add(getOpponentDataRow(stats, i, context));
    }
    return list;
  }

  DataRow getBaseDataRow(dynamic stats, int game, BuildContext context) {
    return DataRow(
        color: stats["resultSets"][0]["rowSet"][game][7].toString() == "W"
            ? MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                return Colors.green[50];
              })
            : MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                return Colors.red[50];
              }),
        cells: [
          getDataCell(stats, game, 5, "", context),
          getDataCell(stats, game, 6, "", context),
          getDataCell(stats, game, 7, "", context),
          getDataCell(stats, game, 9, "FGM", context),
          getDataCell(stats, game, 10, "FGA", context),
          getDataCell(stats, game, 11, "FG %", context),
          getDataCell(stats, game, 12, "3PM", context),
          getDataCell(stats, game, 13, "3PA", context),
          getDataCell(stats, game, 14, "3P %", context),
          getDataCell(stats, game, 15, "FTM", context),
          getDataCell(stats, game, 16, "FTA", context),
          getDataCell(stats, game, 17, "FT %", context),
          getDataCell(stats, game, 18, "OREB", context),
          getDataCell(stats, game, 19, "DREB", context),
          getDataCell(stats, game, 20, "REB", context),
          getDataCell(stats, game, 21, "AST", context),
          getDataCell(stats, game, 22, "TOV", context),
          getDataCell(stats, game, 23, "STL", context),
          getDataCell(stats, game, 24, "BLK", context),
          getDataCell(stats, game, 25, "BLKA", context),
          getDataCell(stats, game, 26, "PF", context),
          getDataCell(stats, game, 27, "PFD", context),
          getDataCell(stats, game, 28, "PTS", context),
          getDataCell(stats, game, 29, "+/-", context),
        ]);
  }

  DataRow getAdvancedDataRow(dynamic stats, int game, BuildContext context) {
    return DataRow(
        color: stats["resultSets"][0]["rowSet"][game][7].toString() == "W"
            ? MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                return Colors.green[50];
              })
            : MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                return Colors.red[50];
              }),
        cells: [
          getDataCell(stats, game, 5, "", context),
          getDataCell(stats, game, 6, "", context),
          getDataCell(stats, game, 7, "", context),
          getDataCell(stats, game, 10, "ORtg", context),
          getDataCell(stats, game, 12, "DRtg", context),
          getDataCell(stats, game, 14, "Net", context),
          getDataCell(stats, game, 15, "Ast %", context),
          getDataCell(stats, game, 16, "AstTov", context),
          getDataCell(stats, game, 17, "Ast Rto", context),
          getDataCell(stats, game, 18, "OReb %", context),
          getDataCell(stats, game, 19, "DReb %", context),
          getDataCell(stats, game, 20, "Reb %", context),
          getDataCell(stats, game, 21, "TmTov %", context),
          getDataCell(stats, game, 22, "eFG %", context),
          getDataCell(stats, game, 23, "TS %", context),
          getDataCell(stats, game, 25, "Pace", context),
          getDataCell(stats, game, 26, "Pace/40", context),
          getDataCell(stats, game, 27, "Poss", context),
          getDataCell(stats, game, 28, "PIE", context),
        ]);
  }

  DataRow getMiscDataRow(dynamic stats, int game, BuildContext context) {
    return DataRow(
        color: stats["resultSets"][0]["rowSet"][game][7].toString() == "W"
            ? MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                return Colors.green[50];
              })
            : MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                return Colors.red[50];
              }),
        cells: [
          getDataCell(stats, game, 5, "", context),
          getDataCell(stats, game, 6, "", context),
          getDataCell(stats, game, 7, "", context),
          getDataCell(stats, game, 9, "", context),
          getDataCell(stats, game, 10, "", context),
          getDataCell(stats, game, 11, "", context),
          getDataCell(stats, game, 12, "", context),
          getDataCell(stats, game, 13, "", context),
          getDataCell(stats, game, 14, "", context),
          getDataCell(stats, game, 15, "", context),
          getDataCell(stats, game, 16, "", context),
        ]);
  }

  DataRow getFourFactorDataRow(dynamic stats, int game, BuildContext context) {
    return DataRow(
        color: stats["resultSets"][0]["rowSet"][game][7].toString() == "W"
            ? MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                return Colors.green[50];
              })
            : MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                return Colors.red[50];
              }),
        cells: [
          getDataCell(stats, game, 5, "", context),
          getDataCell(stats, game, 6, "", context),
          getDataCell(stats, game, 7, "", context),
          getDataCell(stats, game, 9, "", context),
          getDataCell(stats, game, 10, "", context),
          getDataCell(stats, game, 11, "", context),
          getDataCell(stats, game, 12, "", context),
          getDataCell(stats, game, 13, "", context),
          getDataCell(stats, game, 14, "", context),
          getDataCell(stats, game, 15, "", context),
          getDataCell(stats, game, 16, "", context),
        ]);
  }

  DataRow getScoringDataRow(dynamic stats, int game, BuildContext context) {
    return DataRow(
        color: stats["resultSets"][0]["rowSet"][game][7].toString() == "W"
            ? MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                return Colors.green[50];
              })
            : MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                return Colors.red[50];
              }),
        cells: [
          getDataCell(stats, game, 5, "", context),
          getDataCell(stats, game, 6, "", context),
          getDataCell(stats, game, 7, "", context),
          getDataCell(stats, game, 9, "", context),
          getDataCell(stats, game, 10, "", context),
          getDataCell(stats, game, 11, "", context),
          getDataCell(stats, game, 12, "", context),
          getDataCell(stats, game, 13, "", context),
          getDataCell(stats, game, 14, "", context),
          getDataCell(stats, game, 15, "", context),
          getDataCell(stats, game, 16, "", context),
          getDataCell(stats, game, 17, "", context),
          getDataCell(stats, game, 18, "", context),
          getDataCell(stats, game, 19, "", context),
          getDataCell(stats, game, 20, "", context),
          getDataCell(stats, game, 21, "", context),
          getDataCell(stats, game, 22, "", context),
          getDataCell(stats, game, 23, "", context),
        ]);
  }

  DataRow getOpponentDataRow(dynamic stats, int game, BuildContext context) {
    return DataRow(
        color: stats["resultSets"][0]["rowSet"][game][7].toString() == "W"
            ? MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                return Colors.green[50];
              })
            : MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                return Colors.red[50];
              }),
        cells: [
          getDataCell(stats, game, 5, "", context),
          getDataCell(stats, game, 6, "", context),
          getDataCell(stats, game, 7, "", context),
          getDataCell(stats, game, 9, "", context),
          getDataCell(stats, game, 10, "", context),
          getDataCell(stats, game, 11, "", context),
          getDataCell(stats, game, 12, "", context),
          getDataCell(stats, game, 13, "", context),
          getDataCell(stats, game, 14, "", context),
          getDataCell(stats, game, 15, "", context),
          getDataCell(stats, game, 16, "", context),
          getDataCell(stats, game, 17, "", context),
          getDataCell(stats, game, 18, "", context),
          getDataCell(stats, game, 19, "", context),
          getDataCell(stats, game, 20, "", context),
          getDataCell(stats, game, 21, "", context),
          getDataCell(stats, game, 22, "", context),
          getDataCell(stats, game, 23, "", context),
          getDataCell(stats, game, 24, "", context),
          getDataCell(stats, game, 25, "", context),
          getDataCell(stats, game, 26, "", context),
          getDataCell(stats, game, 27, "", context),
          getDataCell(stats, game, 28, "", context),
          getDataCell(stats, game, 29, "", context),
        ]);
  }

  DataCell getDataCell(dynamic stats, int game, int valueNum, String statName,
      BuildContext context) {
    if (stats["resultSets"][0]["rowSet"].length == 0) {
      return DataCell(Text('0.0'));
    }

    String cellValue =
        stats["resultSets"][0]["rowSet"][game][valueNum].toString();

    cellValue = cellValue.replaceAll("T00:00:00", "");

    if (statName == "") {
      return DataCell(Text(cellValue));
    } else if (measure == "Base") {
      return DataCell(GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return TeamStatsGameLogBaseCharts(stats, statName);
                });
          },
          child: Text(cellValue)));
    } else if (measure == "Advanced") {
      return DataCell(GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return TeamStatsGameLogAdvancedCharts(stats, statName);
                });
          },
          child: Text(cellValue)));
    }

    return DataCell(Text(cellValue));
  }

  List<DataColumn> getBaseDataColumns() {
    List<DataColumn> list = [];

    list.add(DataColumn(label: Text('Date')));
    list.add(DataColumn(label: Text('Game')));
    list.add(DataColumn(label: Text('WL')));
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

    list.add(DataColumn(label: Text('Date')));
    list.add(DataColumn(label: Text('Game')));
    list.add(DataColumn(label: Text('WL')));
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

    list.add(DataColumn(label: Text('Date')));
    list.add(DataColumn(label: Text('Game')));
    list.add(DataColumn(label: Text('WL')));
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

    list.add(DataColumn(label: Text('Date')));
    list.add(DataColumn(label: Text('Game')));
    list.add(DataColumn(label: Text('WL')));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('eFG %'), statName: "eFG %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('FTA Rate'), statName: "FTA RATE")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('Tm Tov %'), statName: "TM TOV %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('OReb %'), statName: "OREB %")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('Opp eFg %'), statName: "Opp eFg %")));
    list.add(DataColumn(
        label: StatInfoDialog(
            label: Text('Opp FTA Rate'), statName: "Opp FTA Rate")));
    list.add(DataColumn(
        label: StatInfoDialog(
            label: Text('Opp Tm Tov %'), statName: "Opp Tm Tov %")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('Opp OReb %'), statName: "Opp OReb %")));

    return list;
  }

  List<DataColumn> getScoringDataColumns() {
    List<DataColumn> list = [];

    list.add(DataColumn(label: Text('Date')));
    list.add(DataColumn(label: Text('Game')));
    list.add(DataColumn(label: Text('WL')));
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

    list.add(DataColumn(label: Text('Date')));
    list.add(DataColumn(label: Text('Game')));
    list.add(DataColumn(label: Text('WL')));
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
          ...getVariableBaseRows(stats, context),
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
          ...getVariableAdvancedRows(stats, context),
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
          ...getVariableMiscRows(stats, context),
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
          ...getVariableFourFactorRows(stats, context),
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
          ...getVariableScoringRows(stats, context),
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
          ...getVariableOpponentRows(stats, context),
        ],
      ),
    );
  }
}
