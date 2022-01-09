// import 'package:flutter/material.dart';
// //import 'package:hoop/components/games_widgets/game_player_popup.dart';
// import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';

// class SingleGameLog extends StatelessWidget {
//   final dynamic stats;
//   final String gameId;

//   SingleGameLog(this.stats, this.teamId);

//   @override
//   Widget build(BuildContext context) {
//     dynamic activePlayers = stats["activePlayers"];
//     List<dynamic> teamPlayers = [];

//       // Loop through players and assign to teams
//       for (var p in activePlayers) {
//         if (p["teamId"] == teamId) {
//           teamPlayers.add(p);
//         }
//       }

//       // Have to do the try/catch on the sort because some players have no values if they're marked as DNP
//       teamPlayers.sort((a, b) {
//         try {
//           return int.parse(a["points"]) < int.parse(b["points"]) ? 1 : -1;
//         } catch (e) {
//           //print(e);
//           return -1;
//         }
//       });

//     return SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//             getPlayerNamesDataTable(teamPlayers, context)
//       ],
//     ));
//   }

//   Widget getPlayerNamesDataTable(List<dynamic> players, BuildContext ctx) {
//     List<DataRow> rows = [];

//     for (var p in players) {
//       rows.add(
//         DataRow(cells: [
//           DataCell(Text(p["lastName"])
//           ),
//         ]),
//       );
//     }

//     return DataTable(
//       columnSpacing: 1,
//       horizontalMargin: 5,
//       dataRowHeight: 28,
//       headingRowHeight: 30,
//       headingTextStyle:
//           TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
//       headingRowColor:
//           MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
//         return Colors.grey[300]; // Use the default value.
//       }),
//       columns: [
//         DataColumn(label: Text('Name')),
//       ],
//       rows: rows,
//     );
//   }

//   Widget getDataTable(List<dynamic> players, BuildContext ctx) {
//     List<DataRow> rows = [];

//     for (var p in players) {
//       rows.add(
//         DataRow(cells: [
//           DataCell(
//             Text(p["jersey"]),
//           ),
//           // DataCell(Row(children: [
//           //   p["isOnCourt"]
//           //       ? CircleAvatar(
//           //           backgroundColor: Colors.green,
//           //           minRadius: 4,
//           //         )
//           //       : Text(''),
//           //   Text(p["pos"])
//           // ])),
//           DataCell(Text(p["min"])),
//           DataCell(Center(
//             child: Text(
//               p["points"],
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           )),
//           DataCell(Center(child: Text(p["fgm"]))),
//           DataCell(Center(child: Text(p["fga"]))),
//           DataCell(Center(
//             child: Text(
//               p["fgp"] == "" ? "" : p["fgp"] + "%",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           )),
//           DataCell(Center(child: VerticalDivider())),
//           DataCell(Center(child: Text(get2PM(p)))),
//           DataCell(Center(child: Text(get2PA(p)))),
//           DataCell(Center(
//             child: Text(
//               get2PPct(p),
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           )),
//           DataCell(Center(child: VerticalDivider())),
//           DataCell(Center(child: Text(p["tpm"]))),
//           DataCell(Center(child: Text(p["tpa"]))),
//           DataCell(Center(
//             child: Text(
//               p["tpp"] == "" ? "" : p["tpp"] + "%",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           )),
//           DataCell(Center(child: VerticalDivider())),
//           DataCell(Center(child: Text(p["ftm"]))),
//           DataCell(Center(child: Text(p["fta"]))),
//           DataCell(Center(
//             child: Text(
//               p["ftp"] == "" ? "" : p["ftp"] + "%",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           )),
//           DataCell(Center(child: VerticalDivider())),
//           DataCell(Center(child: Text(p["assists"]))),
//           DataCell(Center(child: Text(p["turnovers"]))),
//           DataCell(Center(child: Text(p["steals"]))),
//           DataCell(Center(child: Text(p["blocks"]))),
//           DataCell(Center(child: Text(p["offReb"]))),
//           DataCell(Center(child: Text(p["defReb"]))),
//           DataCell(Center(
//             child: Text(
//               p["totReb"],
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           )),
//           DataCell(Center(child: Text(p["pFouls"]))),
//           DataCell(Center(
//             child: Text(
//               p["plusMinus"],
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           )),
//           DataCell(Center(child: Text(getTrueShootingAttempts(p)))),
//           DataCell(Center(child: Text(getTrueShootingPercentage(p)))),
//           DataCell(Center(child: Text(getEffectiveFG(p)))),
//           DataCell(Text(p["dnp"])),
//         ]),
//       );
//     }

//     return Expanded(
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: DataTable(
//           columnSpacing: 10,
//           horizontalMargin: 5,
//           dataRowHeight: 28,
//           headingRowHeight: 30,
//           headingTextStyle:
//               TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
//           headingRowColor: MaterialStateProperty.resolveWith<Color>(
//               (Set<MaterialState> states) {
//             return Colors.grey[300]; // Use the default value.
//           }),
//           columns: [
//             DataColumn(label: Text('#')),
//             //DataColumn(label: Text('Name')),
//             // DataColumn(
//             //     label: StatInfoDialog(label: Text('Pos'), statName: "POS")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('Min'), statName: "MIN")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('Pts'), statName: "PTS")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('FGM'), statName: "FGM")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('FGA'), statName: "FGA")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('FG %'), statName: "FG%")),
//             DataColumn(label: Text('')),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('2PM'), statName: "2PM")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('2PA'), statName: "2PA")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('2P %'), statName: "2P%")),
//             DataColumn(label: Text('')),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('3PM'), statName: "3PM")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('3PA'), statName: "3PA")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('3P %'), statName: "3P%")),
//             DataColumn(label: Text('')),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('FTM'), statName: "FTM")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('FTA'), statName: "FTA")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('FT %'), statName: "FT%")),
//             DataColumn(label: Text('')),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('Asts'), statName: "AST")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('TO'), statName: "TOV")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('Stls'), statName: "STL")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('Blks'), statName: "BLK")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('OReb'), statName: "OREB")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('DReb'), statName: "DREB")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('TReb'), statName: "REB")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('PF'), statName: "PF")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('+/-'), statName: "+/-")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('TSA'), statName: "TSA")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('TS %'), statName: "TS%")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('eFG %'), statName: "EFG%")),
//             DataColumn(
//                 label: StatInfoDialog(label: Text('DNP'), statName: "DNP")),
//           ],
//           rows: rows,
//         ),
//       ),
//     );
//   }

//   String getTrueShootingAttempts(dynamic player) {
//     if (player["dnp"] == "") {
//       double fga = double.parse(player["fga"] == "" ? 0 : player["fga"]);
//       double fta = double.parse(player["fta"] == "" ? 0 : player["fta"]);

//       double tsa = fga + (0.44 * fta);

//       if (tsa.toString() == "NaN") {
//         tsa = 0;
//       }

//       return tsa.toStringAsFixed(2);
//     } else {
//       return "";
//     }
//   }

//   String getTrueShootingPercentage(dynamic player) {
//     if (player["dnp"] == "") {
//       int points = int.parse(player["points"] == "" ? 0 : player["points"]);
//       double fga = double.parse(player["fga"] == "" ? 0 : player["fga"]);
//       double fta = double.parse(player["fta"] == "" ? 0 : player["fta"]);
//       double tsa = fga + (0.44 * fta);
//       double tsp = points / (2 * tsa);

//       if (tsp.toString() == "NaN") {
//         tsp = 0;
//       }

//       return tsp.toStringAsFixed(2);
//     } else {
//       return "";
//     }
//   }

//   String getEffectiveFG(dynamic player) {
//     if (player["dnp"] == "") {
//       int fgm = int.parse(player["fgm"] == "" ? 0 : player["fgm"]);
//       int fga = int.parse(player["fga"] == "" ? 0 : player["fga"]);
//       int tpm = int.parse(player["tpm"] == "" ? 0 : player["tpm"]);
//       double efg = (fgm + (tpm * 0.5)) / fga;

//       if (efg.toString() == "NaN") {
//         efg = 0;
//       }

//       return efg.toStringAsFixed(2);
//     } else {
//       return "";
//     }
//   }

//   String get2PA(dynamic player) {
//     if (player["dnp"] == "") {
//       int fga = int.parse(player["fga"] == "" ? 0 : player["fga"]);
//       int tpa = int.parse(player["tpa"] == "" ? 0 : player["tpa"]);
//       int twopa = fga - tpa;

//       return twopa.toString();
//     } else {
//       return "";
//     }
//   }

//   String get2PM(dynamic player) {
//     if (player["dnp"] == "") {
//       int fgm = int.parse(player["fgm"] == "" ? 0 : player["fgm"]);
//       int tpm = int.parse(player["tpm"] == "" ? 0 : player["tpm"]);
//       int twopm = fgm - tpm;

//       return twopm.toString();
//     } else {
//       return "";
//     }
//   }

//   String get2PPct(dynamic player) {
//     var m = get2PM(player);
//     var a = get2PA(player);

//     if (m == "" || a == "") {
//       return "";
//     } else {
//       int m1 = int.parse(m);
//       int a1 = int.parse(a);
//       double p = (m1 / a1);

//       if (p.toString() == "NaN") {
//         p = 0;
//       }
//       return p.toStringAsFixed(2) + "%";
//     }
//   }
// }
