import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/players/player_detail.dart';

class GameBoxScore extends StatelessWidget {
  final dynamic game;
  final dynamic stats;
  final bool isHomeTeam;

  GameBoxScore({this.game, this.stats, this.isHomeTeam});

  @override
  Widget build(BuildContext context) {
    Widget c;
    dynamic vTeam = stats["vTeam"]["leaders"];
    dynamic hTeam = stats["hTeam"]["leaders"];
    String vTeamId = game["vTeam"]["teamId"];
    String hTeamId = game["hTeam"]["teamId"];
    String vTeamName = ConstantHelper.getTeamName(game["vTeam"]["teamId"]);
    String hTeamName = ConstantHelper.getTeamName(game["hTeam"]["teamId"]);
    dynamic players = stats["activePlayers"];
    List<dynamic> vTeamPlayers = new List<dynamic>();
    List<dynamic> hTeamPlayers = new List<dynamic>();

    if (isHomeTeam) {
      // Loop through players and assign to teams
      for (var p in players) {
        if (p["teamId"] == hTeamId) {
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
        if (p["teamId"] == vTeamId) {
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

    c = Column(
      children: [
        isHomeTeam
            ? getDataTable(hTeamPlayers, context)
            : getDataTable(vTeamPlayers, context),
      ],
    );

    return c;
  }

  Widget getDataTable(List<dynamic> players, BuildContext ctx) {
    List<DataRow> rows = new List<DataRow>();

    for (var p in players) {
      rows.add(
        DataRow(cells: [
          DataCell(Row(children: [
            Text(p["jersey"]),
          ])),
          DataCell(Text(p["lastName"]), onTap: () {
            Navigator.push(
              ctx,
              MaterialPageRoute(
                builder: (context) => PlayerDetail(
                  playerId: p["personId"],
                ),
              ),
            );
          }),
          DataCell(Row(children: [
            p["isOnCourt"]
                ? CircleAvatar(
                    backgroundColor: Colors.green,
                    minRadius: 4,
                  )
                : Text(''),
            Text(p["pos"])
          ])),
          DataCell(Text(p["min"])),
          DataCell(Text(
            p["points"],
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(p["fga"])),
          DataCell(Text(p["fgm"])),
          DataCell(Text(
            p["fgp"],
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(p["fta"])),
          DataCell(Text(p["ftm"])),
          DataCell(Text(
            p["ftp"],
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(p["tpa"])),
          DataCell(Text(p["tpm"])),
          DataCell(Text(
            p["tpp"],
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(p["assists"])),
          DataCell(Text(p["turnovers"])),
          DataCell(Text(p["steals"])),
          DataCell(Text(p["blocks"])),
          DataCell(Text(p["offReb"])),
          DataCell(Text(p["defReb"])),
          DataCell(Text(
            p["totReb"],
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(p["pFouls"])),
          DataCell(Text(
            p["plusMinus"],
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(p["dnp"])),
        ]),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 10,
        dataRowHeight: 28,
        columns: [
          DataColumn(label: Text('#')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Pos')),
          DataColumn(label: Text('Min')),
          DataColumn(label: Text('Pts')),
          DataColumn(label: Text('FGa')),
          DataColumn(label: Text('FGm')),
          DataColumn(label: Text('FG %')),
          DataColumn(label: Text('FTa')),
          DataColumn(label: Text('FTm')),
          DataColumn(label: Text('FT %')),
          DataColumn(label: Text('3Pa')),
          DataColumn(label: Text('3Pm')),
          DataColumn(label: Text('3P %')),
          DataColumn(label: Text('Asts')),
          DataColumn(label: Text('TO')),
          DataColumn(label: Text('Stls')),
          DataColumn(label: Text('Blks')),
          DataColumn(label: Text('OReb')),
          DataColumn(label: Text('DReb')),
          DataColumn(label: Text('TReb')),
          DataColumn(label: Text('PF')),
          DataColumn(label: Text('+/-')),
          DataColumn(label: Text('DNP')),
        ],
        rows: rows,
      ),
    );
  }
}
