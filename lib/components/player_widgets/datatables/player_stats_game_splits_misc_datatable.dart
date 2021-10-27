import 'package:flutter/material.dart';

class PlayerStatsGameSplitsMiscDataTable extends StatelessWidget {
  final dynamic json;

  PlayerStatsGameSplitsMiscDataTable({this.json});

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
          DataCell(Text(json[i]["rowSet"][j][9].toString())),
          DataCell(Text(json[i]["rowSet"][j][10].toString())),
          DataCell(Text(json[i]["rowSet"][j][11].toString())),
          DataCell(Text(json[i]["rowSet"][j][12].toString())),
          DataCell(Text(json[i]["rowSet"][j][13].toString())),
          DataCell(Text(json[i]["rowSet"][j][14].toString())),
          DataCell(Text(json[i]["rowSet"][j][15].toString())),
          DataCell(Text(json[i]["rowSet"][j][16].toString())),
          DataCell(Text(json[i]["rowSet"][j][17].toString())),
          DataCell(Text(json[i]["rowSet"][j][18].toString())),
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
        DataColumn(label: Text('Pts TO')),
        DataColumn(label: Text('2nd Ch Pts')),
        DataColumn(label: Text('Pts FB')),
        DataColumn(label: Text('Pts Paint')),
        DataColumn(label: Text('Opp Pts TO')),
        DataColumn(label: Text('Opp 2nd Ch Pts')),
        DataColumn(label: Text('Opp Pts FB')),
        DataColumn(label: Text('Opp Pts Paint')),
        DataColumn(label: Text('Blks')),
        DataColumn(label: Text('BlksA')),
        DataColumn(label: Text('PF')),
        DataColumn(label: Text('PFD')),
      ],
      rows: [
        ...rows,
      ],
    );
  }
}
