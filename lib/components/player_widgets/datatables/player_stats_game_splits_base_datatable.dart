import 'package:flutter/material.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';

class PlayerStatsGameSplitsBaseDataTable extends StatelessWidget {
  final dynamic json;

  PlayerStatsGameSplitsBaseDataTable({this.json});

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
          DataCell(Text(json[i]["rowSet"][j][19].toString())),
          DataCell(Text(json[i]["rowSet"][j][20].toString())),
          DataCell(Text(json[i]["rowSet"][j][21].toString())),
          DataCell(Text(json[i]["rowSet"][j][22].toString())),
          DataCell(Text(json[i]["rowSet"][j][23].toString())),
          DataCell(Text(json[i]["rowSet"][j][24].toString())),
          DataCell(Text(json[i]["rowSet"][j][25].toString())),
          DataCell(Text(json[i]["rowSet"][j][26].toString())),
          DataCell(Text(json[i]["rowSet"][j][27].toString())),
          DataCell(Text(json[i]["rowSet"][j][29].toString())),
          DataCell(Text(json[i]["rowSet"][j][30].toString())),
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
        DataColumn(label: StatInfoDialog(label: Text('G'), statName: "GP")),
        DataColumn(
            label: StatInfoDialog(
          label: Text('W'),
          statName: "W",
        )),
        DataColumn(
            label: StatInfoDialog(
          label: Text('L'),
          statName: "L",
        )),
        DataColumn(
            label: StatInfoDialog(label: Text('W %'), statName: "Win %")),
        DataColumn(label: StatInfoDialog(label: Text('Min'), statName: "MIN")),
        DataColumn(label: StatInfoDialog(label: Text('FGM'), statName: "FGM")),
        DataColumn(label: StatInfoDialog(label: Text('FGA'), statName: "FGA")),
        DataColumn(
            label: StatInfoDialog(label: Text('FG %'), statName: "FG %")),
        DataColumn(label: StatInfoDialog(label: Text('3PM'), statName: "3PM")),
        DataColumn(label: StatInfoDialog(label: Text('3PA'), statName: "3PA")),
        DataColumn(
            label: StatInfoDialog(label: Text('3P %'), statName: "3P %")),
        DataColumn(label: StatInfoDialog(label: Text('FTM'), statName: "FTM")),
        DataColumn(label: StatInfoDialog(label: Text('FTA'), statName: "FTA")),
        DataColumn(
            label: StatInfoDialog(label: Text('FT %'), statName: "FT %")),
        DataColumn(
            label: StatInfoDialog(label: Text('OREB'), statName: "OREB")),
        DataColumn(
            label: StatInfoDialog(label: Text('DREB'), statName: "DREB")),
        DataColumn(label: StatInfoDialog(label: Text('REB'), statName: "REB")),
        DataColumn(label: StatInfoDialog(label: Text('AST'), statName: "AST")),
        DataColumn(label: StatInfoDialog(label: Text('TOV'), statName: "TOV")),
        DataColumn(label: StatInfoDialog(label: Text('STL'), statName: "STL")),
        DataColumn(label: StatInfoDialog(label: Text('BLK'), statName: "BLK")),
        DataColumn(
            label: StatInfoDialog(label: Text('BLKA'), statName: "BLKA")),
        DataColumn(label: StatInfoDialog(label: Text('PF'), statName: "PF")),
        DataColumn(label: StatInfoDialog(label: Text('PFD'), statName: "PFD")),
        DataColumn(label: StatInfoDialog(label: Text('PTS'), statName: "PTS")),
        DataColumn(
            label: StatInfoDialog(label: Text('+/-'), statName: "PLUSMINUS")),
        DataColumn(label: StatInfoDialog(label: Text('DD2'), statName: "DD2")),
        DataColumn(label: StatInfoDialog(label: Text('TD3'), statName: "TD3")),
      ],
      rows: [
        ...rows,
      ],
    );
  }
}
