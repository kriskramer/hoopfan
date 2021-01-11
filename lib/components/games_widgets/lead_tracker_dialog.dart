import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/model/lead_tracker.dart';
import 'package:provider/provider.dart';

class LeadTrackerDialog extends StatelessWidget {
  final LeadTrackerItem leadTrackerItem;
  final dynamic game;

  LeadTrackerDialog({this.leadTrackerItem, this.game});

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
                  Text(
                    "Last 10 scoring possessions:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                          child: Text(game["vTeam"]["triCode"] + "  "),
                          width: 35),
                      Container(
                          child: Text(rp.last10vTeamPoints.toString()),
                          width: 22),
                      Container(
                          child: Text(''),
                          width: rp.last10vTeamPoints * 1.9,
                          height: 10,
                          color: Color(ConstantHelper.getTeamColor(vTeamId))),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          child: Text(game["hTeam"]["triCode"] + "  "),
                          width: 35),
                      Container(
                          child: Text(rp.last10hTeamPoints.toString()),
                          width: 22),
                      Container(
                          child: Text(''),
                          width: rp.last10hTeamPoints * 1.9,
                          height: 10,
                          color: Color(ConstantHelper.getTeamColor(hTeamId))),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Last 20 scoring possessions:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                          child: Text(game["vTeam"]["triCode"] + "  "),
                          width: 35),
                      Container(
                          child: Text(rp.last20vTeamPoints.toString()),
                          width: 22),
                      Container(
                          child: Text(''),
                          width: rp.last20vTeamPoints * 1.9,
                          height: 10,
                          color: Color(ConstantHelper.getTeamColor(vTeamId))),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          child: Text(game["hTeam"]["triCode"] + "  "),
                          width: 35),
                      Container(
                          child: Text(rp.last20hTeamPoints.toString()),
                          width: 22),
                      Container(
                          child: Text(''),
                          width: rp.last20hTeamPoints * 1.9,
                          height: 10,
                          color: Color(ConstantHelper.getTeamColor(hTeamId))),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Last 30 scoring possessions:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                          child: Text(game["vTeam"]["triCode"] + "  "),
                          width: 35),
                      Container(
                          child: Text(rp.last30vTeamPoints.toString()),
                          width: 22),
                      Container(
                          child: Text(''),
                          width: rp.last30vTeamPoints * 1.9,
                          height: 10,
                          color: Color(ConstantHelper.getTeamColor(vTeamId))),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          child: Text(game["hTeam"]["triCode"] + "  "),
                          width: 35),
                      Container(
                          child: Text(rp.last30hTeamPoints.toString()),
                          width: 22),
                      Container(
                          child: Text(''),
                          width: rp.last30hTeamPoints * 1.9,
                          height: 10,
                          color: Color(ConstantHelper.getTeamColor(hTeamId))),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Last 5 minutes:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                          child: Text(game["vTeam"]["triCode"] + "  "),
                          width: 35),
                      Container(
                          child: Text(rp.vTeamLast5Min.toString()), width: 22),
                      Container(
                          child: Text(''),
                          width: rp.vTeamLast5Min * 1.9,
                          height: 10,
                          color: Color(ConstantHelper.getTeamColor(vTeamId))),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          child: Text(game["hTeam"]["triCode"] + "  "),
                          width: 35),
                      Container(
                          child: Text(rp.hTeamLast5Min.toString()), width: 22),
                      Container(
                          child: Text(''),
                          width: rp.hTeamLast5Min * 1.9,
                          height: 10,
                          color: Color(ConstantHelper.getTeamColor(hTeamId))),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Last 10 minutes:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                          child: Text(game["vTeam"]["triCode"] + "  "),
                          width: 35),
                      Container(
                          child: Text(rp.vTeamLast10Min.toString()), width: 22),
                      Container(
                          child: Text(''),
                          width: rp.vTeamLast10Min * 1.9,
                          height: 10,
                          color: Color(ConstantHelper.getTeamColor(vTeamId))),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          child: Text(game["hTeam"]["triCode"] + "  "),
                          width: 35),
                      Container(
                          child: Text(rp.hTeamLast10Min.toString()), width: 22),
                      Container(
                          child: Text(''),
                          width: rp.hTeamLast10Min * 1.9,
                          height: 10,
                          color: Color(ConstantHelper.getTeamColor(hTeamId))),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Last 15 minutes:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                          child: Text(game["vTeam"]["triCode"] + "  "),
                          width: 35),
                      Container(
                          child: Text(rp.vTeamLast15Min.toString()), width: 22),
                      Container(
                          child: Text(''),
                          width: rp.vTeamLast15Min * 1.9,
                          height: 10,
                          color: Color(ConstantHelper.getTeamColor(vTeamId))),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          child: Text(game["hTeam"]["triCode"] + "  "),
                          width: 35),
                      Container(
                          child: Text(rp.hTeamLast15Min.toString()), width: 22),
                      Container(
                          child: Text(''),
                          width: rp.hTeamLast15Min * 1.9,
                          height: 10,
                          color: Color(ConstantHelper.getTeamColor(hTeamId))),
                    ],
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
