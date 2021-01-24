import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/lead_tracker_dialog.dart';
import 'package:hoop/components/games_widgets/pbp_dialog.dart';
import 'package:hoop/components/games_widgets/pbp_period_view.dart';
import 'package:hoop/constant.dart';
import '../../model/lead_tracker.dart';

class GameLeadChart extends StatelessWidget {
  final dynamic pbp;
  final String vTeamId;
  final String hTeamId;
  final String period;
  final dynamic game;

  GameLeadChart({this.pbp, this.vTeamId, this.hTeamId, this.period, this.game});

  @override
  Widget build(BuildContext context) {
    LeadTrackerList list = new LeadTrackerList();
    list.importPbp(pbp, int.parse(period));

    return Container(
        //padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(15),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Lead Tracker - P' + getPeriodText(period),
              ),
              FlatButton(
                child: Text(
                  'View Play-by-Play',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return PbpDialog(
                          pbp: pbp,
                          game: game,
                        );
                      });
                },
              ),
              FlatButton(
                child: Text(
                  'Video',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PbpPeriodView(
                        gameId: game["gameId"],
                        period: period,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ...getLeadTrackerRows(list, vTeamId, hTeamId, context)
        ]));
  }

  List<Widget> getLeadTrackerRows(LeadTrackerList list, String vTeamId,
      String hTeamId, BuildContext context) {
    var vTeamColor = ConstantHelper.getTeamColor(vTeamId);
    var hTeamColor = ConstantHelper.getTeamColor(hTeamId);

    List<Widget> rows = new List<Widget>();

    for (var lti in list.items) {
      rows.add(GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return LeadTrackerDialog(
                  leadTrackerItem: lti,
                  game: game,
                );
              });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 40, child: Text(lti.clock.replaceAll("00:", ""))),
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey[200], width: 1))),
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
      ));
    }

    return rows;
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
