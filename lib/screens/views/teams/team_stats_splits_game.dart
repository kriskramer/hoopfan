import 'package:flutter/material.dart';

class TeamStatsSplitsGame extends StatelessWidget {
  final dynamic stats;
  final String measure;

  const TeamStatsSplitsGame({this.stats, this.measure});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Text(
            'Game Splits',
            style: TextStyle(fontSize: 20),
          ),
          getDataGrid(stats, 0, measure),
          SizedBox(
            height: 10,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 TeamStatsShootingGeneralCharts([stats]),
          //           ));
          //     },
          //     child: Text("Charts")),
          SizedBox(
            height: 25,
          ),
          Text(
            'Splits By Half',
            style: TextStyle(fontSize: 20),
          ),

          getDataGrid(stats, 1, measure),
          SizedBox(
            height: 10,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 TeamStatsShootingGeneralCharts([stats]),
          //           ));
          //     },
          //     child: Text("Charts")),
          SizedBox(
            height: 25,
          ),
          Text(
            'Splits By Period',
            style: TextStyle(fontSize: 20),
          ),

          getDataGrid(stats, 2, measure),
          SizedBox(
            height: 10,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 TeamStatsShootingGeneralCharts([stats]),
          //           ));
          //     },
          //     child: Text("Charts")),
          SizedBox(
            height: 25,
          ),
          Text(
            'Splits By Score Margin',
            style: TextStyle(fontSize: 20),
          ),

          getDataGrid(stats, 3, measure),
          SizedBox(
            height: 10,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 TeamStatsShootingGeneralCharts([stats]),
          //           ));
          //     },
          //     child: Text("Charts")),
          SizedBox(
            height: 25,
          ),
          Text(
            'Splits By Actual Margin',
            style: TextStyle(fontSize: 20),
          ),

          getDataGrid(stats, 4, measure),
          SizedBox(
            height: 10,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 TeamStatsShootingGeneralCharts([stats]),
          //           ));
          //     },
          //     child: Text("Charts")),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  List<DataRow> getVariableBaseRows(dynamic stats, int typeNum) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][typeNum]["rowSet"].length; i++) {
      list.add(getBaseDataRow(stats, typeNum, i));
    }
    return list;
  }

  List<DataRow> getVariableAdvancedRows(dynamic stats, int typeNum) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][typeNum]["rowSet"].length; i++) {
      list.add(getAdvancedDataRow(stats, typeNum, i));
    }
    return list;
  }

  List<DataRow> getVariableMiscRows(dynamic stats, int typeNum) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][typeNum]["rowSet"].length; i++) {
      list.add(getMiscDataRow(stats, typeNum, i));
    }
    return list;
  }

  List<DataRow> getVariableFourFactorRows(dynamic stats, int typeNum) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][typeNum]["rowSet"].length; i++) {
      list.add(getFourFactorDataRow(stats, typeNum, i));
    }
    return list;
  }

  List<DataRow> getVariableScoringRows(dynamic stats, int typeNum) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][typeNum]["rowSet"].length; i++) {
      list.add(getScoringDataRow(stats, typeNum, i));
    }
    return list;
  }

  List<DataRow> getVariableOpponentRows(dynamic stats, int typeNum) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][typeNum]["rowSet"].length; i++) {
      list.add(getOpponentDataRow(stats, typeNum, i));
    }
    return list;
  }

  DataRow getBaseDataRow(dynamic stats, int typeNum, int setNum) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 0),
      getDataCell(stats, typeNum, setNum, 1),
      getDataCell(stats, typeNum, setNum, 2),
      getDataCell(stats, typeNum, setNum, 3),
      getDataCell(stats, typeNum, setNum, 4),
      getDataCell(stats, typeNum, setNum, 5),
      getDataCell(stats, typeNum, setNum, 6),
      getDataCell(stats, typeNum, setNum, 7),
      getDataCell(stats, typeNum, setNum, 8),
      getDataCell(stats, typeNum, setNum, 9),
      getDataCell(stats, typeNum, setNum, 10),
      getDataCell(stats, typeNum, setNum, 11),
      getDataCell(stats, typeNum, setNum, 12),
      getDataCell(stats, typeNum, setNum, 13),
      getDataCell(stats, typeNum, setNum, 14),
      getDataCell(stats, typeNum, setNum, 15),
      getDataCell(stats, typeNum, setNum, 16),
      getDataCell(stats, typeNum, setNum, 17),
      getDataCell(stats, typeNum, setNum, 18),
      getDataCell(stats, typeNum, setNum, 19),
      getDataCell(stats, typeNum, setNum, 20),
      getDataCell(stats, typeNum, setNum, 21),
      getDataCell(stats, typeNum, setNum, 22),
      getDataCell(stats, typeNum, setNum, 23),
      getDataCell(stats, typeNum, setNum, 24),
      getDataCell(stats, typeNum, setNum, 25),
      getDataCell(stats, typeNum, setNum, 26),
      getDataCell(stats, typeNum, setNum, 27),
    ]);
  }

  DataRow getAdvancedDataRow(dynamic stats, int typeNum, int setNum) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 0),
      getDataCell(stats, typeNum, setNum, 1),
      getDataCell(stats, typeNum, setNum, 2),
      getDataCell(stats, typeNum, setNum, 3),
      getDataCell(stats, typeNum, setNum, 4),
      getDataCell(stats, typeNum, setNum, 5),
      getDataCell(stats, typeNum, setNum, 6),
      //getDataCell(stats, typeNum, setNum, 7),
      getDataCell(stats, typeNum, setNum, 8),
      //getDataCell(stats, typeNum, setNum, 9),
      getDataCell(stats, typeNum, setNum, 10),
      //getDataCell(stats, typeNum, setNum, 11),
      getDataCell(stats, typeNum, setNum, 12),
      getDataCell(stats, typeNum, setNum, 13),
      getDataCell(stats, typeNum, setNum, 14),
      getDataCell(stats, typeNum, setNum, 15),
      getDataCell(stats, typeNum, setNum, 16),
      getDataCell(stats, typeNum, setNum, 17),
      getDataCell(stats, typeNum, setNum, 18),
      getDataCell(stats, typeNum, setNum, 19),
      getDataCell(stats, typeNum, setNum, 20),
      getDataCell(stats, typeNum, setNum, 21),
      //getDataCell(stats, typeNum, setNum, 22),
      getDataCell(stats, typeNum, setNum, 23),
      getDataCell(stats, typeNum, setNum, 24),
      getDataCell(stats, typeNum, setNum, 25),
      getDataCell(stats, typeNum, setNum, 26),
    ]);
  }

  DataRow getMiscDataRow(dynamic stats, int typeNum, int setNum) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 0),
      getDataCell(stats, typeNum, setNum, 1),
      getDataCell(stats, typeNum, setNum, 2),
      getDataCell(stats, typeNum, setNum, 3),
      getDataCell(stats, typeNum, setNum, 4),
      getDataCell(stats, typeNum, setNum, 5),
      getDataCell(stats, typeNum, setNum, 6),
      getDataCell(stats, typeNum, setNum, 7),
      getDataCell(stats, typeNum, setNum, 8),
      getDataCell(stats, typeNum, setNum, 9),
      getDataCell(stats, typeNum, setNum, 10),
      getDataCell(stats, typeNum, setNum, 11),
      getDataCell(stats, typeNum, setNum, 12),
      getDataCell(stats, typeNum, setNum, 13),
      getDataCell(stats, typeNum, setNum, 14),
    ]);
  }

  DataRow getFourFactorDataRow(dynamic stats, int typeNum, int setNum) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 0),
      getDataCell(stats, typeNum, setNum, 1),
      getDataCell(stats, typeNum, setNum, 2),
      getDataCell(stats, typeNum, setNum, 3),
      getDataCell(stats, typeNum, setNum, 4),
      getDataCell(stats, typeNum, setNum, 5),
      getDataCell(stats, typeNum, setNum, 6),
      getDataCell(stats, typeNum, setNum, 7),
      getDataCell(stats, typeNum, setNum, 8),
      getDataCell(stats, typeNum, setNum, 9),
      getDataCell(stats, typeNum, setNum, 10),
      getDataCell(stats, typeNum, setNum, 11),
      getDataCell(stats, typeNum, setNum, 12),
      getDataCell(stats, typeNum, setNum, 13),
      getDataCell(stats, typeNum, setNum, 14),
    ]);
  }

  DataRow getScoringDataRow(dynamic stats, int typeNum, int setNum) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 0),
      getDataCell(stats, typeNum, setNum, 1),
      getDataCell(stats, typeNum, setNum, 2),
      getDataCell(stats, typeNum, setNum, 3),
      getDataCell(stats, typeNum, setNum, 4),
      getDataCell(stats, typeNum, setNum, 5),
      getDataCell(stats, typeNum, setNum, 6),
      getDataCell(stats, typeNum, setNum, 7),
      getDataCell(stats, typeNum, setNum, 8),
      getDataCell(stats, typeNum, setNum, 9),
      getDataCell(stats, typeNum, setNum, 10),
      getDataCell(stats, typeNum, setNum, 11),
      getDataCell(stats, typeNum, setNum, 12),
      getDataCell(stats, typeNum, setNum, 13),
      getDataCell(stats, typeNum, setNum, 14),
      getDataCell(stats, typeNum, setNum, 15),
      getDataCell(stats, typeNum, setNum, 16),
      getDataCell(stats, typeNum, setNum, 17),
      getDataCell(stats, typeNum, setNum, 18),
      getDataCell(stats, typeNum, setNum, 19),
      getDataCell(stats, typeNum, setNum, 20),
      getDataCell(stats, typeNum, setNum, 21),
    ]);
  }

  DataRow getOpponentDataRow(dynamic stats, int typeNum, int setNum) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 0),
      getDataCell(stats, typeNum, setNum, 1),
      getDataCell(stats, typeNum, setNum, 2),
      getDataCell(stats, typeNum, setNum, 3),
      getDataCell(stats, typeNum, setNum, 4),
      getDataCell(stats, typeNum, setNum, 5),
      getDataCell(stats, typeNum, setNum, 6),
      getDataCell(stats, typeNum, setNum, 7),
      getDataCell(stats, typeNum, setNum, 8),
      getDataCell(stats, typeNum, setNum, 9),
      getDataCell(stats, typeNum, setNum, 10),
      getDataCell(stats, typeNum, setNum, 11),
      getDataCell(stats, typeNum, setNum, 12),
      getDataCell(stats, typeNum, setNum, 13),
      getDataCell(stats, typeNum, setNum, 14),
      getDataCell(stats, typeNum, setNum, 15),
      getDataCell(stats, typeNum, setNum, 16),
      getDataCell(stats, typeNum, setNum, 17),
      getDataCell(stats, typeNum, setNum, 18),
      getDataCell(stats, typeNum, setNum, 19),
      getDataCell(stats, typeNum, setNum, 20),
      getDataCell(stats, typeNum, setNum, 21),
      getDataCell(stats, typeNum, setNum, 22),
      getDataCell(stats, typeNum, setNum, 23),
      getDataCell(stats, typeNum, setNum, 24),
      getDataCell(stats, typeNum, setNum, 25),
      getDataCell(stats, typeNum, setNum, 26),
      getDataCell(stats, typeNum, setNum, 27),
    ]);
  }

  DataCell getDataCell(dynamic stats, int typeNum, int setNum, int valueNum) {
    if (stats["resultSets"][typeNum]["rowSet"].length == 0) {
      return DataCell(Text('0.0'));
    }

    return DataCell(Text(
        stats["resultSets"][typeNum]["rowSet"][setNum][valueNum].toString()));
  }

  List<DataColumn> getBaseDataColumns() {
    List<DataColumn> list = [];

    list.add(DataColumn(label: Text('Group')));
    list.add(DataColumn(label: Text('Value')));
    list.add(DataColumn(label: Text('GP')));
    list.add(DataColumn(label: Text('W')));
    list.add(DataColumn(label: Text('L')));
    list.add(DataColumn(label: Text('W %')));
    list.add(DataColumn(label: Text('Min')));
    list.add(DataColumn(label: Text('FGM')));
    list.add(DataColumn(label: Text('FGA')));
    list.add(DataColumn(label: Text('FG %')));
    list.add(DataColumn(label: Text('3PM')));
    list.add(DataColumn(label: Text('3PA')));
    list.add(DataColumn(label: Text('3P %')));
    list.add(DataColumn(label: Text('FTM')));
    list.add(DataColumn(label: Text('FTA')));
    list.add(DataColumn(label: Text('FT %')));
    list.add(DataColumn(label: Text('OREB')));
    list.add(DataColumn(label: Text('DREB')));
    list.add(DataColumn(label: Text('REB')));
    list.add(DataColumn(label: Text('AST')));
    list.add(DataColumn(label: Text('TOV')));
    list.add(DataColumn(label: Text('STL')));
    list.add(DataColumn(label: Text('BLK')));
    list.add(DataColumn(label: Text('BLKA')));
    list.add(DataColumn(label: Text('PF')));
    list.add(DataColumn(label: Text('PFD')));
    list.add(DataColumn(label: Text('PTS')));
    list.add(DataColumn(label: Text('+/-')));

    return list;
  }

  List<DataColumn> getAdvancedDataColumns() {
    List<DataColumn> list = [];

    list.add(DataColumn(label: Text('Group')));
    list.add(DataColumn(label: Text('Value')));
    list.add(DataColumn(label: Text('GP')));
    list.add(DataColumn(label: Text('W')));
    list.add(DataColumn(label: Text('L')));
    list.add(DataColumn(label: Text('W %')));
    list.add(DataColumn(label: Text('Min')));
    list.add(DataColumn(label: Text('ORtg')));
    list.add(DataColumn(label: Text('DRtg')));
    list.add(DataColumn(label: Text('Net')));
    list.add(DataColumn(label: Text('Ast %')));
    list.add(DataColumn(label: Text('Ast/Tov')));
    list.add(DataColumn(label: Text('Ast Rto')));
    list.add(DataColumn(label: Text('OReb %')));
    list.add(DataColumn(label: Text('DReb %')));
    list.add(DataColumn(label: Text('Reb %')));
    list.add(DataColumn(label: Text('Tm Tov %')));
    list.add(DataColumn(label: Text('eFG %')));
    list.add(DataColumn(label: Text('TS %')));
    list.add(DataColumn(label: Text('Pace')));
    list.add(DataColumn(label: Text('Pace/40')));
    list.add(DataColumn(label: Text('Poss')));
    list.add(DataColumn(label: Text('Pie')));

    return list;
  }

  List<DataColumn> getMiscDataColumns() {
    List<DataColumn> list = [];

    list.add(DataColumn(label: Text('Group')));
    list.add(DataColumn(label: Text('Value')));
    list.add(DataColumn(label: Text('GP')));
    list.add(DataColumn(label: Text('W')));
    list.add(DataColumn(label: Text('L')));
    list.add(DataColumn(label: Text('W %')));
    list.add(DataColumn(label: Text('Min')));
    list.add(DataColumn(label: Text('Pts off Tov')));
    list.add(DataColumn(label: Text('Pts 2nd Ch')));
    list.add(DataColumn(label: Text('Pts Fb')));
    list.add(DataColumn(label: Text('Pts Paint')));
    list.add(DataColumn(label: Text('Opp Pts off Tov')));
    list.add(DataColumn(label: Text('Opp Pts 2nd Ch')));
    list.add(DataColumn(label: Text('Opp Pts Fb')));
    list.add(DataColumn(label: Text('Opp Pts Paint')));

    return list;
  }

  List<DataColumn> getFourFactorDataColumns() {
    List<DataColumn> list = [];

    list.add(DataColumn(label: Text('Group')));
    list.add(DataColumn(label: Text('Value')));
    list.add(DataColumn(label: Text('GP')));
    list.add(DataColumn(label: Text('W')));
    list.add(DataColumn(label: Text('L')));
    list.add(DataColumn(label: Text('W %')));
    list.add(DataColumn(label: Text('Min')));
    list.add(DataColumn(label: Text('eFg %')));
    list.add(DataColumn(label: Text('FTA Rate')));
    list.add(DataColumn(label: Text('Tm Tov %')));
    list.add(DataColumn(label: Text('OReb %')));
    list.add(DataColumn(label: Text('Opp eFg %')));
    list.add(DataColumn(label: Text('Opp FTA Rate')));
    list.add(DataColumn(label: Text('Opp Tm Tov %')));
    list.add(DataColumn(label: Text('Opp OReb %')));

    return list;
  }

  List<DataColumn> getScoringDataColumns() {
    List<DataColumn> list = [];

    list.add(DataColumn(label: Text('Group')));
    list.add(DataColumn(label: Text('Value')));
    list.add(DataColumn(label: Text('GP')));
    list.add(DataColumn(label: Text('W')));
    list.add(DataColumn(label: Text('L')));
    list.add(DataColumn(label: Text('W %')));
    list.add(DataColumn(label: Text('Min')));
    list.add(DataColumn(label: Text('% FGA 2P')));
    list.add(DataColumn(label: Text('% FGA 3P')));
    list.add(DataColumn(label: Text('% Pts 2P')));
    list.add(DataColumn(label: Text('% Pts 2P MR')));
    list.add(DataColumn(label: Text('% Pts 3P')));
    list.add(DataColumn(label: Text('% Pts FB')));
    list.add(DataColumn(label: Text('% Pts FT')));
    list.add(DataColumn(label: Text('% Pts off Tov')));
    list.add(DataColumn(label: Text('% Pts Paint')));
    list.add(DataColumn(label: Text('% Ast 2P')));
    list.add(DataColumn(label: Text('% UAst 2P')));
    list.add(DataColumn(label: Text('% Ast 3P')));
    list.add(DataColumn(label: Text('% UAst 3P')));
    list.add(DataColumn(label: Text('% Ast FGM')));
    list.add(DataColumn(label: Text('% UAst FGM')));

    return list;
  }

  List<DataColumn> getOpponentDataColumns() {
    List<DataColumn> list = [];

    list.add(DataColumn(label: Text('Group')));
    list.add(DataColumn(label: Text('Value')));
    list.add(DataColumn(label: Text('GP')));
    list.add(DataColumn(label: Text('W')));
    list.add(DataColumn(label: Text('L')));
    list.add(DataColumn(label: Text('W %')));
    list.add(DataColumn(label: Text('Min')));
    list.add(DataColumn(label: Text('Opp FGM')));
    list.add(DataColumn(label: Text('Opp FGA')));
    list.add(DataColumn(label: Text('Opp FG %')));
    list.add(DataColumn(label: Text('Opp 3PM')));
    list.add(DataColumn(label: Text('Opp 3PA')));
    list.add(DataColumn(label: Text('Opp 3P %')));
    list.add(DataColumn(label: Text('Opp FTM')));
    list.add(DataColumn(label: Text('Opp FTA')));
    list.add(DataColumn(label: Text('Opp FT %')));
    list.add(DataColumn(label: Text('Opp OREB')));
    list.add(DataColumn(label: Text('Opp DREB')));
    list.add(DataColumn(label: Text('Opp REB')));
    list.add(DataColumn(label: Text('Opp AST')));
    list.add(DataColumn(label: Text('Opp TOV')));
    list.add(DataColumn(label: Text('Opp STL')));
    list.add(DataColumn(label: Text('Opp BLK')));
    list.add(DataColumn(label: Text('Opp BLKA')));
    list.add(DataColumn(label: Text('Opp PF')));
    list.add(DataColumn(label: Text('Opp PFD')));
    list.add(DataColumn(label: Text('Opp PTS')));
    list.add(DataColumn(label: Text('Opp +/-')));

    return list;
  }

  Widget getDataGrid(dynamic stats, int typeNum, String measure) {
    if (measure.toUpperCase() == "BASE") {
      return getBaseDataGrid(stats, typeNum, measure);
    } else if (measure.toUpperCase() == "ADVANCED") {
      return getAdvancedDataGrid(stats, typeNum, measure);
    } else if (measure.toUpperCase() == "MISC") {
      return getMiscDataGrid(stats, typeNum, measure);
    } else if (measure.toUpperCase() == "FOUR FACTORS") {
      return getFourFactorDataGrid(stats, typeNum, measure);
    } else if (measure.toUpperCase() == "SCORING") {
      return getScoringDataGrid(stats, typeNum, measure);
    } else if (measure.toUpperCase() == "OPPONENT") {
      return getOpponentDataGrid(stats, typeNum, measure);
    }

    return SizedBox();
  }

  Widget getBaseDataGrid(dynamic stats, int typeNum, String measure) {
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
        columns: [...getBaseDataColumns()],
        rows: [
          // The number of rows here is dynamic, based on the actual number of months the season currently ha
          ...getVariableBaseRows(stats, typeNum),
        ],
      ),
    );
  }

  Widget getAdvancedDataGrid(dynamic stats, int typeNum, String measure) {
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
          ...getVariableAdvancedRows(stats, typeNum),
        ],
      ),
    );
  }

  Widget getMiscDataGrid(dynamic stats, int typeNum, String measure) {
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
          ...getVariableMiscRows(stats, typeNum),
        ],
      ),
    );
  }

  Widget getFourFactorDataGrid(dynamic stats, int typeNum, String measure) {
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
          ...getVariableFourFactorRows(stats, typeNum),
        ],
      ),
    );
  }

  Widget getScoringDataGrid(dynamic stats, int typeNum, String measure) {
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
          ...getVariableScoringRows(stats, typeNum),
        ],
      ),
    );
  }

  Widget getOpponentDataGrid(dynamic stats, int typeNum, String measure) {
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
          ...getVariableOpponentRows(stats, typeNum),
        ],
      ),
    );
  }
}
