import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_lead_tracker.dart';
import 'package:hoop/components/game_feed_widgets/game_pbp_popup.dart';
import 'package:hoop/components/games_widgets/game_player_popup.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/game_data.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';

class GameFeedDisplayItem extends StatefulWidget {
  final PbpItem2 pbp;
  final showLead;
  final GameData gameData;
  final dynamic reactions;

  const GameFeedDisplayItem(
      this.pbp, this.showLead, this.gameData, this.reactions);

  @override
  State<GameFeedDisplayItem> createState() => _GameFeedDisplayItemState();
}

class _GameFeedDisplayItemState extends State<GameFeedDisplayItem> {
  @override
  Widget build(BuildContext context) {
    PbpItem2 pbp = widget.pbp;
    Widget container;
    Widget row;
    var game = widget.gameData;
    var reactions = widget.reactions;

    var isHomeTeam = pbp.teamId == game.homeTeam.teamId;
    var isAwayTeam = pbp.teamId == game.awayTeam.teamId;
    var isNoTeam = pbp.teamId == null;
    var num = pbp.orderNumber.toString();

    int cheers = 0;
    int boos = 0;

    if (reactions != null) {
      if (reactions["pbp"][num] != null) {
        print(reactions["pbp"][num]);
        if (reactions["pbp"][num]["cheers"] != null)
          cheers = reactions["pbp"][num]["cheers"];
        if (reactions["pbp"][num]["boos"] != null)
          boos = reactions["pbp"][num]["boos"];
      }
    }

    Widget pbpRow;

    if (isAwayTeam) {
      pbpRow = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 5),
          getPlayerImage(pbp, game),
          SizedBox(width: 5),
          Flexible(
            child: Text(
              pbp.description,
              style: pbp.isScoreChange
                  ? TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)
                  : TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500),
            ),
          ),
        ],
      );
    } else if (isHomeTeam) {
      pbpRow = Row(
        mainAxisAlignment: MainAxisAlignment.end,
        textDirection: TextDirection.ltr,
        children: [
          SizedBox(width: 5),
          Flexible(
            child: Text(
              pbp.description,
              style: pbp.isScoreChange
                  ? TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)
                  : TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(width: 5),
          getPlayerImage(pbp, game),
          SizedBox(width: 5),
        ],
      );
    } else if (isNoTeam) {
      pbpRow = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.ltr,
        children: [
          SizedBox(width: 5),
          Flexible(
            child: Text(
              pbp.description,
              style: pbp.isScoreChange
                  ? TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)
                  : TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(width: 5),
          SizedBox(width: 5),
        ],
      );
    }

    row = Stack(children: [
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(children: [
            pbpRow,
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
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[500]),
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
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[500]),
                        ),
                      ]),
              ],
            )
          ]),
        ),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return GamePbpPopup(
                  gameId: game.gameId,
                  pbp: pbp,
                );
              });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          boos > 0
              ? Icon(
                  Icons.thumb_down,
                  size: 12,
                  color: Colors.red,
                )
              : SizedBox(),
          SizedBox(
            width: 3,
          ),
          boos > 0
              ? Text(boos.toString(),
                  style: TextStyle(color: Colors.red, fontSize: 10))
              : SizedBox(),
          SizedBox(
            width: 8,
          ),
          Text(
            getCurrentPeriod(pbp.period),
            style: TextStyle(
                fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            pbp.clockFormatted() + "  ",
            style: TextStyle(
                fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 8,
          ),
          cheers > 0
              ? Text(cheers.toString(),
                  style: TextStyle(color: Colors.green, fontSize: 10))
              : SizedBox(),
          SizedBox(
            width: 3,
          ),
          cheers > 0
              ? Icon(
                  Icons.thumb_up,
                  size: 12,
                  color: Colors.green,
                )
              : SizedBox(),
        ],
      ),
    ]);

    var teamColor = pbp.isScoreChange
        ? ConstantHelper.getTeamColor(pbp.teamId.toString())
        : Colors.white;

    container = Container(
        padding: EdgeInsets.fromLTRB(15, 4, 15, 4),
        margin: EdgeInsets.fromLTRB(0, 2, 0, 3),
        decoration: BoxDecoration(
          border: getReactionBorder(
              pbp, cheers, boos), //Border.all(color: Colors.grey[300]),
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
      return Column(
        children: [
          pbp.description.contains("Start Period")
              ? Divider(
                  color: Colors.black,
                  height: 12,
                  thickness: 3,
                )
              : SizedBox(),
          container,
          pbp.description.contains("Start Period")
              ? Divider(
                  color: Colors.black,
                  height: 12,
                  thickness: 3,
                )
              : SizedBox(),
        ],
      );
    }
  }

  Border getReactionBorder(PbpItem2 pbp, int cheers, int boos) {
    Border b;

    if (pbp.actionType == "period") {
      b = Border.all(color: Colors.black, width: 2);
      return b;
    }

    var diff = cheers - boos;

    //print(diff);

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
      } else if (diff > 4) {
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
      b = Border.all(color: Colors.grey[50]);
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
    String vTeamTriCode = game.awayTeam.teamTricode;
    String hTeamTriCode = game.homeTeam.teamTricode;

    var vTeamId = game.awayTeam.teamId;
    var hTeamId = game.homeTeam.teamId;

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

  Widget getPlayerImage(PbpItem2 pbp, GameData game) {
    if (pbp.personId == 0) return SizedBox();
    if (pbp.personId == null) return SizedBox();

    var url =
        "https://cdn.nba.com/headshots/nba/latest/1040x760/${pbp.personId}.png";

    var teamColor = ConstantHelper.getTeamColor(pbp.teamId.toString());
    try {
      return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            if (pbp.personId != "" && pbp.personId != null) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return GamePlayerPopup(
                      personId: pbp.personId.toString(),
                      game: game,
                      pbp: pbp,
                    );
                  });
            }
          },
          child: CircleAvatar(
            backgroundColor: Color(teamColor),
            radius: 22,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: CachedLogo(
                url: url,
                radius: 18,
              ),
            ),
          ));
    } catch (err) {
      print("Error fetching " + url);
    }
  }

  Widget getTeamTricodeCard(String teamId) {
    var teamColor = ConstantHelper.getTeamColor(teamId);
    var teamTextColor = ConstantHelper.getTeamTextColor(teamId);
    var tricode = ConstantHelper.getTeamTriCode(teamId);

    return Container(
      decoration: BoxDecoration(
        color: Color(teamColor),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.fromLTRB(4, 1, 4, 1),
      child: Text(
        tricode,
        style: TextStyle(color: Color(teamTextColor), fontSize: 10),
      ),
    );
  }

  // String getPbPDescriptionFormatted(PbpItem pbp, dynamic game) {
  //   String desc = pbp.description;
  //   if (pbp.shotResult == "Made") {
  //     ScoreTextBreakdown t = pbp.getTextBreakdown();
  //     String d = t.shotText;
  //   }

  //   String vTeamTriCode = game.awayTeam.teamTricode;
  //   String hTeamTriCode = game.homeTeam.teamTricode;
  //   desc = desc.replaceAll("[" + vTeamTriCode + "]", "");
  //   desc = desc.replaceAll("[" + hTeamTriCode + "]", "");
  //   desc = desc.replaceAll("[" + vTeamTriCode + " ", "[");
  //   desc = desc.replaceAll("[" + hTeamTriCode + " ", "[");

  //   return desc;
  // }
}
