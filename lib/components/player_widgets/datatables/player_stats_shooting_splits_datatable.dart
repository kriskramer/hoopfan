import 'package:flutter/material.dart';

class PlayerStatsShootingSplitsDataTable extends StatelessWidget {
  final dynamic json;

  PlayerStatsShootingSplitsDataTable({this.json});

  @override
  Widget build(BuildContext context) {
    List<DataRow> rows = List<DataRow>();

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
        DataColumn(label: Text('FGM')),
        DataColumn(label: Text('FGA')),
        DataColumn(label: Text('FG %')),
        DataColumn(label: Text('3PM')),
        DataColumn(label: Text('3PA')),
        DataColumn(label: Text('3P %')),
        DataColumn(label: Text('eFG %')),
        DataColumn(label: Text('BlkA')),
        DataColumn(label: Text('Ast 2 %')),
        DataColumn(label: Text('UAst 2 %')),
        DataColumn(label: Text('Ast 3 %')),
        DataColumn(label: Text('UAst 3 %')),
        DataColumn(label: Text('Ast FGM %')),
        DataColumn(label: Text('UAst FGM %')),
      ],
      rows: [
        ...rows,
      ],
    );
  }
}
