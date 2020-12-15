import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';

class GameStats extends StatelessWidget {
  final dynamic stats;
  final dynamic gameData;

  GameStats({this.stats, this.gameData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              headerRow(gameData),
              statsRow(stats["vTeam"]["totals"]["fgp"],
                  stats["hTeam"]["totals"]["fgp"], "FG %"),
              statsRow(stats["vTeam"]["totals"]["ftp"],
                  stats["hTeam"]["totals"]["ftp"], "FT %"),
              statsRow(stats["vTeam"]["totals"]["tpp"],
                  stats["hTeam"]["totals"]["tpp"], "3P %"),
              statsRow(stats["vTeam"]["totals"]["totReb"],
                  stats["hTeam"]["totals"]["totReb"], "Rebounds"),
              statsRow(stats["vTeam"]["totals"]["assists"],
                  stats["hTeam"]["totals"]["assists"], "Assists"),
              statsRow(stats["vTeam"]["totals"]["steals"],
                  stats["hTeam"]["totals"]["steals"], "Steals"),
              statsRow(stats["vTeam"]["totals"]["blocks"],
                  stats["hTeam"]["totals"]["blocks"], "Blocks"),
              statsRow(stats["vTeam"]["totals"]["turnovers"],
                  stats["hTeam"]["totals"]["turnovers"], "TOs"),
              statsRow(stats["vTeam"]["totals"]["pFouls"],
                  stats["hTeam"]["totals"]["pFouls"], "Fouls"),
              statsRow(stats["vTeam"]["fastBreakPoints"],
                  stats["hTeam"]["fastBreakPoints"], "Fast Break Pts"),
              statsRow(stats["vTeam"]["pointsInPaint"],
                  stats["hTeam"]["pointsInPaint"], "Pts in Paint"),
              statsRow(stats["vTeam"]["biggestLead"],
                  stats["hTeam"]["biggestLead"], "Biggest Lead"),
              statsRow(stats["vTeam"]["longestRun"],
                  stats["hTeam"]["longestRun"], "Longest Run"),
              statsRow(stats["vTeam"]["secondChancePoints"],
                  stats["hTeam"]["secondChancePoints"], "2nd Chance Pts"),
              statsRow(stats["vTeam"]["pointsOffTurnovers"],
                  stats["hTeam"]["pointsOffTurnovers"], "Pts off TOs"),
            ],
          )
        ],
      ),
    );
  }

  Widget headerRow(dynamic game) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: 125,
          child: CachedLogo(
            url: ConstantHelper.getTeamLogo(gameData["vTeam"]["teamId"]),
            radius: 20,
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          width: 125,
          child: Center(child: Text('')),
        ),
        Container(
          padding: EdgeInsets.all(5),
          width: 125,
          child: CachedLogo(
            url: ConstantHelper.getTeamLogo(gameData["hTeam"]["teamId"]),
            radius: 20,
          ),
        ),
      ],
    );
  }

  Widget statsRow(String val1, String val2, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: 125,
          child: Center(
              child: Text(
            val1,
            style: TextStyle(fontSize: 18),
          )),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          padding: EdgeInsets.all(5),
          width: 125,
          child: Center(child: Text(name, style: TextStyle(fontSize: 14))),
        ),
        Container(
          padding: EdgeInsets.all(5),
          width: 125,
          child: Center(child: Text(val2, style: TextStyle(fontSize: 18))),
        ),
      ],
    );
  }
}
