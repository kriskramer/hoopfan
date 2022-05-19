import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/games_widgets/game_player_shot_chart.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';
import 'package:hoop/models/player_base_stat_and_rank.dart';
import 'package:hoop/screens/views/players/player_detail.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:hoop/stat_calculator.dart';
import 'package:provider/provider.dart';

class GamePlayerPopup extends StatefulWidget {
  final String personId;
  final dynamic game;
  final dynamic stats;
  final PbpItem pbp;

  const GamePlayerPopup({this.personId, this.game, this.stats, this.pbp});

  @override
  State<GamePlayerPopup> createState() => _GamePlayerPopupState();
}

class _GamePlayerPopupState extends State<GamePlayerPopup> {
  @override
  Widget build(BuildContext context) {
    var player = Provider.of<JsonFiles>(context, listen: false)
        .getPlayer(widget.personId);
    var playerStats;
    // PlayerBaseStatAndRank playerAllStats;
    // String gameId = widget.game["gameId"];

    for (var p in widget.stats["activePlayers"]) {
      if (widget.personId == p["personId"]) {
        playerStats = p;
      }
    }

    print("PlayerId: ${widget.personId}");
    print("TeamId: ${player["teamId"]}");
    print("GameId: ${widget.game["gameId"]}");

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
                              builder: (context) =>
                                  PlayerDetail(playerId: widget.personId)));
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
                                  widget.game["gameId"])));
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
      json = Network.getJson(
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
      value,
      style: TextStyle(
          fontSize: 20, color: Colors.blue[900], fontWeight: FontWeight.w500),
    );
  }

  // Widget getSeasonStat(String value) {
  Widget getDataTableFull(dynamic playerStats, dynamic playerAllStats) {
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
          DataCell(Center(child: getGameStat(playerStats["points"]))),
          DataCell(Center(child: Text(playerAllStats.pts.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(playerStats["points"]),
                  playerAllStats.pts, false))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("FG%"))),
          DataCell(Center(child: getGameStat(playerStats["fgp"]))),
          DataCell(Center(child: Text(playerAllStats.fgPct.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(playerStats["fgp"]),
                  playerAllStats.fgPct, true))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("FT%"))),
          DataCell(Center(child: getGameStat(playerStats["ftp"]))),
          DataCell(Center(child: Text(playerAllStats.ftPct.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(playerStats["ftp"]),
                  playerAllStats.ftPct, true))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("3P%"))),
          DataCell(Center(child: getGameStat(playerStats["tpp"]))),
          DataCell(Center(child: Text(playerAllStats.fg3Pct.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(playerStats["tpp"]),
                  playerAllStats.fg3Pct, true))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("REB"))),
          DataCell(Center(child: getGameStat(playerStats["totReb"]))),
          DataCell(Center(child: Text(playerAllStats.reb.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(playerStats["totReb"]),
                  playerAllStats.reb, false))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("AST"))),
          DataCell(Center(child: getGameStat(playerStats["assists"]))),
          DataCell(Center(child: Text(playerAllStats.ast.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(playerStats["assists"]),
                  playerAllStats.ast, false))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("STL"))),
          DataCell(Center(child: getGameStat(playerStats["steals"]))),
          DataCell(Center(child: Text(playerAllStats.stl.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(playerStats["steals"]),
                  playerAllStats.stl, false))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("TO"))),
          DataCell(Center(child: getGameStat(playerStats["turnovers"]))),
          DataCell(Center(child: Text(playerAllStats.tov.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(playerStats["turnovers"]),
                  playerAllStats.tov, false))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("BLK"))),
          DataCell(Center(child: getGameStat(playerStats["blocks"]))),
          DataCell(Center(child: Text(playerAllStats.blk.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(playerStats["blocks"]),
                  playerAllStats.blk, false))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("PF"))),
          DataCell(Center(child: getGameStat(playerStats["pFouls"]))),
          DataCell(Center(child: Text(playerAllStats.pf.toString()))),
          DataCell(Center(
              child: getComparison(double.parse(playerStats["pFouls"]),
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

  Widget getDataTableGameOnly(dynamic playerStats) {
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
          DataCell(Center(child: getGameStat(playerStats["points"]))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("FG%"))),
          DataCell(Center(child: getGameStat(playerStats["fgp"]))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("FT%"))),
          DataCell(Center(child: getGameStat(playerStats["ftp"]))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("3P%"))),
          DataCell(Center(child: getGameStat(playerStats["tpp"]))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("REB"))),
          DataCell(Center(child: getGameStat(playerStats["totReb"]))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("AST"))),
          DataCell(Center(child: getGameStat(playerStats["assists"]))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("STL"))),
          DataCell(Center(child: getGameStat(playerStats["steals"]))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("TO"))),
          DataCell(Center(child: getGameStat(playerStats["turnovers"]))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("BLK"))),
          DataCell(Center(child: getGameStat(playerStats["blocks"]))),
        ]),
        DataRow(cells: [
          DataCell(Center(child: Text("PF"))),
          DataCell(Center(child: getGameStat(playerStats["pFouls"]))),
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
