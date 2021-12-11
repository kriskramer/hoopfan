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
          print(list.items.length.toString());
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
        DataCell(Text(p.PLAYER_NAME)),
        DataCell(Text(p.EFG_PCT.toStringAsFixed(2))),
        DataCell(Text(p.FTA_RATE.toStringAsFixed(2))),
        DataCell(Text(p.TM_TOV_PCT.toStringAsFixed(2))),
        DataCell(Text(p.OREB_PCT.toStringAsFixed(2))),
        DataCell(Text(p.OPP_EFG_PCT.toStringAsFixed(2))),
        DataCell(Text(p.OPP_FTA_RATE.toStringAsFixed(2))),
        DataCell(Text(p.OPP_TM_TOV_PCT.toStringAsFixed(2))),
        DataCell(Text(p.OPP_OREB_PCT.toStringAsFixed(2))),
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
            label:
                StatInfoDialog(label: Text('FTA Rate'), statName: "FTA Rate")),
        DataColumn(
            label:
                StatInfoDialog(label: Text('TM TO Rate'), statName: "TM TOV")),
        DataColumn(
            label: StatInfoDialog(label: Text('OReb %'), statName: "OREB %")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Opp eFG %'), statName: "Opp eFG %")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Opp FTA Rate'), statName: "Opp FTA")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Opp TM TO Rate'), statName: "Opp TM TOV")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Opp OReb %'), statName: "Opp OReb %")),
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
}
