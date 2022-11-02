import 'package:flutter/material.dart';
import 'package:hoop/models/game_data.dart';

class QuarterScores extends StatelessWidget {
  final GameData game;

  QuarterScores({this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
      child: DataTable(
        headingRowHeight: 20,
        dataRowHeight: 24,
        columnSpacing: 10,
        columns: [
          DataColumn(label: Text('')),
          DataColumn(label: Text('1')),
          DataColumn(label: Text('2')),
          DataColumn(label: Text('3')),
          DataColumn(label: Text('4')),
          if (game.awayTeam.periods.periods.length > 4)
            DataColumn(label: Text('OT')),
          if (game.awayTeam.periods.periods.length > 5)
            DataColumn(label: Text('OT2')),
        ],
        rows: getQuarters(game),
        showBottomBorder: true,
      ),
    );
  }

  List<DataRow> getQuarters(GameData game) {
    List<DataRow> list = [];
    DataRow vList =
        new DataRow(cells: [DataCell(Text(game.awayTeam.teamTricode))]);
    DataRow hList =
        new DataRow(cells: [DataCell(Text(game.homeTeam.teamTricode))]);

    for (var q in game.awayTeam.periods.periods) {
      vList.cells.add(DataCell(Text(q.score.toString())));
    }

    for (var q in game.homeTeam.periods.periods) {
      hList.cells.add(DataCell(Text(q.score.toString())));
    }

    list.add(vList);
    list.add(hList);

    return list;
  }
}
