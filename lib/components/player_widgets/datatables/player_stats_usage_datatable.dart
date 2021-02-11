import 'package:flutter/material.dart';

class PlayerStatsUsageDataTable extends StatelessWidget {
  final dynamic json;

  PlayerStatsUsageDataTable({this.json});

  @override
  Widget build(BuildContext context) {
    List<DataRow> rows = List<DataRow>();

    for (int i = 0; i < json.length; i++) {
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
        DataCell(Text(json[i]["rowSet"][0][22].toString())),
        DataCell(Text(json[i]["rowSet"][0][23].toString())),
        DataCell(Text(json[i]["rowSet"][0][24].toString())),
      ]));
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
        DataColumn(label: Text('Usage %')),
        DataColumn(label: Text('FGM %')),
        DataColumn(label: Text('FGA %')),
        DataColumn(label: Text('3PM %')),
        DataColumn(label: Text('3PA %')),
        DataColumn(label: Text('FTM %')),
        DataColumn(label: Text('FTA %')),
        DataColumn(label: Text('OReb %')),
        DataColumn(label: Text('DReb %')),
        DataColumn(label: Text('Reb %')),
        DataColumn(label: Text('Ast %')),
        DataColumn(label: Text('TO %')),
        DataColumn(label: Text('Stl %')),
        DataColumn(label: Text('Blk %')),
        DataColumn(label: Text('BlkA %')),
        DataColumn(label: Text('PF %')),
        DataColumn(label: Text('PFD %')),
        DataColumn(label: Text('Pts %')),
      ],
      rows: [
        ...rows,
      ],
    );
  }
}
