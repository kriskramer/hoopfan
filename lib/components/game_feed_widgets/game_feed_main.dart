import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

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

    // pbpFeed.onValue.listen((DatabaseEvent event) {
    //   final data = event.snapshot.value;
    //   //print(data);
    // });

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
              return Text("No data");
            }
            values.forEach((key, values) {
              list.items.add(PbpItem(key, values));
            });

            list.sort();

            return new ListView.builder(
              shrinkWrap: true,
              //controller: _scrollController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.items.length,
              itemBuilder: (BuildContext context, int index) {
                // THis auto scrolls to the bottom, but it also keeps user from scrolling up for some reason...
                // if (_scrollController.position.maxScrollExtent != null) {
                //   _scrollController.animateTo(
                //       _scrollController.position.maxScrollExtent,
                //       duration: Duration(milliseconds: 500),
                //       curve: Curves.ease);
                // }

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
                      personId: pbp.personId, game: game, stats: stats);
                });
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              pbp.clock + "  ",
              style: TextStyle(fontSize: 12),
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
      row = Row(
        children: [Flexible(child: Text(pbp.displayName + " - " + pbp.chat))],
      );
      container = Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
            color: Colors.amber[200],
          ),
          child: row);
    }
    return container;
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
  String eventMsgType;
  String description;
  var personId;
  var teamId;
  var vTeamScore;
  var hTeamScore;
  bool isScoreChange;
  bool isVideoAvailable;
  String type;
  String chat;
  String displayName;

  PbpItem(String ts, dynamic json) {
    timestamp = int.parse(ts);
    clock = json["clock"];
    eventMsgType = json["eventMsgType"];
    description = json["description"];
    personId = json["personId"];
    teamId = json["teamId"];
    vTeamScore = json["vTeamScore"];
    hTeamScore = json["hTeamScore"];
    isScoreChange = json["isScoreChange"];
    isVideoAvailable = json["isVideoAvailable"];
    type = json["type"];
    chat = json["chat"];
    displayName = json["displayName"];
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
