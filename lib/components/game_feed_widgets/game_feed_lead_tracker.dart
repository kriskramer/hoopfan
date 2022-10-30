import 'package:flutter/material.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_lead_trend.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';
import 'package:hoop/models/lead_tracker.dart';

class GameFeedLeadTracker extends StatelessWidget {
  final dynamic game;
  final PbpItem pbp;

  const GameFeedLeadTracker(this.game, this.pbp);

  @override
  Widget build(BuildContext context) {
    var vTeamColor =
        ConstantHelper.getTeamColor(game["awayTeam"]["teamId"].toString());
    var hTeamColor =
        ConstantHelper.getTeamColor(game["homeTeam"]["teamId"].toString());

    LeadTrackerItem lti = new LeadTrackerItem(
        clock: pbp.clock,
        period: pbp.period,
        vScore: pbp.vTeamScore,
        hScore: pbp.hTeamScore,
        isScoreChange: true);

    return Row(children: [
      lti.isVisitorLead()
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
      Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300]),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GameFeedLeadTrend(game)),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.centerRight,
                  width: 100,
                  height: 12,
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
                  width: 100,
                  height: 12,
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
      lti.isHomeLead()
          ? Row(children: [
              SizedBox(
                width: 12,
              ),
              Text(lti.getLead().toString(),
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ])
          : Text(''),
    ]);
  }

  double getLeadWidth(int lead) {
    // Eventually, this will return a value that uses an algorithm to shrink the larger lead sizes to help it fix on the screen.
    var width = lead * 3.01;
    if (width > 90) {
      width = 90;
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
    if (period == "5") {
      return "OT 1";
    } else if (period == "6") {
      return "OT 2";
    } else
      return period.toString();
  }
}
