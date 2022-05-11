import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/games_widgets/quarter_scores.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/advanced_stats.dart';

class GameStats extends StatelessWidget {
  final dynamic stats;
  final dynamic gameData;

  GameStats({this.stats, this.gameData});

  @override
  Widget build(BuildContext context) {
    dynamic vTeam = stats["vTeam"]["totals"];
    dynamic hTeam = stats["hTeam"]["totals"];

    AdvancedStats st = AdvancedStats(stats: stats);

    //print('teatstst');

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          QuarterScores(
            game: gameData,
          ),
          SizedBox(
            height: 15,
          ),
          headerRow(gameData),
          SizedBox(
            height: 10,
          ),
          statsRow(vTeam["fgp"], hTeam["fgp"], "FG %", true),
          statsRow(vTeam["ftp"], hTeam["ftp"], "FT %", true),
          statsRow(vTeam["tpp"], hTeam["tpp"], "3P %", true),
          statsRow(st.vTeam.tsPct, st.hTeam.tsPct, "TS %", true),
          statsRow(st.vTeam.efg, st.hTeam.efg, "eFG %", true),
          statsRow(vTeam["totReb"], hTeam["totReb"], "Rebounds"),
          statsRow(vTeam["assists"], hTeam["assists"], "Assists"),
          statsRow(vTeam["steals"], hTeam["steals"], "Steals"),
          statsRow(vTeam["blocks"], hTeam["blocks"], "Blocks"),
          statsRow(vTeam["turnovers"], hTeam["turnovers"], "TOs"),
          statsRow(st.vTeam.tovPct, st.hTeam.tovPct, "TOV %", true),
          statsRow(vTeam["pFouls"], hTeam["pFouls"], "Fouls"),
          statsRow(stats["vTeam"]["fastBreakPoints"],
              stats["hTeam"]["fastBreakPoints"], "Fast Break Pts"),
          statsRow(stats["vTeam"]["pointsInPaint"],
              stats["hTeam"]["pointsInPaint"], "Pts in Paint"),
          statsRow(stats["vTeam"]["biggestLead"], stats["hTeam"]["biggestLead"],
              "Biggest Lead"),
          statsRow(stats["vTeam"]["longestRun"], stats["hTeam"]["longestRun"],
              "Longest Run"),
          statsRow(stats["vTeam"]["secondChancePoints"],
              stats["hTeam"]["secondChancePoints"], "2nd Chance Pts"),
          statsRow(stats["vTeam"]["pointsOffTurnovers"],
              stats["hTeam"]["pointsOffTurnovers"], "Pts off TOs"),
          statsRow(st.vTeam.ppp, st.hTeam.ppp, "PPP"),
          statsRow(st.vTeam.getORtg(), st.hTeam.getORtg(), "ORtg"),
          statsRow(st.vTeam.getDRtg(st.hTeam.points),
              st.hTeam.getDRtg(st.vTeam.points), "DRtg"),
          statsRowText("${vTeam["fgm"]}/${vTeam["fga"]}",
              "${hTeam["fgm"]}/${hTeam["fga"]}", "FGs"),
          statsRowText("${vTeam["ftm"]}/${vTeam["fta"]}",
              "${hTeam["ftm"]}/${hTeam["fta"]}", "FTs"),
          statsRowText("${vTeam["tpm"]}/${vTeam["tpa"]}",
              "${hTeam["tpm"]}/${hTeam["tpa"]}", "3Ps"),
          statsRowText(st.getVTeamPoss(), st.getHTeamPoss(), "Poss"),
          //statsRowText(st.getVTeamPace(), st.getHTeamPace(), "Pace"),
          SizedBox(
            height: 15,
          ),
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
          width: 55,
          child: CachedLogo(
            url: ConstantHelper.getTeamLogo(gameData["vTeam"]["teamId"]),
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
                    stats["leadChanges"],
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
                    stats["timesTied"],
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
