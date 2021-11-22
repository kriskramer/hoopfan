import 'package:flutter/material.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';

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
        DataColumn(label: Text('eORtg')),
        DataColumn(
            label: StatInfoDialog(label: Text('ORtg'), statName: "ORtg")),
        DataColumn(label: Text('eDRtg')),
        DataColumn(
            label: StatInfoDialog(label: Text('DRtg'), statName: "DRtg")),
        DataColumn(label: Text('eNet')),
        DataColumn(label: StatInfoDialog(label: Text('Net'), statName: "NET")),
        DataColumn(
            label: StatInfoDialog(label: Text('Ast %'), statName: "AST %")),
        DataColumn(
            label: StatInfoDialog(label: Text('Ast/Tov'), statName: "AST/TO")),
        DataColumn(
            label:
                StatInfoDialog(label: Text('Ast Rto'), statName: "AST RATIO")),
        DataColumn(
            label: StatInfoDialog(label: Text('OReb %'), statName: "OReb %")),
        DataColumn(
            label: StatInfoDialog(label: Text('DReb %'), statName: "DReb %")),
        DataColumn(
            label: StatInfoDialog(label: Text('Reb %'), statName: "REB %")),
        DataColumn(
            label:
                StatInfoDialog(label: Text('Tm Tov %'), statName: "TM TOV %")),
        DataColumn(label: Text('eTO %')),
        DataColumn(
            label: StatInfoDialog(label: Text('eFG %'), statName: "eFG %")),
        DataColumn(
            label: StatInfoDialog(label: Text('TS %'), statName: "TS %")),
        DataColumn(
            label: StatInfoDialog(label: Text('Usg %'), statName: "USG%")),
        DataColumn(
            label: StatInfoDialog(label: Text('ePace'), statName: "ePace")),
        DataColumn(
            label: StatInfoDialog(label: Text('Pace'), statName: "PACE")),
        DataColumn(
            label: StatInfoDialog(label: Text('Pace/40'), statName: "Pace/40")),
        DataColumn(label: StatInfoDialog(label: Text('Pie'), statName: "PIE")),
        DataColumn(
            label: StatInfoDialog(label: Text('Poss'), statName: "POSS")),
      ],
      rows: [
        ...rows,
      ],
    );
  }
}
