import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_lead_tracker.dart';
import 'package:hoop/components/games_widgets/game_player_popup.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';

class GameFeedDisplayItem extends StatefulWidget {
  final pbp;
  final game;
  final stats;
  final showLead;

  const GameFeedDisplayItem(this.pbp, this.game, this.stats, this.showLead);

  @override
  State<GameFeedDisplayItem> createState() => _GameFeedDisplayItemState();
}

class _GameFeedDisplayItemState extends State<GameFeedDisplayItem> {
  @override
  Widget build(BuildContext context) {
    Widget container;
    Widget row;
    var pbp = widget.pbp;
    var game = widget.game;
    var stats = widget.stats;

    if (pbp.type == "1") {
      // Play-by-play item
      row = GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (pbp.personId != "" && pbp.personId != null) {
            showDialog(
                context: context,
                builder: (context) {
                  return GamePlayerPopup(
                    personId: pbp.personId,
                    game: game,
                    stats: stats,
                    pbp: pbp,
                  );
                });
          }
        },
        child: Stack(children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 90,
                      child: Row(
                        children: [
                          getTeamCard(pbp.description, game),
                          getPlayerImage(pbp),
                          SizedBox(width: 5),
                          Flexible(
                              child: Text(
                            getPbPDescriptionFormatted(pbp, game),
                            style: pbp.isScoreChange
                                ? TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)
                                : TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w500),
                          )),
                        ],
                      )),
                  Expanded(
                      flex: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          pbp.isScoreChange
                              ? Container(
                                  height: 16,
                                  child: Image.asset('images/bball.png'))
                              : SizedBox(),
                          pbp.isVideoAvailable
                              ? Icon(Icons.play_arrow)
                              : SizedBox(),
                          pbp.description.contains("Substitution")
                              ? Icon(
                                  Icons.compare_arrows_outlined,
                                  color: Colors.grey,
                                  size: 24,
                                )
                              : SizedBox(),
                          pbp.description.contains("Shot: Missed")
                              ? Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 24,
                                )
                              : SizedBox(),
                          pbp.description.contains("Rebound")
                              ? Icon(
                                  Icons.sports_handball,
                                  color: Colors.brown,
                                  size: 24,
                                )
                              : SizedBox(),
                          pbp.description.contains("Turnover")
                              ? Icon(
                                  Icons.call_missed_outgoing,
                                  color: Colors.brown,
                                  size: 24,
                                )
                              : SizedBox(),
                          pbp.description.contains("Foul:")
                              ? Icon(
                                  Icons.sports_gymnastics_outlined,
                                  color: Colors.brown,
                                  size: 24,
                                )
                              : SizedBox()
                        ],
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  pbp.cheers == null
                      ? SizedBox()
                      : Row(children: [
                          Icon(
                            Icons.thumb_up,
                            size: 15,
                            color: Colors.green[200],
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            pbp.cheers.toString(),
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500]),
                          ),
                        ]),
                  SizedBox(
                    width: 10,
                  ),
                  pbp.boos == null
                      ? SizedBox()
                      : Row(children: [
                          Icon(
                            Icons.thumb_down,
                            size: 15,
                            color: Colors.red[200],
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            pbp.boos.toString(),
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500]),
                          ),
                        ]),
                ],
              )
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getCurrentPeriod(pbp.period),
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                pbp.clock + "  ",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ]),
      );

      var teamColor = pbp.isScoreChange
          ? ConstantHelper.getTeamColor(pbp.teamId)
          : Colors.white;

      container = Container(
          padding: EdgeInsets.fromLTRB(15, 4, 15, 4),
          margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
          decoration: BoxDecoration(
            border: getReactionBorder(
                pbp.cheers, pbp.boos), //Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(10),
            color: pbp.isScoreChange
                ? teamColor == null
                    ? Colors.white
                    : Color(teamColor).withOpacity(.10)
                : Colors.white,
          ),
          child: row);

      if (pbp.isScoreChange) {
        return Column(
          children: [
            container,
            widget.showLead
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [GameFeedLeadTracker(game, pbp)],
                  )
                : SizedBox()
          ],
        );
      } else {
        return container;
      }
    } else if (pbp.type == "2") {
      // Chat message
      var displayName = (pbp.displayName == null) ? "" : pbp.displayName;
      var text = pbp.chat == null ? "" : pbp.chat;
      var fanLevel = pbp.fanLevel;

      var vTeamId = game["vTeam"]["teamId"];
      var hTeamId = game["hTeam"]["teamId"];

      var dt = DateTime.fromMillisecondsSinceEpoch(pbp.timestamp);
      //print(dt);

      row = Column(
        children: [
          Row(
            children: [
              Text(
                displayName,
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                dt.toString(),
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Flexible(
                  child: Text(
                text,
                style: TextStyle(fontSize: 14),
              ))
            ],
          ),
        ],
      );

      var teamId;
      if (pbp.fanLevel > 30) {
        teamId = hTeamId;
      }
      if (pbp.fanLevel < 30) {
        teamId = vTeamId;
      }
      container = Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          color: Colors.amber[50],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            // if you need this

            color: Colors.cyan,
            width: 1,
          ),
        ),
        child: Column(children: [
          Container(padding: EdgeInsets.fromLTRB(20, 5, 20, 4), child: row),
          Container(
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: teamId == null
                  ? null
                  : ConstantHelper.getTeamColor_Gradient(teamId, pbp.fanLevel),
            ),
          )
        ]),
      );
    }
    return container;
  }

  Border getReactionBorder(int cheers, int boos) {
    Border b;

    if (cheers == null) {
      cheers = 0;
    }
    if (boos == null) {
      boos = 0;
    }

    var diff = cheers - boos;

    // Check if cheers is higher
    if (diff > 0) {
      if (diff > 100) {
        b = Border.all(color: Colors.green[800], width: 6);
      } else if (diff > 80) {
        b = Border.all(color: Colors.green[700], width: 5);
      } else if (diff > 60) {
        b = Border.all(color: Colors.green[600], width: 4);
      } else if (diff > 40) {
        b = Border.all(color: Colors.green[500], width: 4);
      } else if (diff > 20) {
        b = Border.all(color: Colors.green[400], width: 3);
      } else if (diff > 10) {
        b = Border.all(color: Colors.green[300], width: 3);
      } else if (diff > 5) {
        b = Border.all(color: Colors.green[200], width: 2);
      } else {
        b = Border.all(color: Colors.green[100], width: 2);
      }
    } else if (diff < 0) {
      if (diff < -100) {
        b = Border.all(color: Colors.red[800], width: 6);
      } else if (diff < -80) {
        b = Border.all(color: Colors.red[700], width: 5);
      } else if (diff < -60) {
        b = Border.all(color: Colors.red[600], width: 4);
      } else if (diff < -40) {
        b = Border.all(color: Colors.red[500], width: 4);
      } else if (diff < -20) {
        b = Border.all(color: Colors.red[400], width: 3);
      } else if (diff < -10) {
        b = Border.all(color: Colors.red[300], width: 3);
      } else if (diff < -5) {
        b = Border.all(color: Colors.red[200], width: 2);
      } else {
        b = Border.all(color: Colors.red[100], width: 2);
      }
    } else {
      b = Border.all(color: Colors.grey[300]);
    }

    return b;
  }

  String getCurrentPeriod(int period) {
    String periodString = "";

    if (period == 1) {
      periodString = "1st";
    }
    if (period == 2) {
      periodString = "2nd";
    }
    if (period == 3) {
      periodString = "3rd";
    }
    if (period == 4) {
      periodString = "4th";
    }
    if (period == 5) {
      periodString = "OT1";
    }
    if (period == 6) {
      periodString = "OT2";
    }
    if (period == 7) {
      periodString = "OT3";
    }

    return periodString;
  }

  Widget getTeamCard(String desc, dynamic game) {
    String vTeamTriCode = game["vTeam"]["triCode"];
    String hTeamTriCode = game["hTeam"]["triCode"];

    var vTeamId = game["vTeam"]["teamId"];
    var hTeamId = game["hTeam"]["teamId"];

    int vTeamIndex = desc.indexOf("[" + vTeamTriCode) + 1;
    int hTeamIndex = desc.indexOf("[" + hTeamTriCode) + 1;

    if (vTeamIndex > 0) {
      return getTeamTricodeCard(vTeamId);
    } else if (hTeamIndex > 0) {
      return getTeamTricodeCard(hTeamId);
    } else {
      return Text('');
    }
  }

  Widget getPlayerImage(PbpItem pbp) {
    if (pbp.personId == null) return SizedBox();
    if (pbp.personId == '') return SizedBox();
    if (pbp.description.contains('Timeout')) return SizedBox();
    if (pbp.description.contains('Stoppage')) return SizedBox();
    if (pbp.description.contains('Start Period')) return SizedBox();
    if (pbp.description.contains('Challenge')) return SizedBox();

    var url =
        "https://cdn.nba.com/headshots/nba/latest/1040x760/${pbp.personId}.png";

    try {
      return CachedLogo(
        url: url,
        radius: 18,
      );
    } catch (err) {
      print("Error fetching " + url);
    }
  }

  Widget getTeamTricodeCard(String teamId) {
    var teamColor = ConstantHelper.getTeamColor(teamId);
    var teamTextColor = ConstantHelper.getTeamTextColor(teamId);
    var tricode = ConstantHelper.getTeamTriCode(teamId);

    return Card(
      elevation: 2,
      color: Color(teamColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        padding: EdgeInsets.all(2),
        child: Text(
          tricode,
          style: TextStyle(color: Color(teamTextColor), fontSize: 10),
        ),
      ),
    );
  }

  String getPbPDescriptionFormatted(PbpItem pbp, dynamic game) {
    String desc = pbp.description;
    if (pbp.isScoreChange) {
      ScoreTextBreakdown t = pbp.getTextBreakdown();
      String d = t.shotText;
    }

    String vTeamTriCode = game["vTeam"]["triCode"];
    String hTeamTriCode = game["hTeam"]["triCode"];
    desc = desc.replaceAll("[" + vTeamTriCode + "]", "");
    desc = desc.replaceAll("[" + hTeamTriCode + "]", "");
    desc = desc.replaceAll("[" + vTeamTriCode + " ", "[");
    desc = desc.replaceAll("[" + hTeamTriCode + " ", "[");

    return desc;
  }
}
