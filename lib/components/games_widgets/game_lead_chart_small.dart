import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import '../../model/lead_tracker.dart';

class GameLeadChartSmall extends StatelessWidget {
  final dynamic pbp;
  final String vTeamId;
  final String hTeamId;
  final String period;

  GameLeadChartSmall({this.pbp, this.vTeamId, this.hTeamId, this.period});

  @override
  Widget build(BuildContext context) {
    LeadTrackerList list = new LeadTrackerList();
    list.importPbp(pbp, int.parse(period));

    return Container(
        child: Column(children: [
      Text(
        'Lead Tracker - Period ' + period,
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(
        height: 15,
      ),
      ...getLeadTrackerRows(list, vTeamId, hTeamId)
    ]));
  }

  List<Widget> getLeadTrackerRows(
      LeadTrackerList list, String vTeamId, String hTeamId) {
    var vTeamColor = ConstantHelper.getTeamColor(vTeamId);
    var hTeamColor = ConstantHelper.getTeamColor(hTeamId);
    List<Widget> rows = new List<Widget>();

    for (var t in list.items) {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 40, child: Text(t.clock.replaceAll("00:", ""))),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey[200], width: 1))),
              alignment: Alignment.centerRight,
              width: 125,
              height: 15,
              child: t.isVisitorLead()
                  ? Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(t.getLead().toString()),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        width: getLeadWidth(t.getLead()),
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
              width: 125,
              height: 15,
              child: t.isHomeLead()
                  ? Row(children: [
                      Container(
                        width: getLeadWidth(t.getLead()),
                        color: Color(hTeamColor),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        t.getLead().toString(),
                      ),
                    ])
                  : Text('')),
        ],
      ));
    }
    return rows.length > 9 ? rows.sublist(rows.length - 10) : rows;
  }

  double getLeadWidth(int lead) {
    // Eventually, this will return a value that uses an algorithm to shrink the larger lead sizes to help it fix on the screen.
    var width = lead * 2.01;

    if (width > 119) {
      return 115.0;
    } else {
      return width;
    }
    // if (lead < 10) {
    //   return lead * 5.1;
    // } else if (lead < 20) {
    //   return lead * 4.1;
    // } else if (lead < 30) {
    //   return lead * 2.9;
    // } else
    //   return lead * 1.9;
  }
}
