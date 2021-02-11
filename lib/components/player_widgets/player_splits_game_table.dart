import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/player_widgets/datatables/player_stats_game_split_scoring_datatable.dart';
import 'package:hoop/components/player_widgets/datatables/player_stats_game_splits_advanced_datatable.dart';
import 'package:hoop/components/player_widgets/datatables/player_stats_game_splits_base_datatable.dart';
import 'package:hoop/components/player_widgets/datatables/player_stats_game_splits_misc_datatable.dart';
import 'package:hoop/components/player_widgets/datatables/player_stats_game_splits_usage_datatable.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class PlayerSplitsGameTable extends StatelessWidget {
  final String playerId;
  final String measure;
  final String per;

  PlayerSplitsGameTable({this.playerId, this.measure, this.per});

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

    // if (Provider.of<JsonFiles>(context, listen: false)
    //         .getPlayerSplitsGame(playerId) ==
    //     null) {
    json = Network.getJsonFromNbaStats(Urls.getNbaStatsPlayerSplitsGame(
        playerId,
        measureType: measure,
        perMode: per));

    //   Provider.of<JsonFiles>(context, listen: false)
    //       .setPlayerSplitsGame(playerId, json);
    // } else {
    //   json = Provider.of<JsonFiles>(context, listen: false)
    //       .getPlayerSplitsGame(playerId);
    // }

    return json;
  }
}
