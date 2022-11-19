import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/games_widgets/game_player_shot_chart.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/game_data.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';
import 'package:hoop/models/player_base_stat_and_rank.dart';
import 'package:hoop/screens/views/players/player_detail.dart';
import 'package:hoop/screens/views/players/player_search.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:hoop/stat_calculator.dart';
import 'package:provider/provider.dart';

class GamePlayerPopup extends StatefulWidget {
  final String personId;
  final GameData game;
  final PbpItem2 pbp;

  const GamePlayerPopup({this.personId, this.game, this.pbp});

  @override
  State<GamePlayerPopup> createState() => _GamePlayerPopupState();
}

class _GamePlayerPopupState extends State<GamePlayerPopup> {
  @override
  Widget build(BuildContext context) {
    var player = Provider.of<JsonFiles>(context, listen: false)
        .getPlayer(widget.personId.toString());
    var playerStats;
    // PlayerBaseStatAndRank playerAllStats;
    // String gameId = widget.game["gameId"];

    for (var p in widget.game.homeTeam.players.players) {
      if (widget.personId == p.personId.toString()) {
        playerStats = p;
      }
    }
    if (playerStats == null) {
      for (var p in widget.game.awayTeam.players.players) {
        if (widget.personId == p.personId.toString()) {
          playerStats = p;
        }
      }
    }

    print("PlayerId: ${widget.personId}");
    print("TeamId: ${player["teamId"]}");
    print("GameId: ${widget.game.gameId}");

    if (player == null) {
      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 8,
          child: Center(
              child: Text("Player Not Found", style: TextStyle(fontSize: 20))));
    } else {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                CachedLogo(
                  url:
                      "https://cdn.nba.com/headshots/nba/latest/1040x760/${widget.personId}.png",
                  radius: 40,
                ),
                SizedBox(
                  height: 4,
                ),
                Center(
                    child: Text(player["firstName"] + " " + player["lastName"],
                        style: TextStyle(fontSize: 20))),
                SizedBox(
                  height: 5,
                ),
                FutureBuilder(
                    future: loadData(context),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var json = snapshot.data["resultSets"];

                        PlayerBaseStatAndRankList list =
                            PlayerBaseStatAndRankList(json);
                        PlayerBaseStatAndRank playerAllStats;

                        if (list.items.length > 0) {
                          for (PlayerBaseStatAndRank p in list.items) {
                            if (p.playerId.toString() == widget.personId) {
                              playerAllStats = p;
                            }
                          }
                        }

                        return getDataTableFull(playerStats, playerAllStats);
                      } else {
                        return getDataTableGameOnly(playerStats);
                      }
                    }),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayerDetail(
                                  playerId: widget.personId.toString())));
                    },
                    child: Text("Player Card")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GamePlayerShotChart(
                                  widget.personId,
                                  player["teamId"],
                                  widget.game.gameId)));
                    },
                    child: Text("Shot Chart"))
              ]),
        ),
      );
    }
  }

  Future<dynamic> loadData(BuildContext context) async {
    dynamic json;

    json =
        Provider.of<JsonFiles>(context, listen: false).getAllBasePlayerStats();

    if (json == null) {
      json = await Network.getJson(
        Urls.getNbaStatsAllPlayerStats(perMode: "PerGame"),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setAllBasePlayerStats(json);
    }
    return json;
  }

  // Widget getStatLabel(String label) {
  Widget getGameStat(String value) {
    return Text(
      value.toString(),
      style: TextStyle(
          fontSize: 20, color: Colors.blue[900], fontWeight: FontWeight.w500),
    );
  }

  // Widget getSeasonStat(String value) {
  Widget getDataTableFull(GamePlayer playerStats, dynamic playerAllStats) {
    GamePlayerStatistics stats = playerStats.statistics;

    return DataTable(
      columnSpacing: 10,
      horizontalMargin: 5,
      dataRowHeight: 24,
      headingRowHeight: 24,
      headingTextStyle: TextStyle(
        color: Colors.red[900],
        fontWeight: FontWeight.bold,
      ),
      columns: [
        DataColumn(label: Text('')),
        DataColumn(label: Center(child: Text('Game'))),
        DataColumn(label: Center(child: Text('Season'))),
        DataColumn(label: Center(child: Text('Compare'))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Center(child: Text("PTS"))),
          DataCell(Center(child: getGameStat(stats.points.toString()))),
          DataCell(Center(child: Text(playerAllStats.pts.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(stats.points.toString()),
                  playerAllStats.pts, false))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("FG%"))),
          DataCell(Center(
              child: getGameStat(
                  double.parse(stats.fieldGoalsPercentage.toString())
                      .toStringAsFixed(2)))),
          DataCell(Center(child: Text(playerAllStats.fgPct.toString()))),
          DataCell(Center(
              child: getComparison(
                  double.parse(stats.fieldGoalsPercentage.toString()),
                  playerAllStats.fgPct,
                  true))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("FT%"))),
          DataCell(Center(
              child: getGameStat(
                  double.parse(stats.freeThrowsPercentage.toString())
                      .toStringAsFixed(2)))),
          DataCell(Center(child: Text(playerAllStats.ftPct.toString()))),
          DataCell(Center(
              child: getComparison(
                  double.parse(stats.freeThrowsPercentage.toString()),
                  playerAllStats.ftPct,
                  true))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("3P%"))),
          DataCell(Center(
              child: getGameStat(
                  double.parse(stats.threePointersPercentage.toString())
                      .toStringAsFixed(2)))),
          DataCell(Center(child: Text(playerAllStats.fg3Pct.toString()))),
          DataCell(Center(
              child: getComparison(
                  double.parse(stats.threePointersPercentage.toString()),
                  playerAllStats.fg3Pct,
                  true))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("REB"))),
          DataCell(Center(child: getGameStat(stats.reboundsTotal.toString()))),
          DataCell(Center(child: Text(playerAllStats.reb.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(stats.reboundsTotal.toString()),
                  playerAllStats.reb, false))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("AST"))),
          DataCell(Center(child: getGameStat(stats.assists.toString()))),
          DataCell(Center(child: Text(playerAllStats.ast.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(stats.assists.toString()),
                  playerAllStats.ast, false))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("STL"))),
          DataCell(Center(child: getGameStat(stats.steals.toString()))),
          DataCell(Center(child: Text(playerAllStats.stl.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(stats.steals.toString()),
                  playerAllStats.stl, false))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("TO"))),
          DataCell(Center(child: getGameStat(stats.turnovers.toString()))),
          DataCell(Center(child: Text(playerAllStats.tov.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(stats.turnovers.toString()),
                  playerAllStats.tov, false))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("BLK"))),
          DataCell(Center(child: getGameStat(stats.blocks.toString()))),
          DataCell(Center(child: Text(playerAllStats.blk.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(stats.blocks.toString()),
                  playerAllStats.blk, false))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("PF"))),
          DataCell(Center(child: getGameStat(stats.foulsPersonal.toString()))),
          DataCell(Center(child: Text(playerAllStats.pf.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(stats.foulsPersonal.toString()),
                  playerAllStats.pf, false))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("TS%"))),
          DataCell(Center(
              child: getGameStat(StatCalculator.getTSPercentGame(playerStats)
                  .toStringAsFixed(2)))),
          DataCell(Center(
              child: Text(StatCalculator.getTSPercentSeason(playerAllStats)
                  .toStringAsFixed(2)))),
          DataCell(Center(
              child: getComparison(StatCalculator.getTSPercentGame(playerStats),
                  StatCalculator.getTSPercentSeason(playerAllStats), false))),
        ]),
      ],
    );
  }

  Widget getDataTableGameOnly(GamePlayer playerStats) {
    GamePlayerStatistics stats = playerStats.statistics;
    return DataTable(
      columnSpacing: 10,
      horizontalMargin: 5,
      dataRowHeight: 24,
      headingRowHeight: 24,
      headingTextStyle:
          TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
      columns: [
        DataColumn(label: Text('')),
        DataColumn(label: Text('Game')),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Center(child: Text("PTS"))),
          DataCell(Center(child: getGameStat(stats.points.toString()))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("FG%"))),
          DataCell(Center(
              child:
                  getGameStat(stats.fieldGoalsPercentage.toStringAsFixed(2)))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("FT%"))),
          DataCell(Center(
              child:
                  getGameStat(stats.freeThrowsPercentage.toStringAsFixed(2)))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("3P%"))),
          DataCell(Center(
              child: getGameStat(
                  stats.threePointersPercentage.toStringAsFixed(2)))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("REB"))),
          DataCell(Center(child: getGameStat(stats.reboundsTotal.toString()))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("AST"))),
          DataCell(Center(child: getGameStat(stats.assists.toString()))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("STL"))),
          DataCell(Center(child: getGameStat(stats.steals.toString()))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("TO"))),
          DataCell(Center(child: getGameStat(stats.turnovers.toString()))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("BLK"))),
          DataCell(Center(child: getGameStat(stats.blocks.toString()))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("PF"))),
          DataCell(Center(child: getGameStat(stats.foulsPersonal.toString()))),
        ]),
      ],
    );
  }

  Widget getComparison(double game, double season, bool isPercent) {
    double compare = 0.0;
    int s = 1; // 1 is below, 2 is same, 3 is above
    if (isPercent) {
      season *= 100;
    }

    if (game == 0 && season > 0) {
      compare = 0.0;
      s = 1;
    }
    if (game > 0 && season == 0) {
      compare = game;
      s = 3;
    }

    if (game == 0 && season == 0) {
      compare = 0.0;
      s = 2;
    }

    if (game > 0 && season > 0) {
      compare = game / season;
      if (compare > 1) {
        s = 3;
      } else if (compare < 1) {
        s = 1;
      } else {
        s = 2;
      }
    }

    Widget w;

    if (s == 1) {
      w = Container(
          alignment: Alignment.center,
          width: 10,
          child: Icon(
            Icons.arrow_drop_down,
            color: Colors.red,
          ));
    }
    if (s == 2) {
      w = SizedBox();
    }
    if (s == 3) {
      w = Container(
          alignment: Alignment.center,
          width: 10,
          child: Icon(
            Icons.arrow_drop_up,
            color: Colors.green,
          ));
    }

    return Row(
      children: [
        w,
        SizedBox(
          width: 10,
        ),
        Text((compare * 100).toStringAsFixed(0) + "%"),
      ],
    );
  }
}
