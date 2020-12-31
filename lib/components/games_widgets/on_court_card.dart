import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';

class OnCourtCard extends StatelessWidget {
  final dynamic stats;
  final dynamic game;

  OnCourtCard({this.stats, this.game});

  @override
  Widget build(BuildContext context) {
    //var s = stats;

    String vTeamId = game["vTeam"]["teamId"];
    String hTeamId = game["hTeam"]["teamId"];
    dynamic players = stats["activePlayers"];
    String vTeamName = ConstantHelper.getTeamName(vTeamId);
    String hTeamName = ConstantHelper.getTeamName(hTeamId);

    String hTeamPlayers = "";
    String vTeamPlayers = "";

    for (var p in players) {
      if (p["teamId"] == hTeamId && p["isOnCourt"]) {
        //hTeamPlayers.add(p);
        hTeamPlayers += p["lastName"] + ", ";
      }
    }

    for (var p in players) {
      if (p["teamId"] == vTeamId && p["isOnCourt"]) {
        //vTeamPlayers.add(p);
        vTeamPlayers += p["lastName"] + ", ";
      }
    }

    return Container(
      child: Column(
        children: [
          Card(
            color: Color(ConstantHelper.getTeamColor(vTeamId)),
            elevation: 1,
            child: Container(
                padding: EdgeInsets.all(2),
                //width: deviceWidth - 80,
                child: Center(
                    child: Text(vTeamName,
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(
                                ConstantHelper.getTeamTextColor(vTeamId)))))),
          ),
          Text(vTeamPlayers),
          SizedBox(
            height: 10,
          ),
          Card(
            color: Color(ConstantHelper.getTeamColor(hTeamId)),
            elevation: 1,
            child: Container(
                padding: EdgeInsets.all(2),
                //width: deviceWidth - 80,
                child: Center(
                    child: Text(hTeamName,
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(
                                ConstantHelper.getTeamTextColor(hTeamId)))))),
          ),
          Text(hTeamPlayers),
        ],
      ),
    );
  }
}
