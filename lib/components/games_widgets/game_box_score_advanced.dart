import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';
import 'package:hoop/models/box_scores/game_box_score_advanced.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class GameBoxScoreAdvanced extends StatefulWidget {
  final String gameId;
  final String teamId;

  GameBoxScoreAdvanced({this.gameId, this.teamId});

  @override
  _GameBoxScoreAdvancedState createState() => _GameBoxScoreAdvancedState();
}

class _GameBoxScoreAdvancedState extends State<GameBoxScoreAdvanced> {
  GameBoxScoreAdvancedList list;

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
          list = new GameBoxScoreAdvancedList(json, widget.teamId);
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

  DataTable getDataTable(GameBoxScoreAdvancedList list) {
    List<DataRow> rows = [];

    for (var p in list.items) {
      rows.add(DataRow(cells: [
        DataCell(Text(p.PLAYER_NAME)),
        //DataCell(Text(p.MIN)),
        DataCell(Text(p.OFF_RATING.toStringAsFixed(2))),
        DataCell(Text(p.DEF_RATING.toStringAsFixed(2))),
        DataCell(Text(p.NET_RATING.toStringAsFixed(2))),
        DataCell(Text(p.AST_PCT.toStringAsFixed(2))),
        DataCell(Text(p.AST_TOV.toStringAsFixed(2))),
        DataCell(Text(p.AST_RATIO.toStringAsFixed(2))),
        DataCell(Text(p.OREB_PCT.toStringAsFixed(2))),
        DataCell(Text(p.DREB_PCT.toStringAsFixed(2))),
        DataCell(Text(p.REB_PCT.toStringAsFixed(2))),
        DataCell(Text(p.TM_TOV_PCT.toStringAsFixed(2))),
        DataCell(Text(p.EFG_PCT.toStringAsFixed(2))),
        DataCell(Text(p.TS_PCT.toStringAsFixed(2))),
        DataCell(Text(p.USG_PCT.toStringAsFixed(2))),
        DataCell(Text(p.PACE.toStringAsFixed(2))),
        DataCell(Text(p.PACE_PER40.toStringAsFixed(2))),
        DataCell(Text(p.POSS.toString())),
        DataCell(Text(p.PIE.toStringAsFixed(2))),
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
        //DataColumn(label: Text('Min')),
        DataColumn(
            label: StatInfoDialog(label: Text('OffRtg'), statName: "ORTG")),
        DataColumn(
            label: StatInfoDialog(label: Text('DefRtg'), statName: "DRTG")),
        DataColumn(
            label: StatInfoDialog(label: Text('NetRtg'), statName: "NET")),
        DataColumn(
            label: StatInfoDialog(label: Text('Ast %'), statName: "AST %")),
        DataColumn(
            label: StatInfoDialog(label: Text('Ast/TO'), statName: "AST/TO")),
        DataColumn(
            label: StatInfoDialog(
                label: Text('Ast Ratio'), statName: "AST RATIO")),
        DataColumn(
            label: StatInfoDialog(label: Text('OReb %'), statName: "OREB %")),
        DataColumn(
            label: StatInfoDialog(label: Text('DReb %'), statName: "DREB %")),
        DataColumn(
            label: StatInfoDialog(label: Text('Reb %'), statName: "REB %")),
        DataColumn(
            label: StatInfoDialog(label: Text('Tm TO %'), statName: "TM TO %")),
        DataColumn(
            label: StatInfoDialog(label: Text('eFG %'), statName: "EFG%")),
        DataColumn(label: StatInfoDialog(label: Text('TS %'), statName: "TS%")),
        DataColumn(
            label: StatInfoDialog(label: Text('USG %'), statName: "USG%")),
        DataColumn(
            label: StatInfoDialog(label: Text('Pace'), statName: "PACE")),
        DataColumn(
            label: StatInfoDialog(label: Text('Pace/40'), statName: "PACE/40")),
        DataColumn(
            label: StatInfoDialog(label: Text('Poss'), statName: "POSS")),
        DataColumn(label: StatInfoDialog(label: Text('PIE'), statName: "PIE")),
      ],
      rows: [
        ...rows,
      ],
    );
  }

  Future<dynamic> loadData() async {
    return await Network.getJson(
      Urls.getNbaStatsBoxScoreAdvanced(widget.gameId),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );
  }
}
