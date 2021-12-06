import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/player_widgets/player_single_stat_rank_display.dart';
import 'package:hoop/model/player_advanced_stat_and_rank.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class PlayerAdvancedStatsDisplay extends StatelessWidget {
  final String playerId;
  const PlayerAdvancedStatsDisplay(this.playerId);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 25;
    return FutureBuilder(
        future: loadData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var json = snapshot.data["resultSets"];

            PlayerAdvancedStatAndRankList list =
                PlayerAdvancedStatAndRankList(json);
            PlayerAdvancedStatAndRank player;

            if (list.items.length > 0) {
              for (PlayerAdvancedStatAndRank p in list.items) {
                if (p.playerId.toString() == this.playerId) {
                  player = p;
                }
              }
            }

            if (player == null) {
              return Text(
                  "Advanced data is not currently available for this player...");
            } else {
              return Column(
                children: [
                  Text("Advanced Stats",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PlayerSingleStatRankDisplay(
                      player.offRating.toString(),
                      "Off Rtg",
                      player.offRatingRank,
                      list.items.length,
                      "ADVANCED",
                      playerId,
                      width),
                  PlayerSingleStatRankDisplay(
                      player.defRating.toString(),
                      "Def Rtg",
                      player.defRatingRank,
                      list.items.length,
                      "ADVANCED",
                      playerId,
                      width),
                  PlayerSingleStatRankDisplay(
                      player.netRating.toString(),
                      "Net Rtg",
                      player.netRatingRank,
                      list.items.length,
                      "ADVANCED",
                      playerId,
                      width),
                  PlayerSingleStatRankDisplay(
                      player.astPct.toString(),
                      "AST %",
                      player.astPctRank,
                      list.items.length,
                      "ADVANCED",
                      playerId,
                      width),
                  PlayerSingleStatRankDisplay(
                      player.astTov.toString(),
                      "AST/TOV",
                      player.astTovRank,
                      list.items.length,
                      "ADVANCED",
                      playerId,
                      width),
                  PlayerSingleStatRankDisplay(
                      player.astRatio.toString(),
                      "AST Ratio",
                      player.astRatioRank,
                      list.items.length,
                      "ADVANCED",
                      playerId,
                      width),
                  PlayerSingleStatRankDisplay(
                      player.oRebPct.toString(),
                      "OREB %",
                      player.oRebPctRank,
                      list.items.length,
                      "ADVANCED",
                      playerId,
                      width),
                  PlayerSingleStatRankDisplay(
                      player.dRebPct.toString(),
                      "DREB  %",
                      player.dRebPctRank,
                      list.items.length,
                      "ADVANCED",
                      playerId,
                      width),
                  PlayerSingleStatRankDisplay(
                      player.rebPct.toString(),
                      "REB %",
                      player.rebPctRank,
                      list.items.length,
                      "ADVANCED",
                      playerId,
                      width),
                  PlayerSingleStatRankDisplay(
                      player.tmTovPct.toString(),
                      "TM TOV %",
                      player.tmTovPctRank,
                      list.items.length,
                      "ADVANCED",
                      playerId,
                      width),
                  PlayerSingleStatRankDisplay(
                      player.efgPct.toString(),
                      "eFG %",
                      player.efgPctRank,
                      list.items.length,
                      "ADVANCED",
                      playerId,
                      width),
                  PlayerSingleStatRankDisplay(
                      player.tsPct.toString(),
                      "TS %",
                      player.tsPctRank,
                      list.items.length,
                      "ADVANCED",
                      playerId,
                      width),
                  PlayerSingleStatRankDisplay(
                      player.usgPct.toString(),
                      "USG %",
                      player.usgPctRank,
                      list.items.length,
                      "ADVANCED",
                      playerId,
                      width),
                  PlayerSingleStatRankDisplay(
                      player.pie.toString(),
                      "PIE",
                      player.pieRank,
                      list.items.length,
                      "ADVANCED",
                      playerId,
                      width),
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

    Provider.of<JsonFiles>(context, listen: false).getAllAdvancedPlayerStats();

    if (json == null) {
      json = Network.getJson(
        Urls.getNbaStatsAllPlayerStats(
            perMode: "PerGame", measureType: "Advanced"),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setAllAdvancedPlayerStats(json);
    }
    return json;
  }
}
