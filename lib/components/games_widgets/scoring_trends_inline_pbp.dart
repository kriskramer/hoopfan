import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/model/lead_tracker.dart';
import 'package:provider/provider.dart';
import 'package:hoop/constant.dart';

class ScoringTrendsInlinePbp extends StatelessWidget {
  final dynamic game;

  const ScoringTrendsInlinePbp({this.game});

  @override
  Widget build(BuildContext context) {
    LeadTrackerList list = LeadTrackerList();
    LeadTrackerItem lastItem;

    String gameId = game["gameId"];
    var pbp1 =
        Provider.of<JsonFiles>(context, listen: false).getPbp(gameId + "-1");
    var pbp2 =
        Provider.of<JsonFiles>(context, listen: false).getPbp(gameId + "-2");
    var pbp3 =
        Provider.of<JsonFiles>(context, listen: false).getPbp(gameId + "-3");
    var pbp4 =
        Provider.of<JsonFiles>(context, listen: false).getPbp(gameId + "-4");
    var pbp5 =
        Provider.of<JsonFiles>(context, listen: false).getPbp(gameId + "-5");
    var pbp6 =
        Provider.of<JsonFiles>(context, listen: false).getPbp(gameId + "-6");

    list.importPbp(pbp1, 1);
    list.importPbp(pbp2, 2);
    list.importPbp(pbp3, 3);
    list.importPbp(pbp4, 4);
    list.importPbp(pbp5, 5);
    list.importPbp(pbp6, 6);

    if (list.items.length == 0) {
      return Text("No play-by-play data. Try reloading the screen...");
    } else {
      var lastItemIndex = list.items.length - 1;
      lastItem = list.items[lastItemIndex];

      RecentPoints rp =
          list.getRecentPoints(lastItem.clock, lastItem.period.toString());

      String vTeamId = game["vTeam"]["teamId"];
      String hTeamId = game["hTeam"]["teamId"];

      return Container(
        decoration: BoxDecoration(color: Colors.blueGrey[100]),
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Text(
              "Scoring last 5 minutes:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Text(game["vTeam"]["triCode"] + "  "), width: 35),
                Container(child: Text(rp.vTeamLast5Min.toString()), width: 22),
                Container(
                    child: Text(''),
                    width: rp.vTeamLast5Min * 1.9,
                    height: 10,
                    color: Color(ConstantHelper.getTeamColor(vTeamId))),
                SizedBox(
                  width: 20,
                ),
                Container(
                    child: Text(game["hTeam"]["triCode"] + "  "), width: 35),
                Container(child: Text(rp.hTeamLast5Min.toString()), width: 22),
                Container(
                    child: Text(''),
                    width: rp.hTeamLast5Min * 1.9,
                    height: 10,
                    color: Color(ConstantHelper.getTeamColor(hTeamId))),
              ],
            ),
          ],
        ),
      );
    }
  }
}
