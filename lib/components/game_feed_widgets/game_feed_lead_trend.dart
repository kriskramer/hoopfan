import 'package:flutter/material.dart';
import 'package:hoop/components/game_feed_widgets/scoring_trends_dialog2.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/lead_tracker.dart';
import 'package:provider/provider.dart';

class GameFeedLeadTrend extends StatelessWidget {
  final dynamic game;

  const GameFeedLeadTrend(this.game);

  @override
  Widget build(BuildContext context) {
    var vTeamColor = ConstantHelper.getTeamColor(game["vTeam"]["teamId"]);
    var hTeamColor = ConstantHelper.getTeamColor(game["hTeam"]["teamId"]);

    String gameId = game["gameId"];

    var feedList =
        Provider.of<JsonFiles>(context, listen: false).getGameFeed(gameId);

    if (feedList == null) {
      return Text("No data");
    }
    List<Widget> items = [];
    feedList.items.forEach((element) {
      if (element.type != "1") {
        return;
      }
      if (!element.isScoreChange) {
        return;
      }

      LeadTrackerItem lti = new LeadTrackerItem(
          clock: element.clock,
          period: element.period,
          vScore: int.parse(element.vTeamScore),
          hScore: int.parse(element.hTeamScore),
          isScoreChange: true);

      items.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            flex: 18,
            child: Row(
              children: [
                Text(
                  getPeriodText(lti.period.toString()),
                  style: TextStyle(fontSize: 10, color: Colors.blue),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(lti.clock.toString(),
                    style: TextStyle(fontSize: 10, color: Colors.blue)),
              ],
            )),
        Expanded(
          flex: 5,
          child: lti.isVisitorLead()
              ? Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    lti.getLead().toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ])
              : Text(''),
        ),
        Expanded(
          flex: 72,
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return ScoringTrendsDialog2(
                        leadTrackerItem: lti,
                        game: game,
                      );
                    });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.centerRight,
                      width: 90,
                      height: 8,
                      child: lti.isVisitorLead()
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                  Container(
                                    width: getLeadWidth(lti.getLead()),
                                    color: Color(vTeamColor),
                                  ),
                                ])
                          : Text('')),
                  SizedBox(
                    width: 2,
                  ),
                  Container(
                      width: 90,
                      height: 8,
                      child: lti.isHomeLead()
                          ? Row(children: [
                              Container(
                                width: getLeadWidth(lti.getLead()),
                                color: Color(hTeamColor),
                              ),
                            ])
                          : Text('')),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: lti.isHomeLead()
              ? Row(children: [
                  SizedBox(
                    width: 8,
                  ),
                  Text(lti.getLead().toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ])
              : Text(''),
        )
      ]));
    });

    return Scaffold(
      appBar: AppBar(title: Text("Lead Tracker")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [...items],
          ),
        ),
      ),
    );
  }

  double getLeadWidth(int lead) {
    // Eventually, this will return a value that uses an algorithm to shrink the larger lead sizes to help it fix on the screen.
    var width = lead * 2.01;
    if (width > 88) {
      width = 88;
    }
    return width;
    // if (lead < 10) {
    //   return lead * 5.1;
    // } else if (lead < 20) {
    //   return lead * 4.1;
    // } else if (lead < 30) {
    //   return lead * 2.9;
    // } else
    //   return lead * 1.9;
  }

  String getPeriodText(String period) {
    var periodString = "";

    if (period == "1") {
      periodString = "1st";
    } else if (period == "2") {
      periodString = "2nd";
    } else if (period == "3") {
      periodString = "3rd";
    } else if (period == "4") {
      periodString = "4th";
    } else {
      periodString = "OT";
    }

    return periodString;
  }
}
