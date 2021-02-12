import 'package:flutter/material.dart';

import '../player_game_log.dart';

class PlayerStatsSummaryDataTable extends StatelessWidget {
  final dynamic summary;
  final dynamic seasons;
  final String teamId;
  final String playerId;

  PlayerStatsSummaryDataTable(
      {this.summary, this.seasons, this.teamId, this.playerId});

  @override
  Widget build(BuildContext context) {
    var table;
    List<DataRow> rows = new List<DataRow>();

    // Generate summary row
    rows.add(DataRow(cells: [
      DataCell(Text(
        "Career",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["min"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["ppg"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["rpg"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["apg"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["spg"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["bpg"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["fgm"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["fga"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["fgp"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["ftm"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["fta"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["ftp"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["tpm"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["tpa"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["tpp"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["plusMinus"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["points"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["offReb"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["defReb"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["totReb"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["assists"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["blocks"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["steals"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Text(
        summary["turnovers"],
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    ]));

    // Generate a row for each season
    for (int i = 0; i < seasons["season"].length; i++) {
      var s = seasons["season"][i];
      rows.add(DataRow(cells: [
        DataCell(Text(s["seasonYear"].toString()), onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayerGameLogTable(
                  playerId: playerId,
                  season: s["seasonYear"].toString(),
                  teamId: teamId),
            ),
          );
        }),
        DataCell(Text(s["total"]["min"])),
        DataCell(Text(s["total"]["ppg"])),
        DataCell(Text(s["total"]["rpg"])),
        DataCell(Text(s["total"]["apg"])),
        DataCell(Text(s["total"]["spg"])),
        DataCell(Text(s["total"]["bpg"])),
        DataCell(Text(s["total"]["fgm"])),
        DataCell(Text(s["total"]["fga"])),
        DataCell(Text(s["total"]["fgp"])),
        DataCell(Text(s["total"]["ftm"])),
        DataCell(Text(s["total"]["fta"])),
        DataCell(Text(s["total"]["ftp"])),
        DataCell(Text(s["total"]["tpm"])),
        DataCell(Text(s["total"]["tpa"])),
        DataCell(Text(s["total"]["tpp"])),
        DataCell(Text(s["total"]["plusMinus"])),
        DataCell(Text(s["total"]["points"])),
        DataCell(Text(s["total"]["offReb"])),
        DataCell(Text(s["total"]["defReb"])),
        DataCell(Text(s["total"]["totReb"])),
        DataCell(Text(s["total"]["assists"])),
        DataCell(Text(s["total"]["blocks"])),
        DataCell(Text(s["total"]["steals"])),
        DataCell(Text(s["total"]["turnovers"])),
      ]));
    }

    table = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
          columnSpacing: 14,
          dataRowHeight: 30,
          headingRowHeight: 30,
          headingTextStyle:
              TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
          headingRowColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return Colors.grey[300]; // Use the default value.
          }),
          columns: [
            DataColumn(label: Text("Year")),
            DataColumn(label: Text("MIN")),
            DataColumn(label: Text("PPG")),
            DataColumn(label: Text("RPG")),
            DataColumn(label: Text("APG")),
            DataColumn(label: Text("SPG")),
            DataColumn(label: Text("BPG")),
            DataColumn(label: Text("FGM")),
            DataColumn(label: Text("FGA")),
            DataColumn(label: Text("FG%")),
            DataColumn(label: Text("FTM")),
            DataColumn(label: Text("FTA")),
            DataColumn(label: Text("FT%")),
            DataColumn(label: Text("3PM")),
            DataColumn(label: Text("3PA")),
            DataColumn(label: Text("3P%")),
            DataColumn(label: Text("+/-")),
            DataColumn(label: Text("Pts")),
            DataColumn(label: Text("Off Reb")),
            DataColumn(label: Text("Def Reb")),
            DataColumn(label: Text("Tot Reb")),
            DataColumn(label: Text("Asts")),
            DataColumn(label: Text("Blks")),
            DataColumn(label: Text("Stls")),
            DataColumn(label: Text("TOs")),
          ],
          rows: rows),
    );

    return table;
  }
}
