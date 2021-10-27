import 'package:flutter/material.dart';

class QuarterScores extends StatelessWidget {
  final dynamic game;

  QuarterScores({this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
      child: DataTable(
        headingRowHeight: 20,
        dataRowHeight: 24,
        columnSpacing: 10,
        columns: [
          DataColumn(label: Text('')),
          DataColumn(label: Text('1')),
          DataColumn(label: Text('2')),
          DataColumn(label: Text('3')),
          DataColumn(label: Text('4')),
          if (game["vTeam"]["linescore"].length > 4)
            DataColumn(label: Text('OT')),
          if (game["vTeam"]["linescore"].length > 5)
            DataColumn(label: Text('OT2')),
        ],
        rows: getQuarters(game),
        showBottomBorder: true,
      ),
    );
  }

  List<DataRow> getQuarters(dynamic game) {
    List<DataRow> list = [];
    DataRow vList =
        new DataRow(cells: [DataCell(Text(game["vTeam"]["triCode"]))]);
    DataRow hList =
        new DataRow(cells: [DataCell(Text(game["hTeam"]["triCode"]))]);

    for (var q in game["vTeam"]["linescore"]) {
      vList.cells.add(DataCell(Text(q["score"])));
    }

    for (var q in game["hTeam"]["linescore"]) {
      hList.cells.add(DataCell(Text(q["score"])));
    }

    list.add(vList);
    list.add(hList);

    return list;
  }
}
