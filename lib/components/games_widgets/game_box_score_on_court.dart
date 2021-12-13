import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/game_player_shot_chart.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';

class GameBoxScoreOnCourt extends StatelessWidget {
  final dynamic game;
  final dynamic stats;
  final bool isHomeTeam;

  GameBoxScoreOnCourt({this.game, this.stats, this.isHomeTeam});

  @override
  Widget build(BuildContext context) {
    String vTeamId = game["vTeam"]["teamId"];
    String hTeamId = game["hTeam"]["teamId"];
    dynamic players = stats["activePlayers"];
    List<dynamic> vTeamPlayers = [];
    List<dynamic> hTeamPlayers = [];

    if (isHomeTeam) {
      // Loop through players and assign to teams
      for (var p in players) {
        if (p["teamId"] == hTeamId && p["isOnCourt"]) {
          hTeamPlayers.add(p);
        }
      }

      // Have to do the try/catch on the sort because some players have no values if they're marked as DNP
      hTeamPlayers.sort((a, b) {
        try {
          return int.parse(a["points"]) < int.parse(b["points"]) ? 1 : -1;
        } catch (e) {
          //print(e);
          return -1;
        }
      });
    } else {
      // Loop through players and assign to teams
      for (var p in players) {
        if (p["teamId"] == vTeamId && p["isOnCourt"]) {
          vTeamPlayers.add(p);
        }
      }

      // Have to do the try/catch on the sort because some players have no values if they're marked as DNP
      vTeamPlayers.sort((a, b) {
        try {
          return int.parse(a["points"]) < int.parse(b["points"]) ? 1 : -1;
        } catch (e) {
          //print(e);
          return -1;
        }
      });
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isHomeTeam
            ? getDataTable(hTeamPlayers, context)
            : getDataTable(vTeamPlayers, context),
      ],
    );
  }

  Widget getDataTable(List<dynamic> players, BuildContext ctx) {
    List<DataRow> rows = [];

    for (var p in players) {
      rows.add(
        DataRow(cells: [
          DataCell(Container(width: 125, child: Text(p["lastName"])),
              onTap: () {
            Navigator.push(
              ctx,
              MaterialPageRoute(
                builder: (context) => GamePlayerShotChart(
                    p["personId"], p["teamId"], game["gameId"]),
              ),
            );
          }),
          DataCell(Center(
            child: Text(
              p["points"],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          DataCell(Center(child: Text(p["assists"]))),
          DataCell(Center(child: Text(p["turnovers"]))),
          DataCell(Center(
            child: Text(
              p["totReb"],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          DataCell(Center(child: Text(p["pFouls"]))),
          DataCell(Center(
            child: Text(
              p["plusMinus"],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
        ]),
      );
    }

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 10,
          horizontalMargin: 5,
          dataRowHeight: 24,
          headingRowHeight: 24,
          headingTextStyle:
              TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
          columns: [
            DataColumn(label: Text('Name')),
            DataColumn(
                label: StatInfoDialog(label: Text('Pts'), statName: "PTS")),
            DataColumn(
                label: StatInfoDialog(label: Text('Ast'), statName: "AST")),
            DataColumn(
                label: StatInfoDialog(label: Text('TO'), statName: "TOV")),
            DataColumn(
                label: StatInfoDialog(label: Text('Reb'), statName: "REB")),
            DataColumn(
                label: StatInfoDialog(label: Text('PF'), statName: "PF")),
            DataColumn(
                label: StatInfoDialog(label: Text('+/-'), statName: "+/-")),
          ],
          rows: rows,
        ),
      ),
    );
  }
}
