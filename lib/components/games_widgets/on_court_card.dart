import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/game_box_score_on_court.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/advanced_stats.dart';

class OnCourtCard extends StatefulWidget {
  final dynamic stats;
  final dynamic game;

  OnCourtCard({this.stats, this.game});

  @override
  State<OnCourtCard> createState() => _OnCourtCardState();
}

class _OnCourtCardState extends State<OnCourtCard> {
  bool showVBox = false;
  bool showHBox = false;

  @override
  Widget build(BuildContext context) {
    if (widget.stats == null) {
      return Center(child: Text("No data available..."));
    }

    dynamic vTeam = widget.stats["vTeam"]["totals"];
    dynamic hTeam = widget.stats["hTeam"]["totals"];
    String vTeamId = widget.game["vTeam"]["teamId"];
    String hTeamId = widget.game["hTeam"]["teamId"];
    dynamic players = widget.stats["activePlayers"];
    String vTeamName = ConstantHelper.getTeamName(vTeamId);
    String hTeamName = ConstantHelper.getTeamName(hTeamId);

    String hTeamPlayers = "";
    String vTeamPlayers = "";
    Row vTeamPlayersRow;
    Row hTeamPlayersRow;
    List<Widget> vTeamPlayersWidgets = [];
    List<Widget> hTeamPlayersWidgets = [];

    AdvancedStats st = AdvancedStats(stats: widget.stats);

    for (var p in players) {
      if (p["teamId"] == hTeamId && p["isOnCourt"]) {
        hTeamPlayers += p["lastName"] + ", ";
      }
    }

    for (var p in players) {
      if (p["teamId"] == vTeamId && p["isOnCourt"]) {
        vTeamPlayers += p["lastName"] + ", ";
      }
    }

    if (vTeamPlayers.endsWith(", ")) {
      vTeamPlayers = vTeamPlayers.substring(0, vTeamPlayers.lastIndexOf(","));
    }

    if (hTeamPlayers.endsWith(", ")) {
      hTeamPlayers = hTeamPlayers.substring(0, hTeamPlayers.lastIndexOf(","));
    }

    vTeamPlayersWidgets.add(Text(vTeamPlayers));
    vTeamPlayersWidgets.add(SizedBox(
      width: 8,
    ));
    vTeamPlayersWidgets.add(GestureDetector(
        onTap: () {
          setState(() {
            showVBox = !showVBox;
          });
        },
        child: Icon(Icons.arrow_downward_outlined)));
    vTeamPlayersRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [...vTeamPlayersWidgets],
    );

    hTeamPlayersWidgets.add(Text(hTeamPlayers));
    hTeamPlayersWidgets.add(SizedBox(
      width: 8,
    ));
    hTeamPlayersWidgets.add(GestureDetector(
        onTap: () {
          setState(() {
            showHBox = !showHBox;
          });
        },
        child: Icon(Icons.arrow_downward_rounded)));
    hTeamPlayersRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [...hTeamPlayersWidgets],
    );

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
          //Text(vTeamPlayers),
          //vTeamPlayersRow,
          GameBoxScoreOnCourt(
            game: widget.game,
            stats: widget.stats,
            isHomeTeam: false,
          ),
          SizedBox(
            height: 15,
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
          //hTeamPlayersRow,
          GameBoxScoreOnCourt(
            game: widget.game,
            stats: widget.stats,
            isHomeTeam: true,
          )
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
