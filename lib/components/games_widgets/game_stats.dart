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
                  stats["hTeam"]["totals"]["fgp"], "FG %", true),
              statsRow(stats["vTeam"]["totals"]["ftp"],
                  stats["hTeam"]["totals"]["ftp"], "FT %", true),
              statsRow(stats["vTeam"]["totals"]["tpp"],
                  stats["hTeam"]["totals"]["tpp"], "3P %", true),
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
          width: 75,
          child: CachedLogo(
            url: ConstantHelper.getTeamLogo(gameData["vTeam"]["teamId"]),
            radius: 20,
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          width: 140,
          child: Center(child: Text('')),
        ),
        Container(
          padding: EdgeInsets.all(5),
          width: 75,
          child: CachedLogo(
            url: ConstantHelper.getTeamLogo(gameData["hTeam"]["teamId"]),
            radius: 20,
          ),
        ),
      ],
    );
  }

  Widget statsRow(String val1, String val2, String name,
      [bool isPercent = false]) {
    var v1 = double.parse(val1);
    var v2 = double.parse(val2);
    var vLead = v1 > v2;
    var hLead = v2 > v1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //alignment: Alignment.centerRight,
          padding: EdgeInsets.all(5),
          width: 75,
          child: Center(
              child: Text(
            val1 + (isPercent ? " %" : ""),
            style: TextStyle(
                fontSize: 18,
                fontWeight: vLead ? FontWeight.bold : FontWeight.normal),
          )),
        ),
        vLead
            ? Container(
                alignment: Alignment.center,
                width: 10,
                child: Icon(
                  Icons.arrow_drop_up,
                  color: Colors.green,
                ))
            : SizedBox(
                width: 10,
              ),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          padding: EdgeInsets.all(5),
          width: 120,
          child: Center(child: Text(name, style: TextStyle(fontSize: 14))),
        ),
        hLead
            ? Container(
                alignment: Alignment.center,
                width: 10,
                child: Icon(
                  Icons.arrow_drop_up,
                  color: Colors.green,
                ))
            : SizedBox(
                width: 10,
              ),
        Container(
          padding: EdgeInsets.all(5),
          width: 75,
          child: Center(
              child: Text(
            val2 + (isPercent ? " %" : ""),
            style: TextStyle(
                fontSize: 18,
                fontWeight: hLead ? FontWeight.bold : FontWeight.normal),
          )),
        ),
      ],
    );
  }
}
