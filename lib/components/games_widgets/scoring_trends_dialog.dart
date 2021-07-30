import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/scoring_trend.dart';
//import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/model/lead_tracker.dart';
import 'package:provider/provider.dart';

class ScoringTrendsDialog extends StatelessWidget {
  final LeadTrackerItem leadTrackerItem;
  final dynamic game;

  ScoringTrendsDialog({this.leadTrackerItem, this.game});

  @override
  Widget build(BuildContext context) {
    LeadTrackerList list = LeadTrackerList();

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

    RecentPoints rp = list.getRecentPoints(
        leadTrackerItem.clock, leadTrackerItem.period.toString());

    String vTeamId = game["vTeam"]["teamId"];
    String hTeamId = game["hTeam"]["teamId"];

    return rp.isValid()
        ? Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 8,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'SCORING TRENDS',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                      "From ${leadTrackerItem.clock} remaining in period ${leadTrackerItem.period}..."),
                  SizedBox(
                    height: 10,
                  ),
                  ScoringTrend(
                    rp: rp,
                    game: game,
                    vTeamId: vTeamId,
                    hTeamId: hTeamId,
                    displayType: 1,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ScoringTrend(
                    rp: rp,
                    game: game,
                    vTeamId: vTeamId,
                    hTeamId: hTeamId,
                    displayType: 2,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ScoringTrend(
                    rp: rp,
                    game: game,
                    vTeamId: vTeamId,
                    hTeamId: hTeamId,
                    displayType: 3,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ScoringTrend(
                    rp: rp,
                    game: game,
                    vTeamId: vTeamId,
                    hTeamId: hTeamId,
                    displayType: 4,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ScoringTrend(
                    rp: rp,
                    game: game,
                    vTeamId: vTeamId,
                    hTeamId: hTeamId,
                    displayType: 5,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ScoringTrend(
                    rp: rp,
                    game: game,
                    vTeamId: vTeamId,
                    hTeamId: hTeamId,
                    displayType: 6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        : Dialog(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                  'An error occurred loading the lead tracking data. Please try again in a moment.'),
            ),
          );
  }
}
