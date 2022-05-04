import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:hoop/providers/game_settings.dart';
import 'package:hoop/screens/views/games/game_view.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../../models/play_by_play_item.dart';
import '../games_widgets/game_player_popup.dart';

class GameFeedMain extends StatefulWidget {
  final String gameId;
  final dynamic gameData;
  final dynamic stats;

  const GameFeedMain(this.gameId, this.gameData, this.stats);

  @override
  State<GameFeedMain> createState() => _GameFeedMainState();
}

class _GameFeedMainState extends State<GameFeedMain> {
  final FeedList list = new FeedList();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // FirebaseDatabase database = FirebaseDatabase.instance;
    // DatabaseReference ref = FirebaseDatabase.instance.ref();

    DatabaseReference pbpFeed =
        FirebaseDatabase.instance.ref('gameFeed/${widget.gameId}');
    var vTeamId = widget.gameData["vTeam"]["teamId"];
    var hTeamId = widget.gameData["hTeam"]["teamId"];

    // pbpFeed.onValue.listen((DatabaseEvent event) {
    //   final data = event.snapshot.value;
    //   //print(data);
    // });

    bool showPbp =
        Provider.of<GameSettingsProv>(context, listen: false).getShowPbp();
    bool showChat =
        Provider.of<GameSettingsProv>(context, listen: false).getShowChat();

    return Container(
      padding: EdgeInsets.all(15),
      child: StreamBuilder(
        stream: pbpFeed.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData) {
            //print("Error on the way");
            list.items.clear();
            DataSnapshot dataValues = snapshot.data.snapshot;
            Map<dynamic, dynamic> values = dataValues.value;
            if (values == null) {
              return Column(children: [
                Text("No data"),
                Text("Want to go back to the old Game View?"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GameView(game: widget.gameData)),
                      );
                    },
                    child: Text("Old Game View"))
              ]);
              // TODO: Put an option here to go to the old game view screen

            }
            values.forEach((key, values) {
              PbpItem pbp = PbpItem(key, values);

              if (pbp.type == "1" && showPbp) {
                list.items.add(PbpItem(key, values));
              }
              if (pbp.type == "2" && showChat) {
                list.items.add(PbpItem(key, values));
              }
            });

            list.sort();

            return new ListView.builder(
              shrinkWrap: true,
              //controller: _scrollController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.items.length,
              itemBuilder: (BuildContext context, int index) {
                return getPbpItem(
                    list.items[index], widget.gameData, widget.stats);
              },
            );
          }
          return Container(child: Text("Loading Game Feed..."));
        },
      ),
    );
  }

  Widget getPbpItem(PbpItem pbp, dynamic game, dynamic stats) {
    Widget container;
    Widget row;
    //PlayByPlayItem pbp = PlayByPlayItem(play);

    if (pbp.type == "1") {
      // Play-by-play item
      row = GestureDetector(
        onTap: () {
          if (pbp.personId != "" && pbp.personId != null) {
            showDialog(
                context: context,
                builder: (context) {
                  return GamePlayerPopup(
                    personId: pbp.personId,
                    game: game,
                    stats: stats,
                    pbpText: pbp.formattedDescription,
                  );
                });
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(getCurrentPeriod(pbp.period)),
                Text(
                  pbp.clock + "  ",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            getTeamCard(pbp.description, widget.gameData),
            Flexible(
                child: Text(
              getPbPDescriptionFormatted(pbp, widget.gameData),
              style: pbp.isScoreChange
                  ? TextStyle(fontSize: 14, color: Colors.black)
                  : TextStyle(fontSize: 14, color: Colors.grey[800]),
            )),
            pbp.isScoreChange
                ? Container(height: 16, child: Image.asset('images/bball.png'))
                : SizedBox(),
            pbp.isVideoAvailable ? Icon(Icons.play_arrow) : SizedBox()
          ],
        ),
      );

      var teamColor = pbp.isScoreChange
          ? ConstantHelper.getTeamColor(pbp.teamId)
          : Colors.white;
      container = Container(
          padding: EdgeInsets.fromLTRB(22, 4, 22, 4),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300])),
            color: pbp.isScoreChange
                ? Color(teamColor).withOpacity(.10)
                : Colors.white,
          ),
          child: row);
    } else if (pbp.type == "2") {
      // Chat message
      var displayName = (pbp.displayName == null) ? "" : pbp.displayName;
      var text = pbp.chat == null ? "" : pbp.chat;
      var fanLevel = pbp.fanLevel;

      var vTeamId = widget.gameData["vTeam"]["teamId"];
      var hTeamId = widget.gameData["hTeam"]["teamId"];

      row = Column(
        children: [
          Row(
            children: [
              Text(
                displayName,
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

    var vTeamId = widget.gameData["vTeam"]["teamId"];
    var hTeamId = widget.gameData["hTeam"]["teamId"];

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

class PbpItem {
  int timestamp;
  String clock;
  int period;
  String eventMsgType;
  String description;
  String formattedDescription;
  var personId;
  var teamId;
  var vTeamScore;
  var hTeamScore;
  bool isScoreChange;
  bool isVideoAvailable;
  String type;
  String chat;
  String displayName;
  int fanLevel;
  int cheers;
  int boos;

  PbpItem(String ts, dynamic json) {
    timestamp = int.parse(ts);
    clock = json["clock"];
    period = json["period"];
    eventMsgType = json["eventMsgType"];
    description = json["description"];
    if (json["formatted"] != null) {
      formattedDescription = json["formatted"]["description"];
    }
    personId = json["personId"];
    teamId = json["teamId"];
    vTeamScore = json["vTeamScore"];
    hTeamScore = json["hTeamScore"];
    isScoreChange = json["isScoreChange"];
    isVideoAvailable = json["isVideoAvailable"];
    type = json["type"];
    chat = json["chat"];
    displayName = json["displayName"];
    fanLevel = json["fanLevel"] == null ? 0 : json["fanLevel"];
    cheers = json["cheers"];
    boos = json["boos"];
  }

  ScoreTextBreakdown getTextBreakdown() {
    return new ScoreTextBreakdown(description);
  }
}

class FeedList {
  List<PbpItem> items = [];

  void sort() {
    items.sort((a, b) {
      if (b.timestamp < a.timestamp)
        return 1;
      else
        return -1;
    });
  }
}
