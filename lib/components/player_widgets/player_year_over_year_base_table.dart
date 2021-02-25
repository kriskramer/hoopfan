import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/player_widgets/datatables/player_stats_yearly_base_datatable.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class PlayerYearOverYearBaseTable extends StatelessWidget {
  final String playerId;
  final String measure;
  final String per;

  PlayerYearOverYearBaseTable({this.playerId, this.measure, this.per});

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
                  child: Column(
                    children: [
                      PlayerStatsYearOverYearBaseDataTable(json: json),
                    ],
                  ),
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

  Future<dynamic> loadData(BuildContext context) async {
    dynamic json;
    String key = playerId + "/" + measure + "/" + per;

    json = Provider.of<JsonFiles>(context, listen: false)
        .getPlayerSummaryStats(key);

    if (json == null) {
      json = Network.getJson(
        Urls.getNbaStatsPlayerYearOverYear(playerId,
            measureType: measure, perMode: per),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setPlayerSummaryStats(key, json);
    }

    return json;
  }
}
