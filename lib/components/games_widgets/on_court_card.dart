import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/game_box_score_on_court.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/advanced_stats.dart';
import 'package:hoop/models/game_data.dart';

class OnCourtCard extends StatefulWidget {
  final GameData game;

  OnCourtCard({this.game});

  @override
  State<OnCourtCard> createState() => _OnCourtCardState();
}

class _OnCourtCardState extends State<OnCourtCard> {
  bool showVBox = false;
  bool showHBox = false;

  @override
  Widget build(BuildContext context) {
    if (widget.game == null) {
      return Center(child: Text("No data available..."));
    }

    var game = widget.game;

    String vTeamName =
        ConstantHelper.getTeamName(game.awayTeam.teamId.toString());
    String hTeamName =
        ConstantHelper.getTeamName(game.homeTeam.teamId.toString());

    String hTeamPlayers = "";
    String vTeamPlayers = "";
    Row vTeamPlayersRow;
    Row hTeamPlayersRow;
    List<Widget> vTeamPlayersWidgets = [];
    List<Widget> hTeamPlayersWidgets = [];

    for (var p in game.homeTeam.players.players) {
      if (p.oncourt == "1") {
        hTeamPlayers += p.familyName + ", ";
      }
    }

    for (var p in game.awayTeam.players.players) {
      if (p.oncourt == "1") {
        vTeamPlayers += p.familyName + ", ";
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

    AdvancedStats st = AdvancedStats(stats: widget.game);

    return Container(
      child: Column(
        children: [
          Card(
            color: Color(
                ConstantHelper.getTeamColor(game.awayTeam.teamId.toString())),
            elevation: 1,
            child: Container(
                padding: EdgeInsets.all(2),
                //width: deviceWidth - 80,
                child: Center(
                    child: Text(vTeamName,
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(ConstantHelper.getTeamTextColor(
                                game.awayTeam.teamId.toString())))))),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                smallStat(
                    "FG %",
                    game.awayTeam.statistics.fieldGoalsPercentage
                        .toStringAsFixed(2)),
                smallStat(
                    "FT %",
                    game.awayTeam.statistics.freeThrowsPercentage
                        .toStringAsFixed(2)),
                smallStat(
                    "3P %",
                    game.awayTeam.statistics.threePointersPercentage
                        .toStringAsFixed(2)),
                smallStat("TS %", st.vTeam.tsPct.toString()),
                smallStat("eFG %", st.vTeam.efg.toString().toString()),
                smallStat(
                    "TOs", game.awayTeam.statistics.turnoversTeam.toString()),
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
            isHomeTeam: false,
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            color: Color(
                ConstantHelper.getTeamColor(game.homeTeam.teamId.toString())),
            elevation: 1,
            child: Container(
                padding: EdgeInsets.all(2),
                //width: deviceWidth - 80,
                child: Center(
                    child: Text(hTeamName,
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(ConstantHelper.getTeamTextColor(
                                game.homeTeam.teamId.toString())))))),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                smallStat(
                    "FG %",
                    game.homeTeam.statistics.fieldGoalsPercentage
                        .toStringAsFixed(2)),
                smallStat(
                    "FT %",
                    game.homeTeam.statistics.freeThrowsPercentage
                        .toStringAsFixed(2)),
                smallStat(
                    "3P %",
                    game.homeTeam.statistics.threePointersPercentage
                        .toStringAsFixed(2)),
                smallStat("TS %", st.hTeam.tsPct.toString()),
                smallStat("eFG %", st.hTeam.efg.toString()),
                smallStat(
                    "TOs", game.homeTeam.statistics.turnoversTeam.toString()),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          //hTeamPlayersRow,
          GameBoxScoreOnCourt(
            game: widget.game,
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
