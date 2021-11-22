import 'package:flutter/material.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';

class PlayerStatsMiscDataTable extends StatelessWidget {
  final dynamic json;

  PlayerStatsMiscDataTable({this.json});

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
        DataColumn(label: StatInfoDialog(label: Text('G'), statName: "GP")),
        DataColumn(label: StatInfoDialog(label: Text('W'), statName: "W")),
        DataColumn(label: StatInfoDialog(label: Text('L'), statName: "L")),
        DataColumn(
            label: StatInfoDialog(label: Text('W %'), statName: "Win %")),
        DataColumn(label: StatInfoDialog(label: Text('Min'), statName: "MIN")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Pts off Tov'), statName: "Pts off Tov")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Pts 2nd Ch'), statName: "Pts 2nd Chance")),
        DataColumn(
            label: StatInfoDialog(label: Text('Pts Fb'), statName: "Pts Fb")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Pts Paint'), statName: "Pts Paint")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Opp Pts off Tov'), statName: "Opp Pts off Tov")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Opp Pts 2nd Ch'), statName: "Opp Pts 2nd Ch")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Opp Pts Fb'), statName: "Opp Pts Fb")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Opp Pts Paint'), statName: "Opp Pts Paint")),
        DataColumn(label: StatInfoDialog(label: Text('BLK'), statName: "BLK")),
        DataColumn(
            label: StatInfoDialog(label: Text('BLKA'), statName: "BLKA")),
        DataColumn(label: StatInfoDialog(label: Text('PF'), statName: "PF")),
        DataColumn(label: StatInfoDialog(label: Text('PFD'), statName: "PFD")),
      ],
      rows: [
        ...rows,
      ],
    );
  }
}
