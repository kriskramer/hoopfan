import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/game_player_popup.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';
import 'package:hoop/models/game_data.dart';

class GameBoxScoreSummary extends StatelessWidget {
  final GameData game;
  final bool isHomeTeam;

  GameBoxScoreSummary({this.game, this.isHomeTeam});

  @override
  Widget build(BuildContext context) {
    if (game == null) {
      return Center(
        child: Text("No data available..."),
      );
    }
    Widget c;
    String vTeamId = game.awayTeam.teamId.toString();
    String hTeamId = game.homeTeam.teamId.toString();
    List<dynamic> vTeamPlayers = [];
    List<dynamic> hTeamPlayers = [];

    if (isHomeTeam) {
      // Loop through players and assign to teams
      for (var p in game.homeTeam.players.players) {
        hTeamPlayers.add(p);
      }

      // Have to do the try/catch on the sort because some players have no values if they're marked as DNP
      hTeamPlayers.sort((a, b) {
        try {
          return int.parse(a.statistics.points) < int.parse(b.statistics.points)
              ? 1
              : -1;
        } catch (e) {
          //print(e);
          return -1;
        }
      });
    } else {
      // Loop through players and assign to teams
      for (var p in game.awayTeam.players.players) {
        vTeamPlayers.add(p);
      }

      // Have to do the try/catch on the sort because some players have no values if they're marked as DNP
      vTeamPlayers.sort((a, b) {
        try {
          return int.parse(a.statistics.points) < int.parse(b.statistics.points)
              ? 1
              : -1;
        } catch (e) {
          //print(e);
          return -1;
        }
      });
    }

    c = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isHomeTeam
            ? getPlayerNamesDataTable(hTeamPlayers, context)
            : getPlayerNamesDataTable(vTeamPlayers, context),
        isHomeTeam
            ? getDataTable(hTeamPlayers, context)
            : getDataTable(vTeamPlayers, context),
      ],
    );

    return c;
  }

  Widget getPlayerNamesDataTable(List<dynamic> players, BuildContext ctx) {
    List<DataRow> rows = [];

    for (var p in players) {
      rows.add(
        DataRow(cells: [
          DataCell(Text(p.familyName), onTap: () {
            // Navigator.push(
            //   ctx,
            //   MaterialPageRoute(
            //     //
            //     builder: (context) => GamePlayerShotChart(
            //         p.personId, p.teamId, game.gameId),
            //   ),
            // );
            showDialog(
                context: ctx,
                builder: (context) {
                  return GamePlayerPopup(personId: p.personId, game: game);
                });
          }),
        ]),
      );
    }

    return DataTable(
      columnSpacing: 1,
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
        DataColumn(label: Text('Name')),
      ],
      rows: rows,
    );
  }

  Widget getDataTable(List<dynamic> players, BuildContext ctx) {
    List<DataRow> rows = [];

    for (var p in players) {
      rows.add(
        DataRow(cells: [
          DataCell(
            Text(p.jerseyNum),
          ),
          DataCell(Row(children: [
            p.oncourt == "1"
                ? CircleAvatar(
                    backgroundColor: Colors.green,
                    minRadius: 4,
                  )
                : Text(''),
            Text(p.position == null ? "" : p.position.toString())
          ])),
          DataCell(Text(getMinutesFormatted(p.statistics.minutes))),
          DataCell(Center(
            child: Text(
              p.statistics.points.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          DataCell(Center(child: Text(p.statistics.fieldGoalsMade.toString()))),
          DataCell(
              Center(child: Text(p.statistics.fieldGoalsAttempted.toString()))),
          DataCell(Center(
            child: Text(
              p.statistics.fieldGoalsPercentage.toStringAsFixed(2) + "%",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          DataCell(Center(child: VerticalDivider())),
          DataCell(
              Center(child: Text(p.statistics.twoPointersMade.toString()))),
          DataCell(Center(
              child: Text(p.statistics.twoPointersAttempted.toString()))),
          DataCell(Center(
            child: Text(
              p.statistics.twoPointersPercentage.toStringAsFixed(2) + "%",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          DataCell(Center(child: VerticalDivider())),
          DataCell(
              Center(child: Text(p.statistics.threePointersMade.toString()))),
          DataCell(Center(
              child: Text(p.statistics.threePointersAttempted.toString()))),
          DataCell(Center(
            child: Text(
              p.statistics.threePointersPercentage.toStringAsFixed(2) + "%",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          DataCell(Center(child: VerticalDivider())),
          DataCell(Center(child: Text(p.statistics.freeThrowsMade.toString()))),
          DataCell(
              Center(child: Text(p.statistics.freeThrowsAttempted.toString()))),
          DataCell(Center(
            child: Text(
              p.statistics.freeThrowsPercentage.toStringAsFixed(2) + "%",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          DataCell(Center(child: VerticalDivider())),
          DataCell(Center(child: Text(p.statistics.assists.toString()))),
          DataCell(Center(child: Text(p.statistics.turnovers.toString()))),
          DataCell(Center(child: Text(p.statistics.steals.toString()))),
          DataCell(Center(child: Text(p.statistics.blocks.toString()))),
          DataCell(
              Center(child: Text(p.statistics.reboundsOffensive.toString()))),
          DataCell(
              Center(child: Text(p.statistics.reboundsDefensive.toString()))),
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
          DataCell(Center(child: Text(getTrueShootingAttempts(p)))),
          DataCell(Center(child: Text(getTrueShootingPercentage(p) + "%"))),
          DataCell(Center(child: Text(getEffectiveFG(p) + "%"))),
          DataCell(Text(p.status)),
        ]),
      );
    }

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 10,
          horizontalMargin: 5,
          dataRowHeight: 28,
          headingRowHeight: 30,
          headingTextStyle:
              TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
          headingRowColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return Colors.grey[300]; // Use the default value.
          }),
          columns: [
            DataColumn(label: Text('#')),
            //DataColumn(label: Text('Name')),
            DataColumn(
                label: StatInfoDialog(label: Text('Pos'), statName: "POS")),
            DataColumn(
                label: StatInfoDialog(label: Text('Min'), statName: "MIN")),
            DataColumn(
                label: StatInfoDialog(label: Text('Pts'), statName: "PTS")),
            DataColumn(
                label: StatInfoDialog(label: Text('FGM'), statName: "FGM")),
            DataColumn(
                label: StatInfoDialog(label: Text('FGA'), statName: "FGA")),
            DataColumn(
                label: StatInfoDialog(label: Text('FG %'), statName: "FG%")),
            DataColumn(label: Text('')),
            DataColumn(
                label: StatInfoDialog(label: Text('2PM'), statName: "2PM")),
            DataColumn(
                label: StatInfoDialog(label: Text('2PA'), statName: "2PA")),
            DataColumn(
                label: StatInfoDialog(label: Text('2P %'), statName: "2P%")),
            DataColumn(label: Text('')),
            DataColumn(
                label: StatInfoDialog(label: Text('3PM'), statName: "3PM")),
            DataColumn(
                label: StatInfoDialog(label: Text('3PA'), statName: "3PA")),
            DataColumn(
                label: StatInfoDialog(label: Text('3P %'), statName: "3P%")),
            DataColumn(label: Text('')),
            DataColumn(
                label: StatInfoDialog(label: Text('FTM'), statName: "FTM")),
            DataColumn(
                label: StatInfoDialog(label: Text('FTA'), statName: "FTA")),
            DataColumn(
                label: StatInfoDialog(label: Text('FT %'), statName: "FT%")),
            DataColumn(label: Text('')),
            DataColumn(
                label: StatInfoDialog(label: Text('Asts'), statName: "AST")),
            DataColumn(
                label: StatInfoDialog(label: Text('TO'), statName: "TOV")),
            DataColumn(
                label: StatInfoDialog(label: Text('Stls'), statName: "STL")),
            DataColumn(
                label: StatInfoDialog(label: Text('Blks'), statName: "BLK")),
            DataColumn(
                label: StatInfoDialog(label: Text('OReb'), statName: "OREB")),
            DataColumn(
                label: StatInfoDialog(label: Text('DReb'), statName: "DREB")),
            DataColumn(
                label: StatInfoDialog(label: Text('TReb'), statName: "REB")),
            DataColumn(
                label: StatInfoDialog(label: Text('PF'), statName: "PF")),
            DataColumn(
                label: StatInfoDialog(label: Text('+/-'), statName: "+/-")),
            DataColumn(
                label: StatInfoDialog(label: Text('TSA'), statName: "TSA")),
            DataColumn(
                label: StatInfoDialog(label: Text('TS %'), statName: "TS%")),
            DataColumn(
                label: StatInfoDialog(label: Text('eFG %'), statName: "EFG%")),
            DataColumn(
                label: StatInfoDialog(label: Text('Status'), statName: "DNP")),
          ],
          rows: rows,
        ),
      ),
    );
  }

  String getTrueShootingAttempts(dynamic player) {
    if (player.status == "ACTIVE") {
      int fga = player.statistics.fieldGoalsAttempted;
      int fta = player.statistics.freeThrowsAttempted;

      double tsa = fga + (0.44 * fta);

      if (tsa.toString() == "NaN") {
        tsa = 0;
      }

      return tsa.toStringAsFixed(2);
    } else {
      return "";
    }
  }

  String getTrueShootingPercentage(dynamic player) {
    if (player.status == "ACTIVE") {
      int points = player.statistics.points;
      int fga = player.statistics.fieldGoalsAttempted;
      int fta = player.statistics.freeThrowsAttempted;
      double tsa = fga + (0.44 * fta);
      double tsp = points / (2 * tsa);

      if (tsp.toString() == "NaN") {
        tsp = 0;
      }

      return tsp.toStringAsFixed(2);
    } else {
      return "0.00";
    }
  }

  String getEffectiveFG(dynamic player) {
    if (player.status == "ACTIVE") {
      int fgm = player.statistics.fieldGoalsMade;
      int fga = player.statistics.fieldGoalsAttempted;
      int tpm = player.statistics.threePointersMade;
      double efg = (fgm + (tpm * 0.5)) / fga;

      if (efg.toString() == "NaN") {
        efg = 0;
      }

      return efg.toStringAsFixed(2);
    } else {
      return "0.00";
    }
  }

  String get2PA(dynamic player) {
    if (player.status == "ACTIVE") {
      int fga =
          int.parse(player.statistics.fga == "" ? 0 : player.statistics.fga);
      int tpa =
          int.parse(player.statistics.tpa == "" ? 0 : player.statistics.tpa);
      int twopa = fga - tpa;

      return twopa.toString();
    } else {
      return "";
    }
  }

  String get2PM(dynamic player) {
    if (player.status == "ACTIVE") {
      int fgm =
          int.parse(player.statistics.fgm == "" ? 0 : player.statistics.fgm);
      int tpm =
          int.parse(player.statistics.tpm == "" ? 0 : player.statistics.tpm);
      int twopm = fgm - tpm;

      return twopm.toString();
    } else {
      return "";
    }
  }

  String get2PPct(dynamic player) {
    var m = get2PM(player);
    var a = get2PA(player);

    if (m == "" || a == "") {
      return "";
    } else {
      int m1 = int.parse(m);
      int a1 = int.parse(a);
      double p = (m1 / a1);

      if (p.toString() == "NaN") {
        p = 0;
      }
      return p.toStringAsFixed(2) + "%";
    }
  }

  String getMinutesFormatted(String minutes) {
    String c = minutes
        .replaceAll("PT", "")
        .replaceAll("M", ":")
        .replaceAll("S", "")
        //.replaceAll("00:", "")
        .replaceAll(".00", "");
    int idx = c.indexOf(".");
    if (idx > 0) c = c.substring(0, c.indexOf("."));
    return c;
  }
}
