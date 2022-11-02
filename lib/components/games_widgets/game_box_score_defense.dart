import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/models/box_scores/game_box_score_defense.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class GameBoxScoreDefense extends StatefulWidget {
  final String gameId;
  final String teamId;

  GameBoxScoreDefense({this.gameId, this.teamId});

  @override
  _GameBoxScoreDefenseState createState() => _GameBoxScoreDefenseState();
}

class _GameBoxScoreDefenseState extends State<GameBoxScoreDefense> {
  GameBoxScoreDefenseList list;

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
          list = new GameBoxScoreDefenseList(json, widget.teamId);
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

  DataTable getDataTable(GameBoxScoreDefenseList list) {
    List<DataRow> rows = [];

    for (var p in list.items) {
      rows.add(DataRow(cells: [
        DataCell(Text(p.playerName)),
        DataCell(Text(p.MATCHUP_MIN.toString())),
        DataCell(Text(p.PARTIAL_POSS.toStringAsFixed(2))),
        DataCell(Text(p.SWITCHES_ON.toString())),
        DataCell(Text(p.PLAYER_PTS.toString())),
        DataCell(Text(p.DREB.toString())),
        DataCell(Text(p.MATCHUP_AST.toString())),
        DataCell(Text(p.MATCHUP_TOV.toString())),
        DataCell(Text(p.STL.toString())),
        DataCell(Text(p.BLK.toString())),
        DataCell(Text(p.MATCHUP_FGM.toString())),
        DataCell(Text(p.MATCHUP_FGA.toString())),
        DataCell(Text(p.MATCHUP_FG_PCT.toStringAsFixed(2))),
        DataCell(Text(p.MATCHUP_FG3M.toString())),
        DataCell(Text(p.MATCHUP_FG3A.toString())),
        DataCell(Text(p.MATCHUP_FG3_PCT.toStringAsFixed(2))),
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
        DataColumn(label: Text('MU Min')),
        DataColumn(label: Text('Partial Poss')),
        DataColumn(label: Text('Switches')),
        DataColumn(label: Text('Pts')),
        DataColumn(label: Text('DReb')),
        DataColumn(label: Text('MU Ast')),
        DataColumn(label: Text('MU TO')),
        DataColumn(label: Text('Stls')),
        DataColumn(label: Text('Blks')),
        DataColumn(label: Text('MU FGM')),
        DataColumn(label: Text('MU FGA')),
        DataColumn(label: Text('MU FG %')),
        DataColumn(label: Text('MU 3PM')),
        DataColumn(label: Text('MU 3PA')),
        DataColumn(label: Text('MU 3P %')),
      ],
      rows: [
        ...rows,
      ],
    );
  }

  Future<dynamic> loadData() async {
    return await Network.getJson(
      Urls.getNbaStatsBoxScoreDefensive(widget.gameId),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );
  }
}
