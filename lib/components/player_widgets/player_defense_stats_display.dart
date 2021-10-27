import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/player_widgets/player_single_stat_rank_display.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/model/player_defense_stat_and_rank.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class PlayerDefenseStatsDisplay extends StatelessWidget {
  final String playerId;
  const PlayerDefenseStatsDisplay(this.playerId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var json = snapshot.data["resultSets"];

            PlayerDefenseStatAndRankList list =
                PlayerDefenseStatAndRankList(json);
            PlayerDefenseStatAndRank player;

            if (list.items.length > 0) {
              for (PlayerDefenseStatAndRank p in list.items) {
                if (p.playerId.toString() == this.playerId) {
                  player = p;
                }
              }
            }

            if (player == null) {
              return Text("Data is not currently available for this player...");
            } else {
              return Column(
                children: [
                  Text("Defensive Stats",
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
                      player.defRtg.toString(),
                      "DEF RTG",
                      player.defRtgRank,
                      list.items.length,
                      "DEFENSE",
                      playerId),
                  PlayerSingleStatRankDisplay(player.dReb.toString(), "DREB",
                      player.dRebRank, list.items.length, "DEFENSE", playerId),
                  PlayerSingleStatRankDisplay(
                      player.dRebPct.toString(),
                      "DREB %",
                      player.dRebPctRank,
                      list.items.length,
                      "DEFENSE",
                      playerId),
                  PlayerSingleStatRankDisplay(
                      player.pctDReb.toString(),
                      "% DREB",
                      player.pctDRebRank,
                      list.items.length,
                      "DEFENSE",
                      playerId),
                  PlayerSingleStatRankDisplay(player.stl.toString(), "STL",
                      player.stlRank, list.items.length, "DEFENSE", playerId),
                  PlayerSingleStatRankDisplay(
                      player.pctStl.toString(),
                      "% STL",
                      player.pctStlRank,
                      list.items.length,
                      "DEFENSE",
                      playerId),
                  PlayerSingleStatRankDisplay(player.blk.toString(), "BLK",
                      player.blkRank, list.items.length, "DEFENSE", playerId),
                  PlayerSingleStatRankDisplay(
                      player.pctBlk.toString(),
                      "% BLK",
                      player.pctBlkRank,
                      list.items.length,
                      "DEFENSE",
                      playerId),
                  PlayerSingleStatRankDisplay(
                      player.oppPtsOffTov.toString(),
                      "OPP PTS TOV",
                      player.oppPtsOffTovRank,
                      list.items.length,
                      "DEFENSE",
                      playerId),
                  PlayerSingleStatRankDisplay(
                      player.oppPts2ndChance.toString(),
                      "OPP PTS 2nd",
                      player.oppPts2ndChanceRank,
                      list.items.length,
                      "DEFENSE",
                      playerId),
                  PlayerSingleStatRankDisplay(
                      player.oppPtsFb.toString(),
                      "OPP PTS FB",
                      player.oppPtsFbRank,
                      list.items.length,
                      "DEFENSE",
                      playerId),
                  PlayerSingleStatRankDisplay(
                      player.oppPtsPaint.toString(),
                      "OPP PTS Paint",
                      player.oppPtsPaintRank,
                      list.items.length,
                      "DEFENSE",
                      playerId),
                  PlayerSingleStatRankDisplay(player.defWS.toString(), "DEF WS",
                      player.defWSRank, list.items.length, "DEFENSE", playerId),
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

    Provider.of<JsonFiles>(context, listen: false).getAllDefensePlayerStats();

    if (json == null) {
      json = Network.getJson(
        Urls.getNbaStatsAllPlayerStats(
            perMode: "PerGame", measureType: "Defense"),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setAllDefensePlayerStats(json);
    }
    return json;
  }
}
