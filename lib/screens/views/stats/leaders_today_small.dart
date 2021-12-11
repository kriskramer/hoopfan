import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/games_widgets/team_tricode_card.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/player_box_score.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class LeadersTodaySmall extends StatefulWidget {
  @override
  _LeadersTodaySmallState createState() => _LeadersTodaySmallState();
}

class _LeadersTodaySmallState extends State<LeadersTodaySmall> {
  Future<bool> dataLoadComplete;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
          height: 5,
        ),
        Text(
          "Today's Leaders",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Text('Showing previous day stats until noon CST.'),
        SizedBox(
          height: 10,
        ),
        showLeaders(),
        SizedBox(
          height: 10,
        ),
      ]),
    );
  }

  Widget showLeaders() {
    return FutureBuilder(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          PlayerBoxScoreList list =
              Provider.of<JsonFiles>(context, listen: false)
                  .getPlayerBoxScores();

          List<DataRow> rowsPoints = [];
          // List<DataRow> rowsRebs = [];
          // List<DataRow> rowsAsts = [];
          // List<DataRow> rowsPM = [];

          if (list == null) {
            return Container(
                padding: EdgeInsets.all(25), child: Text('No data yet...'));
          }

          if (list.items.length > 0) {
            list.sortByPoints(false);

            for (var p in list.items) {
              rowsPoints.add(DataRow(cells: [
                DataCell(TeamTricodeCardFromTeamId(
                  teamId: p.teamId,
                )),
                DataCell(
                  Text(p.lastName),
                ),
                DataCell(Text(p.points.toString())),
                DataCell(Text(p.fga +
                    "/" +
                    p.fgm +
                    "  " +
                    p.fta +
                    "/" +
                    p.ftm +
                    "  " +
                    p.tpa +
                    "/" +
                    p.tpm)),
              ]));
            }

            // list.sortByRebounds(false);

            // for (var p in list.items) {
            //   rowsRebs.add(DataRow(cells: [
            //     DataCell(TeamTricodeCardFromTeamId(
            //       teamId: p.teamId,
            //     )),
            //     DataCell(
            //       Text(p.lastName),
            //     ),
            //     DataCell(Text(p.totReb.toString())),
            //     DataCell(Text(p.offReb + " | " + p.defReb)),
            //   ]));
            // }

            // list.sortByAssists(false);

            // for (var p in list.items) {
            //   rowsAsts.add(DataRow(cells: [
            //     DataCell(TeamTricodeCardFromTeamId(
            //       teamId: p.teamId,
            //     )),
            //     DataCell(
            //       Text(p.lastName),
            //     ),
            //     DataCell(Text(p.assists.toString()))
            //   ]));
            // }

            // list.sortByPlusMinus(false);

            // for (var p in list.items) {
            //   rowsPM.add(DataRow(cells: [
            //     DataCell(TeamTricodeCardFromTeamId(
            //       teamId: p.teamId,
            //     )),
            //     DataCell(
            //       Text(p.lastName),
            //     ),
            //     DataCell(Text(p.plusMinus.toString()))
            //   ]));
            // }

            return Column(
              children: [
                Text(
                  'Points',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                DataTable(
                  columnSpacing: 10,
                  dataRowHeight: 25,
                  headingRowHeight: 0,
                  columns: [
                    DataColumn(label: Text('Team')),
                    DataColumn(label: Text('Player')),
                    DataColumn(label: Text('Points')),
                    DataColumn(label: Text('%'))
                  ],
                  rows: [
                    ...rowsPoints.getRange(0, 7),
                  ],
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // Text(
                //   'Rebounds',
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                // ),
                // DataTable(
                //   columnSpacing: 12,
                //   dataRowHeight: 25,
                //   headingRowHeight: 0,
                //   columns: [
                //     DataColumn(label: Text('Team')),
                //     DataColumn(label: Text('Player')),
                //     DataColumn(label: Text('Rebs')),
                //     DataColumn(label: Text('Totals'))
                //   ],
                //   rows: [
                //     ...rowsRebs.getRange(0, 10),
                //   ],
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Text(
                //   'Assists',
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                // ),
                // DataTable(
                //   columnSpacing: 12,
                //   dataRowHeight: 25,
                //   headingRowHeight: 0,
                //   columns: [
                //     DataColumn(label: Text('Team')),
                //     DataColumn(label: Text('Player')),
                //     DataColumn(label: Text('Asts'))
                //   ],
                //   rows: [
                //     ...rowsAsts.getRange(0, 10),
                //   ],
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Text(
                //   'Plus/Minus',
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                // ),
                // DataTable(
                //   columnSpacing: 12,
                //   dataRowHeight: 25,
                //   headingRowHeight: 0,
                //   columns: [
                //     DataColumn(label: Text('Team')),
                //     DataColumn(label: Text('Player')),
                //     DataColumn(label: Text('Asts'))
                //   ],
                //   rows: [
                //     ...rowsPM.getRange(0, 10),
                //   ],
                // )
              ],
            );
          } else {
            return Text('No data yet.');
          }
        } else {
          return NoConnection();
        }
      },
    );
  }

  Widget showRebLeaders() {
    return FutureBuilder(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          PlayerBoxScoreList list =
              Provider.of<JsonFiles>(context, listen: false)
                  .getPlayerBoxScores();

          if (list == null) {
            return SizedBox();
          }

          list.sortByRebounds(false);
          List<DataRow> rows = [];

          for (var p in list.items) {
            rows.add(DataRow(cells: [
              DataCell(TeamTricodeCardFromTeamId(
                teamId: p.teamId,
              )),
              DataCell(
                Text(p.lastName),
              ),
              DataCell(Text(p.points.toString()))
            ]));
          }

          return DataTable(
            columnSpacing: 12,
            dataRowHeight: 25,
            headingRowHeight: 0,
            columns: [
              DataColumn(label: Text('Team')),
              DataColumn(label: Text('Player')),
              DataColumn(label: Text('Points'))
            ],
            rows: [
              ...rows.getRange(0, 10),
            ],
          );
        } else {
          return NoConnection();
        }
      },
    );
  }

  Future<bool> loadData() async {
    PlayerBoxScoreList listPlayers = new PlayerBoxScoreList();
    dynamic gamesToday = await Network.getJson(Urls.nbaGamesToday());

    if (gamesToday != null) {
      for (var g in gamesToday["games"]) {
        var gameId = g["gameId"];
        var gameDate = g["gameUrlCode"].toString().split("/")[0];
// TODO: fix null errors here
        dynamic boxScore =
            await Network.getJson(Urls.nbaBoxScore(gameDate, gameId));

        if (boxScore["stats"] != null) {
          for (var p in boxScore["stats"]["activePlayers"]) {
            listPlayers.items.add(PlayerBoxScore.fromJson(p));
          }
        }
      }

      Provider.of<JsonFiles>(context, listen: false)
          .setPlayerBoxScores(listPlayers);
    }
    return true;
  }
}
