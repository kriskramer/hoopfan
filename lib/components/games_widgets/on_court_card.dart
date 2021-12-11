import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/model/advanced_stats.dart';

class OnCourtCard extends StatelessWidget {
  final dynamic stats;
  final dynamic game;

  OnCourtCard({this.stats, this.game});

  @override
  Widget build(BuildContext context) {
    dynamic vTeam = stats["vTeam"]["totals"];
    dynamic hTeam = stats["hTeam"]["totals"];
    String vTeamId = game["vTeam"]["teamId"];
    String hTeamId = game["hTeam"]["teamId"];
    dynamic players = stats["activePlayers"];
    String vTeamName = ConstantHelper.getTeamName(vTeamId);
    String hTeamName = ConstantHelper.getTeamName(hTeamId);

    String hTeamPlayers = "";
    String vTeamPlayers = "";

    AdvancedStats st = AdvancedStats(stats: stats);

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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                smallStat("FG %", vTeam["fgp"]),
                smallStat("FT %", vTeam["ftp"]),
                smallStat("3P %", vTeam["tpp"]),
                smallStat("TS %", st.vTeam.tsPct),
                smallStat("eFG %", st.vTeam.efg),
                smallStat("TOs", vTeam["turnovers"]),
              ],
            ),
          ),
          SizedBox(
            height: 5,
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                smallStat("FG %", hTeam["fgp"]),
                smallStat("FT %", hTeam["ftp"]),
                smallStat("3P %", hTeam["tpp"]),
                smallStat("TS %", st.hTeam.tsPct),
                smallStat("eFG %", st.hTeam.efg),
                smallStat("TOs", hTeam["turnovers"]),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(hTeamPlayers),
        ],
      ),
    );
  }

  Widget smallStat(String label, String value) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey[700], fontSize: 10),
          ),
          SizedBox(
            width: 4,
          ),
          Text(value,
              style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 14,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
