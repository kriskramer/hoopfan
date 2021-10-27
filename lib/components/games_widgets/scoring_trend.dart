import 'package:flutter/material.dart';
import 'package:hoop/model/lead_tracker.dart';

import '../../constant.dart';

class ScoringTrend extends StatelessWidget {
  final RecentPoints rp;
  final dynamic game;
  final String vTeamId;
  final String hTeamId;
  final int displayType;

  const ScoringTrend(
      {this.rp, this.game, this.vTeamId, this.hTeamId, this.displayType});

  @override
  Widget build(BuildContext context) {
    if (this.displayType == 1) {
      // Last 10 scoring possessions
      return Container(
          child: Column(
        children: [
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
                  child: Text(game["vTeam"]["triCode"] + "  "), width: 35),
              Container(
                  child: Text(rp.last10vTeamPoints.toString()), width: 22),
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
                  child: Text(game["hTeam"]["triCode"] + "  "), width: 35),
              Container(
                  child: Text(rp.last10hTeamPoints.toString()), width: 22),
              Container(
                  child: Text(''),
                  width: rp.last10hTeamPoints * 1.9,
                  height: 10,
                  color: Color(ConstantHelper.getTeamColor(hTeamId))),
            ],
          ),
        ],
      ));
    } else if (this.displayType == 2) {
      // Last 20 scoring possessions
      return Container(
        child: Column(
          children: [
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
                    child: Text(game["vTeam"]["triCode"] + "  "), width: 35),
                Container(
                    child: Text(rp.last20vTeamPoints.toString()), width: 22),
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
                    child: Text(game["hTeam"]["triCode"] + "  "), width: 35),
                Container(
                    child: Text(rp.last20hTeamPoints.toString()), width: 22),
                Container(
                    child: Text(''),
                    width: rp.last20hTeamPoints * 1.9,
                    height: 10,
                    color: Color(ConstantHelper.getTeamColor(hTeamId))),
              ],
            ),
          ],
        ),
      );
    } else if (this.displayType == 3) {
      // Last 30 scoring possessions
      return Container(
        child: Column(
          children: [
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
                    child: Text(game["vTeam"]["triCode"] + "  "), width: 35),
                Container(
                    child: Text(rp.last30vTeamPoints.toString()), width: 22),
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
                    child: Text(game["hTeam"]["triCode"] + "  "), width: 35),
                Container(
                    child: Text(rp.last30hTeamPoints.toString()), width: 22),
                Container(
                    child: Text(''),
                    width: rp.last30hTeamPoints * 1.9,
                    height: 10,
                    color: Color(ConstantHelper.getTeamColor(hTeamId))),
              ],
            ),
          ],
        ),
      );
    } else if (this.displayType == 4) {
      // Last 5 minutes
      return Container(
        child: Column(
          children: [
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
                    child: Text(game["vTeam"]["triCode"] + "  "), width: 35),
                Container(child: Text(rp.vTeamLast5Min.toString()), width: 22),
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
    } else if (this.displayType == 5) {
      // Last 10 minutes
      return Container(
        child: Column(
          children: [
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
                    child: Text(game["vTeam"]["triCode"] + "  "), width: 35),
                Container(child: Text(rp.vTeamLast10Min.toString()), width: 22),
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
                    child: Text(game["hTeam"]["triCode"] + "  "), width: 35),
                Container(child: Text(rp.hTeamLast10Min.toString()), width: 22),
                Container(
                    child: Text(''),
                    width: rp.hTeamLast10Min * 1.9,
                    height: 10,
                    color: Color(ConstantHelper.getTeamColor(hTeamId))),
              ],
            ),
          ],
        ),
      );
    } else if (this.displayType == 6) {
      // Last 10 minutes
      return Container(
        child: Column(
          children: [
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
                    child: Text(game["vTeam"]["triCode"] + "  "), width: 35),
                Container(child: Text(rp.vTeamLast15Min.toString()), width: 22),
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
                    child: Text(game["hTeam"]["triCode"] + "  "), width: 35),
                Container(child: Text(rp.hTeamLast15Min.toString()), width: 22),
                Container(
                    child: Text(''),
                    width: rp.hTeamLast15Min * 1.9,
                    height: 10,
                    color: Color(ConstantHelper.getTeamColor(hTeamId))),
              ],
            ),
          ],
        ),
      );
    }

    return Container();
  }
}
