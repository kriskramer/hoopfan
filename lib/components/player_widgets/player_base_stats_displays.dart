import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/player_widgets/player_single_stat_rank_display.dart';
import 'package:hoop/model/player_stat_and_rank.dart';
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

            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Text(player.age.toString()),
                      Text(player.pts.toString()),
                      Text(player.playerName.toString()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                PlayerSingleStatRankDisplay(player.pts.toString(), "PTS",
                    player.ptsRank, list.items.length),
                PlayerSingleStatRankDisplay(player.reb.toString(), "REB",
                    player.rebRank, list.items.length),
                PlayerSingleStatRankDisplay(player.ast.toString(), "AST",
                    player.astRank, list.items.length),
                PlayerSingleStatRankDisplay(player.stl.toString(), "STL",
                    player.stlRank, list.items.length),
                PlayerSingleStatRankDisplay(player.blk.toString(), "BLK",
                    player.blkRank, list.items.length),
                SizedBox(
                  height: 15,
                ),
              ],
            );
          } else {
            return NoConnection();
          }
        });
  }

  Future<dynamic> loadData(BuildContext context) async {
    dynamic json;

    Provider.of<JsonFiles>(context, listen: false).getAllPlayerStats();

    if (json == null) {
      json = Network.getJson(
        Urls.getNbaStatsAllPlayerStats(perMode: "PerGame"),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false).setAllPlayerStats(json);
    }
    return json;
  }
}
