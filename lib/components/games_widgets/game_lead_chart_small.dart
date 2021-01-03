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
    List<LeadTrackerItem> list = new List<LeadTrackerItem>();
    for (var p in pbp) {
      LeadTrackerItem item = new LeadTrackerItem(
          clock: p["clock"],
          period: 1,
          vScore: int.parse(p["vTeamScore"]),
          hScore: int.parse(p["hTeamScore"]),
          isScoreChange: p["isScoreChange"]);
      if (item.isScoreChange) {
        list.add(item);
      }
      // print('test');
    }

    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(15),
        // decoration: BoxDecoration(
        //     border: Border.all(color: Colors.grey, width: 1),
        //     borderRadius: BorderRadius.circular(16)),
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
      List<LeadTrackerItem> items, String vTeamId, String hTeamId) {
    var vTeamColor = ConstantHelper.getTeamColor(vTeamId);
    //var vTeamTextColor = ConstantHelper.getTeamTextColor(vTeamId);
    var hTeamColor = ConstantHelper.getTeamColor(hTeamId);
    //var hTeamTextColor = ConstantHelper.getTeamTextColor(hTeamId);
    List<Widget> list = new List<Widget>();

    for (var t in items) {
      var lead = t.vScore - t.hScore;
      bool vLead = false;
      bool hLead = false;
      bool tie = false;

      if (lead > 0) {
        vLead = true;
      } else if (lead < 0) {
        hLead = true;
        lead *= -1;
      } else {
        tie = true;
      }

      list.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 40, child: Text(t.clock.replaceAll("00:", ""))),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey[200], width: 1))),
              alignment: Alignment.centerRight,
              width: 135,
              height: 15,
              child: vLead
                  ? Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(lead.toString()),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        width: getLeadWidth(lead),
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
              child: hLead
                  ? Row(children: [
                      Container(
                        width: getLeadWidth(lead),
                        color: Color(hTeamColor),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        lead.toString(),
                      ),
                    ])
                  : Text('')),
        ],
      ));
    }
    return list.length > 9 ? list.sublist(list.length - 10) : list;
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
