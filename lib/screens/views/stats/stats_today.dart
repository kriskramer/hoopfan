import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/games_widgets/team_tricode_card.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/player_box_score.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class StatsToday extends StatefulWidget {
  @override
  _StatsTodayState createState() => _StatsTodayState();
}

class _StatsTodayState extends State<StatsToday> {
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
          height: 10,
        ),
        Text(
          "Today's Leaders",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
          height: 20,
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

          List<DataRow> rowsPoints = new List<DataRow>();
          List<DataRow> rowsRebs = new List<DataRow>();
          List<DataRow> rowsAsts = new List<DataRow>();
          List<DataRow> rowsPM = new List<DataRow>();

          if (list == null) {
            return SizedBox();
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

            list.sortByRebounds(false);

            for (var p in list.items) {
              rowsRebs.add(DataRow(cells: [
                DataCell(TeamTricodeCardFromTeamId(
                  teamId: p.teamId,
                )),
                DataCell(
                  Text(p.lastName),
                ),
                DataCell(Text(p.totReb.toString())),
                DataCell(Text(p.offReb + " | " + p.defReb)),
              ]));
            }

            list.sortByAssists(false);

            for (var p in list.items) {
              rowsAsts.add(DataRow(cells: [
                DataCell(TeamTricodeCardFromTeamId(
                  teamId: p.teamId,
                )),
                DataCell(
                  Text(p.lastName),
                ),
                DataCell(Text(p.assists.toString()))
              ]));
            }

            list.sortByPlusMinus(false);

            for (var p in list.items) {
              rowsPM.add(DataRow(cells: [
                DataCell(TeamTricodeCardFromTeamId(
                  teamId: p.teamId,
                )),
                DataCell(
                  Text(p.lastName),
                ),
                DataCell(Text(p.plusMinus.toString()))
              ]));
            }

            return Column(
              children: [
                Text(
                  'Points',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                DataTable(
                  columnSpacing: 12,
                  dataRowHeight: 25,
                  headingRowHeight: 0,
                  columns: [
                    DataColumn(label: Text('Team')),
                    DataColumn(label: Text('Player')),
                    DataColumn(label: Text('Points')),
                    DataColumn(label: Text('%'))
                  ],
                  rows: [
                    ...rowsPoints.getRange(0, 10),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Rebounds',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                DataTable(
                  columnSpacing: 15,
                  dataRowHeight: 25,
                  headingRowHeight: 0,
                  columns: [
                    DataColumn(label: Text('Team')),
                    DataColumn(label: Text('Player')),
                    DataColumn(label: Text('Rebs')),
                    DataColumn(label: Text('Totals'))
                  ],
                  rows: [
                    ...rowsRebs.getRange(0, 10),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Assists',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                DataTable(
                  columnSpacing: 15,
                  dataRowHeight: 25,
                  headingRowHeight: 0,
                  columns: [
                    DataColumn(label: Text('Team')),
                    DataColumn(label: Text('Player')),
                    DataColumn(label: Text('Asts'))
                  ],
                  rows: [
                    ...rowsAsts.getRange(0, 10),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Plus/Minus',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                DataTable(
                  columnSpacing: 15,
                  dataRowHeight: 25,
                  headingRowHeight: 0,
                  columns: [
                    DataColumn(label: Text('Team')),
                    DataColumn(label: Text('Player')),
                    DataColumn(label: Text('Asts'))
                  ],
                  rows: [
                    ...rowsPM.getRange(0, 10),
                  ],
                )
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
          List<DataRow> rows = new List<DataRow>();

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
            columnSpacing: 15,
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
