import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

import 'datatables/player_stats_game_split_scoring_datatable.dart';
import 'datatables/player_stats_game_splits_advanced_datatable.dart';
import 'datatables/player_stats_game_splits_base_datatable.dart';
import 'datatables/player_stats_game_splits_misc_datatable.dart';
import 'datatables/player_stats_game_splits_usage_datatable.dart';

class PlayerSplitsGeneralTable extends StatelessWidget {
  final String playerId;
  final String measure;
  final String per;

  PlayerSplitsGeneralTable({this.playerId, this.measure, this.per});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var json = snapshot.data["resultSets"];

            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: getStatsTable(json),
                ),
                SizedBox(
                  height: 15,
                ),
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

  Widget getStatsTable(dynamic json) {
    if (measure == "Base") {
      return PlayerStatsGameSplitsBaseDataTable(json: json);
    } else if (measure == "Advanced") {
      return PlayerStatsGameSplitsAdvancedDataTable(json: json);
    } else if (measure == "Misc") {
      return PlayerStatsGameSplitsMiscDataTable(json: json);
    } else if (measure == "Four Factors") {
      return Text('No data');
    } else if (measure == "Scoring") {
      return PlayerStatsGameSplitsScoringDataTable(json: json);
    } else if (measure == "Opponent") {
      return Text('No data');
    } else if (measure == "Usage") {
      return PlayerStatsGameSplitsUsageDataTable(json: json);
    }
    return null;
  }

  Future<dynamic> loadData(BuildContext context) async {
    dynamic json;
    // print(playerId);

    if (Provider.of<JsonFiles>(context, listen: false)
            .getPlayerSplitsGeneral(playerId) ==
        null) {
      json = Network.getJson(
        Urls.getNbaStatsPlayerSplitsGeneral(playerId),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

    //   Provider.of<JsonFiles>(context, listen: false)
    //       .setPlayerSplitsGeneral(playerId, json);
    // } else {
    //   json = Provider.of<JsonFiles>(context, listen: false)
    //       .getPlayerSplitsGeneral(playerId);
    // }

    return json;
  }
}