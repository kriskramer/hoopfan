import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';
import 'package:hoop/models/box_scores/game_box_score_four_factors.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class GameBoxScoreFourFactors extends StatefulWidget {
  final String gameId;
  final String teamId;

  GameBoxScoreFourFactors({this.gameId, this.teamId});

  @override
  _GameBoxScoreFourFactorsState createState() =>
      _GameBoxScoreFourFactorsState();
}

class _GameBoxScoreFourFactorsState extends State<GameBoxScoreFourFactors> {
  GameBoxScoreFourFactorsList list;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasData) {
          return Column(children: [SizedBox(height: 20), Text('No data')]);
        }
        if (snapshot.hasData) {
          var json = snapshot.data["resultSets"][0]["rowSet"];
          list = new GameBoxScoreFourFactorsList(json, widget.teamId);
          //print(list.items.length.toString());
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: getDataTable(list),
          );
        } else {
          return NoConnection();
        }
      },
    ));
  }

  DataTable getDataTable(GameBoxScoreFourFactorsList list) {
    List<DataRow> rows = [];

    for (var p in list.items) {
      rows.add(DataRow(cells: [
        DataCell(Text(p.playerName)),
        DataCell(Text(p.eFgPct.toStringAsFixed(2))),
        DataCell(Text(p.OPP_eFgPct.toStringAsFixed(2))),
        DataCell(VerticalDivider(color: Colors.black)),
        getDiffDataCell(p.eFgPct, p.OPP_eFgPct),
        DataCell(VerticalDivider(color: Colors.black)),
        DataCell(Text(p.FTA_RATE.toStringAsFixed(2))),
        DataCell(Text(p.OPP_FTA_RATE.toStringAsFixed(2))),
        DataCell(VerticalDivider(color: Colors.black)),
        getDiffDataCell(p.FTA_RATE, p.OPP_FTA_RATE),
        DataCell(VerticalDivider(color: Colors.black)),
        DataCell(Text(p.tmTovPct.toStringAsFixed(2))),
        DataCell(Text(p.OPP_tmTovPct.toStringAsFixed(2))),
        DataCell(VerticalDivider(color: Colors.black)),
        getDiffDataCell(p.tmTovPct, p.OPP_tmTovPct),
        DataCell(VerticalDivider(color: Colors.black)),
        DataCell(Text(p.oRebPct.toStringAsFixed(2))),
        DataCell(Text(p.OPP_oRebPct.toStringAsFixed(2))),
        DataCell(VerticalDivider(color: Colors.black)),
        getDiffDataCell(p.oRebPct, p.OPP_oRebPct),
      ]));
    }

    return DataTable(
      columnSpacing: 8,
      horizontalMargin: 8,
      dataRowHeight: 30,
      headingRowHeight: 30,
      headingTextStyle:
          TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
      headingRowColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Colors.grey[300]; // Use the default value.
      }),
      columns: [
        DataColumn(label: Text('Player')),
        DataColumn(
            label: StatInfoDialog(label: Text('eFG %'), statName: "eFG %")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Opp eFG %'), statName: "Opp eFG %")),
        DataColumn(label: Text('')),
        DataColumn(label: Text('Diff')),
        DataColumn(label: Text('')),
        DataColumn(
            label:
                StatInfoDialog(label: Text('FTA Rate'), statName: "FTA Rate")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Opp FTA Rate'), statName: "Opp FTA")),
        DataColumn(label: Text('')),
        DataColumn(label: Text('Diff')),
        DataColumn(label: Text('')),
        DataColumn(
            label:
                StatInfoDialog(label: Text('TM TO Rate'), statName: "TM TOV")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Opp TM TO Rate'), statName: "Opp TM TOV")),
        DataColumn(label: Text('')),
        DataColumn(label: Text('Diff')),
        DataColumn(label: Text('')),
        DataColumn(
            label: StatInfoDialog(label: Text('OReb %'), statName: "OREB %")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Opp OReb %'), statName: "Opp OReb %")),
        DataColumn(label: Text('')),
        DataColumn(label: Text('Diff')),
      ],
      rows: [
        ...rows,
      ],
    );
  }

  Future<dynamic> loadData() async {
    return await Network.getJson(
      Urls.getNbaStatsBoxScoreFourFactors(widget.gameId),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );
  }

  DataCell getDiffDataCell(double value1, double value2) {
    double v3 = 0.0;

    v3 = value1 - value2;

    Widget c;

    v3 > 0
        ? c = Container(
            alignment: Alignment.center,
            width: 10,
            child: Icon(
              Icons.arrow_drop_up,
              color: Colors.green,
            ))
        : c = Container(
            alignment: Alignment.center,
            width: 10,
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.red,
            ));

    return DataCell(Row(children: [
      Text(v3.toStringAsFixed(2),
          style: TextStyle(fontWeight: FontWeight.w500)),
      c
    ]));
  }
}
