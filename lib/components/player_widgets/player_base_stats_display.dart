import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/player_widgets/player_single_stat_rank_display.dart';
import 'package:hoop/model/player_base_stat_and_rank.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class PlayerBaseStatsDisplay extends StatelessWidget {
  final String playerId;
  const PlayerBaseStatsDisplay(this.playerId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var json = snapshot.data["resultSets"];

            PlayerBaseStatAndRankList list = PlayerBaseStatAndRankList(json);
            PlayerBaseStatAndRank player;

            if (list.items.length > 0) {
              for (PlayerBaseStatAndRank p in list.items) {
                if (p.playerId.toString() == this.playerId) {
                  player = p;
                }
              }
            }

            if (player == null) {
              return Text(
                  "Base data is not currently available for this player...");
            } else {
              return Column(
                children: [
                  Text("Base Stats",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PlayerSingleStatRankDisplay(player.pts.toString(), "PTS",
                      player.ptsRank, list.items.length, "BASE", playerId),
                  PlayerSingleStatRankDisplay(player.reb.toString(), "REB",
                      player.rebRank, list.items.length, "BASE", playerId),
                  PlayerSingleStatRankDisplay(player.oReb.toString(), "OREB",
                      player.oRebRank, list.items.length, "BASE", playerId),
                  PlayerSingleStatRankDisplay(player.dReb.toString(), "DREB",
                      player.dRebRank, list.items.length, "BASE", playerId),
                  PlayerSingleStatRankDisplay(player.ast.toString(), "AST",
                      player.astRank, list.items.length, "BASE", playerId),
                  PlayerSingleStatRankDisplay(player.stl.toString(), "STL",
                      player.stlRank, list.items.length, "BASE", playerId),
                  PlayerSingleStatRankDisplay(player.blk.toString(), "BLK",
                      player.blkRank, list.items.length, "BASE", playerId),
                  PlayerSingleStatRankDisplay(player.fgPct.toString(), "FG %",
                      player.fgPctRank, list.items.length, "BASE", playerId),
                  PlayerSingleStatRankDisplay(player.ftPct.toString(), "FT %",
                      player.ftPctRank, list.items.length, "BASE", playerId),
                  PlayerSingleStatRankDisplay(player.fg3Pct.toString(), "3P %",
                      player.fg3PctRank, list.items.length, "BASE", playerId),
                  PlayerSingleStatRankDisplay(player.pf.toString(), "PF",
                      player.pfRank, list.items.length, "BASE", playerId),
                  PlayerSingleStatRankDisplay(
                      player.plusMinus.toString(),
                      "+/-",
                      player.plusMinusRank,
                      list.items.length,
                      "BASE",
                      playerId),
                  PlayerSingleStatRankDisplay(player.minutes.toString(), "MIN",
                      player.minutesRank, list.items.length, "BASE", playerId),
                  SizedBox(
                    height: 15,
                  ),
                ],
              );
            }
          } else {
            return NoConnection();
          }
        });
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
}
