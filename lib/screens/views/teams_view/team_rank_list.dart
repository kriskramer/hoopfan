import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class TeamRankList extends StatefulWidget {
  final String measure;
  final String label;
  final String statName;
  final String teamId;

  const TeamRankList(this.measure, this.label, this.statName, this.teamId);

  @override
  _TeamRankListState createState() => _TeamRankListState();
}

class _TeamRankListState extends State<TeamRankList> {
  dynamic stats;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Team Stat Rankings"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
            future: loadData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Widget> rows = [];

                TeamRankItemList list = TeamRankItemList(
                    stats, widget.statName, widget.label, widget.measure);
                list.doSort();

                for (var l in list.items) {
                  var sameTeam = l.teamId.toString() == widget.teamId;
                  rows.add(Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Text(
                              l.rank.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: sameTeam ? Colors.red : Colors.black),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                l.teamName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color:
                                        sameTeam ? Colors.red : Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        l.value.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: sameTeam ? Colors.red : Colors.black),
                      ),
                    ],
                  ));
                  rows.add(SizedBox(
                    height: 5,
                  ));
                }

                return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        widget.label + ' Rank',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      ...rows
                    ],
                  ),
                );
              } else
                return Container(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      'No Data',
                      style: TextStyle(fontSize: 16),
                    ));
            }),
      ),
    );
  }

  Future<bool> loadData() async {
    if (widget.measure.toUpperCase() == "ESTIMATED") {
      if (Provider.of<JsonFiles>(context, listen: false)
              .getEstimatedTeamStats() ==
          null) {
        stats = await Network.getJson(
          Urls.getNbaStatsEstimatedMetricsAllTeams(),
          requestHeaders: RequestHeaders.nbaStatsHeaders,
        );

        Provider.of<JsonFiles>(context, listen: false)
            .setEstimatedTeamStats(stats);
      } else {
        stats = Provider.of<JsonFiles>(context, listen: false)
            .getEstimatedTeamStats();
      }
    }

    if (widget.measure.toUpperCase() == "ADVANCED") {
      if (Provider.of<JsonFiles>(context, listen: false)
              .getAdvancedTeamStats() ==
          null) {
        stats = await Network.getJson(
          Urls.getNbaStatsTeamStatisticsAdvanced(),
          requestHeaders: RequestHeaders.nbaStatsHeaders,
        );

        Provider.of<JsonFiles>(context, listen: false)
            .setAdvancedTeamStats(stats);
      } else {
        stats = Provider.of<JsonFiles>(context, listen: false)
            .getAdvancedTeamStats();
      }
    }

    if (widget.measure.toUpperCase() == "BASE") {
      if (Provider.of<JsonFiles>(context, listen: false).getBaseTeamStats() ==
          null) {
        stats = await Network.getJson(
          Urls.getNbaStatsTeamStatisticsBase(),
          requestHeaders: RequestHeaders.nbaStatsHeaders,
        );

        Provider.of<JsonFiles>(context, listen: false).setBaseTeamStats(stats);
      } else {
        stats =
            Provider.of<JsonFiles>(context, listen: false).getBaseTeamStats();
      }
    }

    if (widget.measure.toUpperCase() == "MISC") {
      if (Provider.of<JsonFiles>(context, listen: false).getMiscTeamStats() ==
          null) {
        stats = await Network.getJson(
          Urls.getNbaStatsTeamStatisticsMisc(),
          requestHeaders: RequestHeaders.nbaStatsHeaders,
        );

        Provider.of<JsonFiles>(context, listen: false).setMiscTeamStats(stats);
      } else {
        stats =
            Provider.of<JsonFiles>(context, listen: false).getMiscTeamStats();
      }
    }

    if (widget.measure.toUpperCase() == "FOUR FACTORS") {
      if (Provider.of<JsonFiles>(context, listen: false)
              .getFourFactorsTeamStats() ==
          null) {
        stats = await Network.getJson(
          Urls.getNbaStatsTeamStatisticsFourFactors(),
          requestHeaders: RequestHeaders.nbaStatsHeaders,
        );

        Provider.of<JsonFiles>(context, listen: false)
            .setFourFactorsTeamStats(stats);
      } else {
        stats = Provider.of<JsonFiles>(context, listen: false)
            .getFourFactorsTeamStats();
      }
    }

    return true;
  }
}

class TeamRankItem {
  var teamId;
  var teamName;
  var stat;
  var value;
  var rank;
  var label;

  TeamRankItem(
      this.teamId, this.teamName, this.stat, this.label, this.value, this.rank);
}

class TeamRankItemList {
  List<TeamRankItem> items = [];

  TeamRankItemList(dynamic json, String stat, String label, String measure) {
    // Sort the list by the provided stat
    for (var j in json["resultSets"][0]["rowSet"]) {
      TeamRankItem p;

      if (measure == "BASE") {
        // Base stats - found in PlayerBaseStatAndRank class

        if (stat == "W") {
          p = TeamRankItem(j[0], j[1], stat, "", j[3], j[29]);
        }
        if (stat == "L") {
          p = TeamRankItem(j[0], j[1], stat, "", j[4], j[30]);
        }
        if (stat == "WPct") {
          p = TeamRankItem(j[0], j[1], stat, "", j[5], j[31]);
        }
        if (stat == "MIN") {
          p = TeamRankItem(j[0], j[1], stat, "", j[6], j[32]);
        }
        if (stat == "FGM") {
          p = TeamRankItem(j[0], j[1], stat, "", j[7], j[33]);
        }
        if (stat == "FGA") {
          p = TeamRankItem(j[0], j[1], stat, "", j[8], j[34]);
        }
        if (stat == "FGPCT") {
          p = TeamRankItem(j[0], j[1], stat, "", j[9], j[35]);
        }
        if (stat == "FG3M") {
          p = TeamRankItem(j[0], j[1], stat, "", j[10], j[36]);
        }
        if (stat == "FG3A") {
          p = TeamRankItem(j[0], j[1], stat, "", j[11], j[37]);
        }
        if (stat == "FG3PCT") {
          p = TeamRankItem(j[0], j[1], stat, "", j[12], j[38]);
        }
        if (stat == "FTM") {
          p = TeamRankItem(j[0], j[1], stat, "", j[13], j[39]);
        }
        if (stat == "FTA") {
          p = TeamRankItem(j[0], j[1], stat, "", j[14], j[40]);
        }
        if (stat == "FTPCT") {
          p = TeamRankItem(j[0], j[1], stat, "", j[15], j[41]);
        }
        if (stat == "OREB") {
          p = TeamRankItem(j[0], j[1], stat, "", j[16], j[42]);
        }
        if (stat == "DREB") {
          p = TeamRankItem(j[0], j[1], stat, "", j[17], j[43]);
        }
        if (stat == "REB") {
          p = TeamRankItem(j[0], j[1], stat, "", j[18], j[44]);
        }
        if (stat == "AST") {
          p = TeamRankItem(j[0], j[1], stat, "", j[19], j[45]);
        }
        if (stat == "TOV") {
          p = TeamRankItem(j[0], j[1], stat, "", j[20], j[46]);
        }
        if (stat == "STL") {
          p = TeamRankItem(j[0], j[1], stat, "", j[21], j[47]);
        }
        if (stat == "BLK") {
          p = TeamRankItem(j[0], j[1], stat, "", j[22], j[48]);
        }
        if (stat == "BLKA") {
          p = TeamRankItem(j[0], j[1], stat, "", j[23], j[49]);
        }
        if (stat == "PF") {
          p = TeamRankItem(j[0], j[1], stat, "", j[24], j[50]);
        }
        if (stat == "PFD") {
          p = TeamRankItem(j[0], j[1], stat, "", j[25], j[51]);
        }
        if (stat == "PTS") {
          p = TeamRankItem(j[0], j[1], stat, "", j[26], j[52]);
        }
        if (stat == "PLUSMINUS") {
          p = TeamRankItem(j[0], j[1], stat, "+/-", j[27], j[53]);
        }
      }

      if (measure == "ADVANCED") {
        // Advanced stats - found in PlayerAdvancedStatAndRank class
        if (stat == "ORTG") {
          p = TeamRankItem(j[0], j[1], stat, "Off Rtg", j[8], j[32]);
        }
        if (stat == "DRTG") {
          p = TeamRankItem(j[0], j[1], stat, "Def Rtg", j[10], j[33]);
        }
        if (stat == "NET") {
          p = TeamRankItem(j[0], j[1], stat, "Net Rtg", j[12], j[34]);
        }
        if (stat == "AST %") {
          p = TeamRankItem(j[0], j[1], stat, "AST %", j[13], j[35]);
        }
        if (stat == "AST/TO") {
          p = TeamRankItem(j[0], j[1], stat, "AST/TOV", j[14], j[36]);
        }
        if (stat == "AST RATIO") {
          p = TeamRankItem(j[0], j[1], stat, "AST Ratio", j[15], j[37]);
        }
        if (stat == "OREB %") {
          p = TeamRankItem(j[0], j[1], stat, "OREB %", j[16], j[38]);
        }
        if (stat == "DREB %") {
          p = TeamRankItem(j[0], j[1], stat, "DREB %", j[17], j[39]);
        }
        if (stat == "REB %") {
          p = TeamRankItem(j[0], j[1], stat, "REB %", j[18], j[40]);
        }
        if (stat == "TM TOV %") {
          p = TeamRankItem(j[0], j[1], stat, "TM TOV %", j[19], j[41]);
        }
        if (stat == "EFG %") {
          p = TeamRankItem(j[0], j[1], stat, "eFG %", j[20], j[42]);
        }
        if (stat == "TS %") {
          p = TeamRankItem(j[0], j[1], stat, "TS %", j[21], j[43]);
        }
        if (stat == "PACE") {
          p = TeamRankItem(j[0], j[1], stat, "PACE", j[23], j[44]);
        }
        if (stat == "PIE") {
          p = TeamRankItem(j[0], j[1], stat, "PIE", j[26], j[45]);
        }
      }

      if (measure == "ESTIMATED") {
        // Defense stats - found in PlayerDefenseStatAndRank class
        if (stat == "DEF RTG") {
          p = TeamRankItem(j[0], j[1], stat, "", j[11], j[29]);
        }
        if (stat == "DREB") {
          p = TeamRankItem(j[0], j[1], stat, "", j[12], j[30]);
        }
        if (stat == "DREB %") {
          p = TeamRankItem(j[0], j[1], stat, "", j[13], j[31]);
        }
        if (stat == "% DREB") {
          p = TeamRankItem(j[0], j[1], stat, "", j[14], j[32]);
        }
        if (stat == "STL") {
          p = TeamRankItem(j[0], j[1], stat, "", j[15], j[33]);
        }
        if (stat == "% STL") {
          p = TeamRankItem(j[0], j[1], stat, "", j[16], j[34]);
        }
        if (stat == "BLK") {
          p = TeamRankItem(j[0], j[1], stat, "", j[17], j[35]);
        }
        if (stat == "% BLK") {
          p = TeamRankItem(j[0], j[1], stat, "", j[18], j[36]);
        }
        if (stat == "OPP PTS TOV") {
          p = TeamRankItem(j[0], j[1], stat, "", j[19], j[37]);
        }
        if (stat == "OPP PTS 2nd") {
          p = TeamRankItem(j[0], j[1], stat, "", j[20], j[38]);
        }
        if (stat == "OPP PTS FB") {
          p = TeamRankItem(j[0], j[1], stat, "", j[21], j[39]);
        }
        if (stat == "OPP PTS Paint") {
          p = TeamRankItem(j[0], j[1], stat, "", j[22], j[40]);
        }
        if (stat == "DEF WS") {
          p = TeamRankItem(j[0], j[1], stat, "", j[23], j[41]);
        }
      }

      if (measure == "FOUR FACTORS") {
        if (stat == "EFG %") {
          p = TeamRankItem(j[0], j[1], stat, "Eff FG %", j[7], j[20]);
        }
        if (stat == "FTA RATE") {
          p = TeamRankItem(j[0], j[1], stat, "FTA Rate", j[8], j[21]);
        }
        if (stat == "TM TO %") {
          p = TeamRankItem(j[0], j[1], stat, "Tm TOV %", j[9], j[22]);
        }
        if (stat == "OREB %") {
          p = TeamRankItem(j[0], j[1], stat, "OReb %", j[10], j[23]);
        }
        if (stat == "OPP EFG %") {
          p = TeamRankItem(j[0], j[1], stat, "Opp Eff FG %", j[11], j[24]);
        }
        if (stat == "OPP FTA RATE") {
          p = TeamRankItem(j[0], j[1], stat, "Opp FTA Rate", j[12], j[25]);
        }
        if (stat == "OPP TM TO %") {
          p = TeamRankItem(j[0], j[1], stat, "Opp Tm TOV %", j[13], j[26]);
        }
        if (stat == "OPP OREB %") {
          p = TeamRankItem(j[0], j[1], stat, "Opp OReb %", j[14], j[27]);
        }
      }

      if (measure == "MISC") {
        // Defense stats - found in PlayerDefenseStatAndRank class
        if (stat == "PTS OFF TOS") {
          p = TeamRankItem(j[0], j[1], stat, "", j[7], j[20]);
        }
        if (stat == "2ND CHANCE PTS") {
          p = TeamRankItem(j[0], j[1], stat, "", j[8], j[21]);
        }
        if (stat == "FB PTS") {
          p = TeamRankItem(j[0], j[1], stat, "", j[9], j[22]);
        }
        if (stat == "PTS IN PAINT") {
          p = TeamRankItem(j[0], j[1], stat, "", j[10], j[23]);
        }
        if (stat == "OPP PTS OFF TOS") {
          p = TeamRankItem(j[0], j[1], stat, "", j[11], j[24]);
        }
        if (stat == "OPP 2ND CHANCE PTS") {
          p = TeamRankItem(j[0], j[1], stat, "", j[12], j[25]);
        }
        if (stat == "OPP FB PTS") {
          p = TeamRankItem(j[0], j[1], stat, "", j[13], j[26]);
        }
        if (stat == "OPP PTS IN PAINT") {
          p = TeamRankItem(j[0], j[1], stat, "", j[14], j[27]);
        }
      }

      if (measure == "DEFENSE") {
        // Defense stats - found in PlayerDefenseStatAndRank class
        if (stat == "DEF RTG") {
          p = TeamRankItem(j[0], j[1], stat, "", j[11], j[29]);
        }
        if (stat == "DREB") {
          p = TeamRankItem(j[0], j[1], stat, "", j[12], j[30]);
        }
        if (stat == "DREB %") {
          p = TeamRankItem(j[0], j[1], stat, "", j[13], j[31]);
        }
        if (stat == "% DREB") {
          p = TeamRankItem(j[0], j[1], stat, "", j[14], j[32]);
        }
        if (stat == "STL") {
          p = TeamRankItem(j[0], j[1], stat, "", j[15], j[33]);
        }
        if (stat == "% STL") {
          p = TeamRankItem(j[0], j[1], stat, "", j[16], j[34]);
        }
        if (stat == "BLK") {
          p = TeamRankItem(j[0], j[1], stat, "", j[17], j[35]);
        }
        if (stat == "% BLK") {
          p = TeamRankItem(j[0], j[1], stat, "", j[18], j[36]);
        }
        if (stat == "OPP PTS TOV") {
          p = TeamRankItem(j[0], j[1], stat, "", j[19], j[37]);
        }
        if (stat == "OPP PTS 2nd") {
          p = TeamRankItem(j[0], j[1], stat, "", j[20], j[38]);
        }
        if (stat == "OPP PTS FB") {
          p = TeamRankItem(j[0], j[1], stat, "", j[21], j[39]);
        }
        if (stat == "OPP PTS Paint") {
          p = TeamRankItem(j[0], j[1], stat, "", j[22], j[40]);
        }
        if (stat == "DEF WS") {
          p = TeamRankItem(j[0], j[1], stat, "", j[23], j[41]);
        }
      }

      if (p != null) items.add(p);
    }
  }

  void doSort() {
    items.sort((a, b) {
      if (a.rank > b.rank)
        return 1;
      else
        return -1;
    });
  }
}
