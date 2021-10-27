import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:provider/provider.dart';

class PlayerRankList extends StatelessWidget {
  final String measure;
  final String statName;
  final String playerId;

  const PlayerRankList(this.measure, this.statName, this.playerId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Player Stat Rankings"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
            future: loadData(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Widget> rows = [];

                PlayerRankItemList list =
                    PlayerRankItemList(snapshot.data, statName, measure);

                list.doSort();

                for (var l in list.items) {
                  var samePlayer = l.playerId.toString() == playerId;
                  rows.add(Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            l.rank.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: samePlayer ? Colors.red : Colors.black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            l.teamAbbreviation,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: samePlayer ? Colors.red : Colors.black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            l.playerName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: samePlayer ? Colors.red : Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        l.value.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: samePlayer ? Colors.red : Colors.black),
                      ),
                    ],
                  ));
                  rows.add(SizedBox(
                    height: 5,
                  ));
                }

                return Container(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            statName + ' Rank',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        ...rows
                      ],
                    ),
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

  Future<dynamic> loadData(BuildContext context) async {
    var stats;

    if (measure == "BASE") {
      stats = Provider.of<JsonFiles>(context, listen: false)
          .getAllBasePlayerStats();
    } else if (measure == "ADVANCED") {
      stats = Provider.of<JsonFiles>(context, listen: false)
          .getAllAdvancedPlayerStats();
    } else if (measure == "DEFENSE") {
      stats = Provider.of<JsonFiles>(context, listen: false)
          .getAllDefensePlayerStats();
    }
    return stats;
  }
}

class PlayerRankItem {
  var playerId;
  var playerName;
  String teamAbbreviation;
  var stat;
  var value;
  var rank;

  PlayerRankItem(this.playerId, this.playerName, this.teamAbbreviation,
      this.stat, this.value, this.rank);
}

class PlayerRankItemList {
  List<PlayerRankItem> items = [];

  PlayerRankItemList(dynamic json, String stat, String measure) {
    // Sort the list by the provided stat
    for (var j in json["resultSets"][0]["rowSet"]) {
      PlayerRankItem p;

      if (measure == "BASE") {
        // Base stats - found in PlayerBaseStatAndRank class
        if (stat == "PTS") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[30], j[59]);
        }
        if (stat == "REB") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[22], j[51]);
        }
        if (stat == "OREB") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[20], j[49]);
        }
        if (stat == "DREB") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[21], j[50]);
        }
        if (stat == "AST") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[23], j[52]);
        }
        if (stat == "TOV") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[24], j[53]);
        }
        if (stat == "STL") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[25], j[54]);
        }
        if (stat == "BLK") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[26], j[55]);
        }
        if (stat == "FG %") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[13], j[42]);
        }
        if (stat == "FT %") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[19], j[48]);
        }
        if (stat == "3P %") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[16], j[45]);
        }
        if (stat == "PF") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[28], j[57]);
        }
        if (stat == "+/-") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[31], j[60]);
        }
        if (stat == "MIN") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[10], j[39]);
        }
      }

      if (measure == "ADVANCED") {
        // Advanced stats - found in PlayerAdvancedStatAndRank class
        if (stat == "Off Rtg") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[12], j[49]);
        }
        if (stat == "Def Rtg") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[15], j[52]);
        }
        if (stat == "Net Rtg") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[18], j[55]);
        }
        if (stat == "AST %") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[20], j[57]);
        }
        if (stat == "AST/TOV") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[21], j[58]);
        }
        if (stat == "AST Ratio") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[22], j[59]);
        }
        if (stat == "OREB %") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[23], j[60]);
        }
        if (stat == "DREB %") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[24], j[61]);
        }
        if (stat == "REB %") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[25], j[62]);
        }
        if (stat == "TM TOV %") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[26], j[63]);
        }
        if (stat == "eFG %") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[28], j[65]);
        }
        if (stat == "TS %") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[29], j[66]);
        }
        if (stat == "USG %") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[30], j[67]);
        }
        if (stat == "PIE") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[36], j[72]);
        }
      }

      if (measure == "DEFENSE") {
        // Defense stats - found in PlayerDefenseStatAndRank class
        if (stat == "DEF RTG") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[11], j[29]);
        }
        if (stat == "DREB") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[12], j[30]);
        }
        if (stat == "DREB %") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[13], j[31]);
        }
        if (stat == "% DREB") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[14], j[32]);
        }
        if (stat == "STL") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[15], j[33]);
        }
        if (stat == "% STL") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[16], j[34]);
        }
        if (stat == "BLK") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[17], j[35]);
        }
        if (stat == "% BLK") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[18], j[36]);
        }
        if (stat == "OPP PTS TOV") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[19], j[37]);
        }
        if (stat == "OPP PTS 2nd") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[20], j[38]);
        }
        if (stat == "OPP PTS FB") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[21], j[39]);
        }
        if (stat == "OPP PTS Paint") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[22], j[40]);
        }
        if (stat == "DEF WS") {
          p = PlayerRankItem(j[0], j[1], j[4], stat, j[23], j[41]);
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
