import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/games_widgets/quarter_scores.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/advanced_stats.dart';
import 'package:hoop/models/game_data.dart';

class GameStats extends StatelessWidget {
  final GameData game;

  GameStats({this.game});

  @override
  Widget build(BuildContext context) {
    if (game == null) {
      return Center(
        child: Text("No data available..."),
      );
    }
    //dynamic vTeam = gameData["awayTeam"]["totals"];
    //dynamic hTeam = gameData["homeTeam"]["totals"];
    TeamStatistics vTeam = game.awayTeam.statistics;
    TeamStatistics hTeam = game.homeTeam.statistics;

    AdvancedStats st = AdvancedStats(stats: game);

    //print('teatstst');

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          QuarterScores(
            game: game,
          ),
          SizedBox(
            height: 15,
          ),
          headerRow(game),
          SizedBox(
            height: 10,
          ),
          statsRow(vTeam.fieldGoalsPercentage.toStringAsFixed(2),
              hTeam.fieldGoalsPercentage.toStringAsFixed(2), "FG %", true),
          statsRow(vTeam.freeThrowsPercentage.toStringAsFixed(2),
              hTeam.freeThrowsPercentage.toStringAsFixed(2), "FT %", true),
          statsRow(vTeam.threePointersPercentage.toStringAsFixed(2),
              hTeam.threePointersPercentage.toStringAsFixed(2), "3P %", true),
          statsRow(st.vTeam.tsPct, st.hTeam.tsPct, "TS %", true),
          statsRow(st.vTeam.efg, st.hTeam.efg, "eFG %", true),
          statsRow(vTeam.reboundsTotal.toString(),
              hTeam.reboundsTotal.toString(), "Rebounds"),
          statsRow(
              vTeam.assists.toString(), hTeam.assists.toString(), "Assists"),
          statsRow(vTeam.steals.toString(), hTeam.steals.toString(), "Steals"),
          statsRow(vTeam.blocks.toString(), hTeam.blocks.toString(), "Blocks"),
          statsRow(
              vTeam.turnovers.toString(), hTeam.turnovers.toString(), "TOs"),
          statsRow(st.vTeam.tovPct, st.hTeam.tovPct, "TOV %", true),
          statsRow(vTeam.foulsPersonal.toString(),
              hTeam.foulsPersonal.toString(), "Fouls"),
          statsRow(vTeam.fastBreakPointsMade.toString(),
              hTeam.fastBreakPointsMade.toString(), "Fast Break Pts"),
          statsRow(vTeam.pointsInThePaint.toString(),
              hTeam.pointsInThePaint.toString(), "Pts in Paint"),
          statsRow(vTeam.biggestLead.toString(), hTeam.biggestLead.toString(),
              "Biggest Lead"),
          statsRow(vTeam.biggestScoringRun.toString(),
              hTeam.biggestScoringRun.toString(), "Longest Run"),
          statsRow(vTeam.secondChancePointsMade.toString(),
              hTeam.secondChancePointsMade.toString(), "2nd Chance Pts"),
          statsRow(vTeam.pointsFromTurnovers.toString(),
              hTeam.pointsFromTurnovers.toString(), "Pts off TOs"),
          statsRow(st.vTeam.ppp, st.hTeam.ppp, "PPP"),
          statsRow(st.vTeam.getORtg(), st.hTeam.getORtg(), "ORtg"),
          statsRow(st.vTeam.getDRtg(st.hTeam.points),
              st.hTeam.getDRtg(st.vTeam.points), "DRtg"),
          statsRowText(
              "${vTeam.fieldGoalsMade.toString()}/${vTeam.fieldGoalsAttempted.toString()}",
              "${hTeam.fieldGoalsMade.toString()}/${hTeam.fieldGoalsAttempted.toString()}",
              "FGs"),
          statsRowText(
              "${vTeam.freeThrowsMade.toString()}/${vTeam.freeThrowsAttempted.toString()}",
              "${hTeam.freeThrowsMade.toString()}/${hTeam.freeThrowsAttempted.toString()}",
              "FTs"),
          statsRowText(
              "${vTeam.threePointersMade.toString()}/${vTeam.threePointersAttempted.toString()}",
              "${hTeam.threePointersMade.toString()}/${hTeam.threePointersAttempted.toString()}",
              "3Ps"),
          statsRowText(st.getVTeamPoss(), st.getHTeamPoss(), "Poss"),
          //statsRowText(st.getVTeamPace(), st.getHTeamPace(), "Pace"),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget headerRow(GameData game) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: 55,
          child: CachedLogo(
            url: ConstantHelper.getTeamLogo(game.awayTeam.teamId.toString()),
            radius: 20,
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          width: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lead Changes: ',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    game.homeTeam.statistics.leadChanges.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ties: ',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    game.homeTeam.statistics.timesTied.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          width: 55,
          child: CachedLogo(
            url: ConstantHelper.getTeamLogo(game.homeTeam.teamId.toString()),
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
          width: 100,
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

  Widget statsRowText(String val1, String val2, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //alignment: Alignment.centerRight,
          padding: EdgeInsets.all(5),
          width: 75,
          child: Center(
              child: Text(
            val1,
            style: TextStyle(fontSize: 18),
          )),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          padding: EdgeInsets.all(5),
          width: 100,
          child: Center(child: Text(name, style: TextStyle(fontSize: 14))),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          padding: EdgeInsets.all(5),
          width: 75,
          child: Center(
              child: Text(
            val2,
            style: TextStyle(fontSize: 18),
          )),
        ),
      ],
    );
  }

  String getPPP(String fgaString, String ftaString, String turnoversString,
      String pointsString) {
    double fga = double.parse(fgaString);
    double fta = double.parse(ftaString);
    double tos = double.parse(turnoversString);
    int points = int.parse(pointsString);

    double ppp = points / (fga + (0.44 * fta) + tos);

    return ppp.toStringAsFixed(2);
  }

  String getORtg(String fgaString, String ftaString, String turnoversString,
      String pointsString) {
    double fga = double.parse(fgaString);
    double fta = double.parse(ftaString);
    double tos = double.parse(turnoversString);
    int points = int.parse(pointsString);

    double ortg = 100 * points / (fga + (0.44 * fta) + tos);

    return ortg.toStringAsFixed(2);
  }

  String getDRtg(String fgaString, String ftaString, String turnoversString,
      String opponentsPointsString) {
    double fga = double.parse(fgaString);
    double fta = double.parse(ftaString);
    double tos = double.parse(turnoversString);
    int points = int.parse(opponentsPointsString);

    double drtg = 100 * points / (fga + (0.44 * fta) + tos);

    return drtg.toStringAsFixed(2);
  }

  String getTSPct(String fgaString, String ftaString, String pointsString) {
    double fga = double.parse(fgaString);
    double fta = double.parse(ftaString);
    int points = int.parse(pointsString);

    double ts = 100 * 0.5 * points / (fga + (0.44 * fta));

    return ts.toStringAsFixed(1);
  }

  String getEfg(String fgaString, String tpmString, String fgmString) {
    int fga = int.parse(fgaString);
    int fgm = int.parse(fgmString);
    int tpm = int.parse(tpmString);

    double efg = fgm + (tpm * 0.5) / fga;

    return efg.toStringAsFixed(1);
  }

  String getTovPct(String fgaString, String ftaString, String turnoversString) {
    int fga = int.parse(fgaString);
    int fta = int.parse(ftaString);
    int tov = int.parse(turnoversString);

    double tovPct = 100 * tov / (fga + 0.44 * fta + tov);

    return tovPct.toStringAsFixed(1);
  }
}
