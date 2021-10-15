import 'package:flutter/material.dart';

class PlayerStatsScoringDataTable extends StatelessWidget {
  final dynamic json;

  PlayerStatsScoringDataTable({this.json});

  @override
  Widget build(BuildContext context) {
    List<DataRow> rows = [];

    for (int i = 0; i < json.length; i++) {
      if (json[i]["rowSet"].length > 0) {
        rows.add(DataRow(cells: [
          DataCell(Text(json[i]["rowSet"][0][0].toString())),
          DataCell(Text(json[i]["rowSet"][0][2].toString())),
          DataCell(Text(json[i]["rowSet"][0][3].toString())),
          DataCell(Text(json[i]["rowSet"][0][4].toString())),
          DataCell(Text(json[i]["rowSet"][0][5].toString())),
          DataCell(Text(double.parse(json[i]["rowSet"][0][6].toString())
              .toStringAsFixed(2))),
          DataCell(Text(json[i]["rowSet"][0][7].toString())),
          DataCell(Text(json[i]["rowSet"][0][8].toString())),
          DataCell(Text(json[i]["rowSet"][0][9].toString())),
          DataCell(Text(json[i]["rowSet"][0][10].toString())),
          DataCell(Text(json[i]["rowSet"][0][11].toString())),
          DataCell(Text(json[i]["rowSet"][0][12].toString())),
          DataCell(Text(json[i]["rowSet"][0][13].toString())),
          DataCell(Text(json[i]["rowSet"][0][14].toString())),
          DataCell(Text(json[i]["rowSet"][0][15].toString())),
          DataCell(Text(json[i]["rowSet"][0][16].toString())),
          DataCell(Text(json[i]["rowSet"][0][17].toString())),
          DataCell(Text(json[i]["rowSet"][0][18].toString())),
          DataCell(Text(json[i]["rowSet"][0][19].toString())),
          DataCell(Text(json[i]["rowSet"][0][20].toString())),
          DataCell(Text(json[i]["rowSet"][0][21].toString())),
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
        DataColumn(label: Text('G')),
        DataColumn(label: Text('W')),
        DataColumn(label: Text('L')),
        DataColumn(label: Text('W %')),
        DataColumn(label: Text('Min')),
        DataColumn(label: Text('2 FGA %')),
        DataColumn(label: Text('3 FGA %')),
        DataColumn(label: Text('2 Pts %')),
        DataColumn(label: Text('2 Pts MR %')),
        DataColumn(label: Text('3 Pts %')),
        DataColumn(label: Text('Pts FB %')),
        DataColumn(label: Text('Pts FT %')),
        DataColumn(label: Text('Pts TO %')),
        DataColumn(label: Text('Pts Paint %')),
        DataColumn(label: Text('Ast 2PM %')),
        DataColumn(label: Text('UAst 2PM %')),
        DataColumn(label: Text('Ast 3PM %')),
        DataColumn(label: Text('UAst 3PM %')),
        DataColumn(label: Text('Ast FGM %')),
        DataColumn(label: Text('UAst FGM %')),
      ],
      rows: [
        ...rows,
      ],
    );
  }
}
