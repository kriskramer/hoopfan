import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/player_widgets/datatables/player_stats_advanced_datatable.dart';
import 'package:hoop/components/player_widgets/datatables/player_stats_base_datatable.dart';
import 'package:hoop/components/player_widgets/datatables/player_stats_misc_datatable.dart';
import 'package:hoop/components/player_widgets/datatables/player_stats_scoring_datatable.dart';
import 'package:hoop/components/player_widgets/datatables/player_stats_usage_datatable.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class PlayerClutchStatsTable extends StatelessWidget {
  final String playerId;
  final String measure;
  final String per;

  PlayerClutchStatsTable({this.playerId, this.measure, this.per});

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
      return PlayerStatsBaseDataTable(json: json);
    } else if (measure == "Advanced") {
      return PlayerStatsAdvancedDataTable(json: json);
    } else if (measure == "Misc") {
      return PlayerStatsMiscDataTable(json: json);
    } else if (measure == "Four Factors") {
      return Text('No data');
    } else if (measure == "Scoring") {
      return PlayerStatsScoringDataTable(json: json);
    } else if (measure == "Opponent") {
      return Text('No data');
    } else if (measure == "Usage") {
      return PlayerStatsUsageDataTable(json: json);
    }
    return null;
  }

  Future<dynamic> loadData(BuildContext context) async {
    dynamic json;

    // if (Provider.of<JsonFiles>(context, listen: false)
    //         .getPlayerClutchStats(playerId) ==
    //     null) {
    json = Network.getJsonFromNbaStats(Urls.getNbaStatsPlayerClutchStats(
        playerId,
        measureType: measure,
        perMode: per));

    //   Provider.of<JsonFiles>(context, listen: false)
    //       .setPlayerClutchStats(playerId, json);
    // } else {
    //   json = Provider.of<JsonFiles>(context, listen: false)
    //       .getPlayerClutchStats(playerId);
    // }

    return json;
  }
}
