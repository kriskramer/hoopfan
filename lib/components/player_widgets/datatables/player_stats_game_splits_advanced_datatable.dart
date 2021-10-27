import 'package:flutter/material.dart';

class PlayerStatsGameSplitsAdvancedDataTable extends StatelessWidget {
  final dynamic json;

  PlayerStatsGameSplitsAdvancedDataTable({this.json});

  @override
  Widget build(BuildContext context) {
    List<DataRow> rows = [];

    for (int i = 0; i < json.length; i++) {
      for (int j = 0; j < json[i]["rowSet"].length; j++) {
        rows.add(DataRow(cells: [
          DataCell(Text(json[i]["rowSet"][j][0].toString())),
          DataCell(Text(json[i]["rowSet"][j][1].toString())),
          DataCell(Text(json[i]["rowSet"][j][2].toString())),
          DataCell(Text(json[i]["rowSet"][j][3].toString())),
          DataCell(Text(json[i]["rowSet"][j][4].toString())),
          DataCell(Text(json[i]["rowSet"][j][5].toString())),
          DataCell(Text(double.parse(json[i]["rowSet"][j][6].toString())
              .toStringAsFixed(2))),
          DataCell(Text(json[i]["rowSet"][j][7].toString())),
          DataCell(Text(json[i]["rowSet"][j][8].toString())),
          DataCell(Text(json[i]["rowSet"][j][10].toString())),
          DataCell(Text(json[i]["rowSet"][j][11].toString())),
          DataCell(Text(json[i]["rowSet"][j][13].toString())),
          DataCell(Text(json[i]["rowSet"][j][14].toString())),
          DataCell(Text(json[i]["rowSet"][j][16].toString())),
          DataCell(Text(json[i]["rowSet"][j][17].toString())),
          DataCell(Text(json[i]["rowSet"][j][18].toString())),
          DataCell(Text(json[i]["rowSet"][j][19].toString())),
          DataCell(Text(json[i]["rowSet"][j][20].toString())),
          DataCell(Text(json[i]["rowSet"][j][21].toString())),
          DataCell(Text(json[i]["rowSet"][j][22].toString())),
          DataCell(Text(json[i]["rowSet"][j][23].toString())),
          DataCell(Text(json[i]["rowSet"][j][24].toString())),
          DataCell(Text(json[i]["rowSet"][j][25].toString())),
          DataCell(Text(json[i]["rowSet"][j][26].toString())),
          DataCell(Text(json[i]["rowSet"][j][28].toString())),
          DataCell(Text(json[i]["rowSet"][j][29].toString())),
          DataCell(Text(json[i]["rowSet"][j][30].toString())),
          DataCell(Text(json[i]["rowSet"][j][32].toString())),
          DataCell(Text(json[i]["rowSet"][j][33].toString())),
        ]));
      }
    }

    return DataTable(
      columnSpacing: 15,
      horizontalMargin: 5,
      dataRowHeight: 28,
      headingRowHeight: 30,
      headingTextStyle:
          TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
      headingRowColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Colors.grey[300]; // Use the default value.
      }),
      columns: [
        DataColumn(label: Text('Group')),
        DataColumn(label: Text('Value')),
        DataColumn(label: Text('G')),
        DataColumn(label: Text('W')),
        DataColumn(label: Text('L')),
        DataColumn(label: Text('W %')),
        DataColumn(label: Text('Min')),
        DataColumn(label: Text('eORtg')),
        DataColumn(label: Text('ORtg')),
        DataColumn(label: Text('eDRtg')),
        DataColumn(label: Text('DRtg')),
        DataColumn(label: Text('eNet')),
        DataColumn(label: Text('Net')),
        DataColumn(label: Text('Ast %')),
        DataColumn(label: Text('Ast/TO')),
        DataColumn(label: Text('Ast Ratio')),
        DataColumn(label: Text('OReb %')),
        DataColumn(label: Text('DReb %')),
        DataColumn(label: Text('Reb %')),
        DataColumn(label: Text('Tm TO %')),
        DataColumn(label: Text('eTO %')),
        DataColumn(label: Text('eFG %')),
        DataColumn(label: Text('TS %')),
        DataColumn(label: Text('Usage %')),
        DataColumn(label: Text('ePace')),
        DataColumn(label: Text('Pace')),
        DataColumn(label: Text('Pace/40')),
        DataColumn(label: Text('PIE')),
        DataColumn(label: Text('Poss')),
      ],
      rows: [
        ...rows,
      ],
    );
  }
}
