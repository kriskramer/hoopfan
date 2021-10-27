import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/player_widgets/datatables/player_stats_shooting_splits_datatable.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class PlayerSplitsShootingTable extends StatelessWidget {
  final String playerId;
  final String measure;
  final String per;

  PlayerSplitsShootingTable({this.playerId, this.measure, this.per});

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
    //if (measure == "Base") {
    return PlayerStatsShootingSplitsDataTable(json: json);
    // } else if (measure == "Advanced") {
    //   return PlayerStatsGameSplitsAdvancedDataTable(json: json);
    // } else if (measure == "Misc") {
    //   return PlayerStatsGameSplitsMiscDataTable(json: json);
    // } else if (measure == "Four Factors") {
    //   return Text('No data');
    // } else if (measure == "Scoring") {
    //   return PlayerStatsGameSplitsScoringDataTable(json: json);
    // } else if (measure == "Opponent") {
    //   return Text('No data');
    // } else if (measure == "Usage") {
    //   return PlayerStatsGameSplitsUsageDataTable(json: json);
    // }
    // return null;
  }

  Future<dynamic> loadData(BuildContext context) async {
    dynamic json;
    // print(playerId);

    // if (Provider.of<JsonFiles>(context, listen: false)
    //         .getPlayerSplitsGeneral(playerId) ==
    //     null) {
    json = Network.getJson(
      Urls.getNbaStatsPlayerSplitsGeneral(playerId,
          measureType: measure, perMode: per),
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
