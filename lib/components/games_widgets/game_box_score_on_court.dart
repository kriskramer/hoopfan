import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/game_player_shot_chart.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';
import 'package:hoop/models/game_data.dart';

class GameBoxScoreOnCourt extends StatelessWidget {
  final GameData game;
  final bool isHomeTeam;

  GameBoxScoreOnCourt({this.game, this.isHomeTeam});

  @override
  Widget build(BuildContext context) {
    String vTeamId = game.awayTeam.teamId.toString();
    String hTeamId = game.homeTeam.teamId.toString();
    List<GamePlayer> vTeamPlayers = [];
    List<GamePlayer> hTeamPlayers = [];

    if (isHomeTeam) {
      // Loop through players and assign to teams
      for (var p in game.homeTeam.players.players) {
        if (p.oncourt == "1") {
          hTeamPlayers.add(p);
        }
      }

      // Have to do the try/catch on the sort because some players have no values if they're marked as DNP
      hTeamPlayers.sort((a, b) {
        try {
          return (a.statistics.points < b.statistics.points) ? 1 : -1;
        } catch (e) {
          //print(e);
          return -1;
        }
      });
    } else {
      // Loop through players and assign to teams
      for (var p in game.awayTeam.players.players) {
        if (p.oncourt == "1") {
          vTeamPlayers.add(p);
        }
      }

      // Have to do the try/catch on the sort because some players have no values if they're marked as DNP
      vTeamPlayers.sort((a, b) {
        try {
          return (a.statistics.points < b.statistics.points) ? 1 : -1;
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
            ? getDataTable(
                hTeamPlayers, game.homeTeam.teamId.toString(), context)
            : getDataTable(
                vTeamPlayers, game.awayTeam.teamId.toString(), context),
      ],
    );
  }

  Widget getDataTable(
      List<GamePlayer> players, String teamId, BuildContext ctx) {
    List<DataRow> rows = [];

    for (var p in players) {
      rows.add(
        DataRow(cells: [
          DataCell(Container(child: Text(p.familyName)), onTap: () {
            Navigator.push(
              ctx,
              MaterialPageRoute(
                builder: (context) =>
                    GamePlayerShotChart(p.personId, teamId, game.gameId),
              ),
            );
          }),
          DataCell(Center(
            child: Text(
              p.statistics.points.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          DataCell(Center(child: Text(p.statistics.assists.toString()))),
          DataCell(Center(child: Text(p.statistics.turnovers.toString()))),
          DataCell(Center(
            child: Text(
              p.statistics.reboundsTotal.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          DataCell(Center(child: Text(p.statistics.foulsPersonal.toString()))),
          DataCell(Center(
            child: Text(
              p.statistics.plusMinusPoints.toString(),
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
