import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/model/player_base_stat_and_rank.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class GamePlayerPopup extends StatelessWidget {
  final String personId;
  final dynamic game;
  final dynamic stats;

  const GamePlayerPopup({this.personId, this.game, this.stats});

  @override
  Widget build(BuildContext context) {
    var player =
        Provider.of<JsonFiles>(context, listen: false).getPlayer(personId);
    var playerStats;
    PlayerBaseStatAndRank playerAllStats;

    for (var p in stats["activePlayers"]) {
      if (personId == p["personId"]) {
        playerStats = p;
      }
    }

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
                Center(
                    child: Text(player["firstName"] + " " + player["lastName"],
                        style: TextStyle(fontSize: 20))),
                //Text(personId),
                CachedLogo(
                  url:
                      "https://cdn.nba.com/headshots/nba/latest/1040x760/$personId.png",
                  radius: 45,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(player["pos"]),
                    SizedBox(
                      width: 10,
                    ),
                    Text(player["heightFeet"] +
                        "' " +
                        player["heightInches"] +
                        "\""),
                    SizedBox(
                      width: 4,
                    ),
                    Text("(" + player["heightMeters"] + ")"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(player["weightPounds"] + "lbs"),
                    SizedBox(
                      width: 4,
                    ),
                    Text("(" + player["weightKilograms"] + "kgs)"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Game Stats compared to season stats"),

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
                            if (p.playerId.toString() == personId) {
                              playerAllStats = p;
                            }
                          }
                        }

                        return getDataTableFull(playerStats, playerAllStats);
                      } else {
                        return getDataTableGameOnly(playerStats);
                      }
                    })
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
  //   return Container(
  //       height: 24,
  //       width: 50,
  //       child: Text(
  //         label,
  //         style: TextStyle(fontSize: 16),
  //       ));
  // }

  Widget getGameStat(String value) {
    return Text(
      value,
      style: TextStyle(
          fontSize: 20, color: Colors.blue[900], fontWeight: FontWeight.w500),
    );
  }

  // Widget getSeasonStat(String value) {
  //   return Container(
  //       height: 24,
  //       width: 50,
  //       child: Text(
  //         value,
  //         style: TextStyle(fontSize: 16),
  //       ));
  // }

  Widget getDataTableFull(dynamic playerStats, dynamic playerAllStats) {
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
        DataColumn(label: Text('Season')),
        DataColumn(label: Text('Compare')),
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
