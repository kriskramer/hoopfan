import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/scoring_trends_dialog.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';
import 'package:hoop/models/lead_tracker.dart';

class GameFeedLeadTracker extends StatelessWidget {
  final dynamic game;
  final PbpItem pbp;

  const GameFeedLeadTracker(this.game, this.pbp);

  @override
  Widget build(BuildContext context) {
    var vTeamColor = ConstantHelper.getTeamColor(game["vTeam"]["teamId"]);
    var hTeamColor = ConstantHelper.getTeamColor(game["hTeam"]["teamId"]);

    LeadTrackerItem lti = new LeadTrackerItem(
        clock: pbp.clock,
        period: pbp.period,
        vScore: int.parse(pbp.vTeamScore),
        hScore: int.parse(pbp.hTeamScore),
        isScoreChange: true);

    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       return ScoringTrendsDialog(
          //         leadTrackerItem: lti,
          //         game: game,
          //       );
          //     });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //     width: 40,
            //     child: Text(
            //       lti.clock.replaceAll("00:", ""),
            //       style: TextStyle(color: Colors.blue, fontSize: 12),
            //     )),
            Container(
                alignment: Alignment.centerRight,
                width: 135,
                height: 15,
                child: lti.isVisitorLead()
                    ? Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text(lti.getLead().toString()),
                        SizedBox(
                          width: 4,
                        ),
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
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey[200], width: 1))),
                width: 135,
                height: 15,
                child: lti.isHomeLead()
                    ? Row(children: [
                        Container(
                          width: getLeadWidth(lti.getLead()),
                          color: Color(hTeamColor),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          lti.getLead().toString(),
                        ),
                      ])
                    : Text('')),
          ],
        ),
      ),
    );
  }

  double getLeadWidth(int lead) {
    // Eventually, this will return a value that uses an algorithm to shrink the larger lead sizes to help it fix on the screen.
    return lead * 2.01;
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
