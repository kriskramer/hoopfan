import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_lead_tracker.dart';
import 'package:hoop/components/game_feed_widgets/game_pbp_popup.dart';
import 'package:hoop/components/games_widgets/game_player_popup.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/game_data.dart';
import 'package:hoop/models/game_feed/chat_item.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';
import 'package:hoop/screens/views/games/game_view.dart';

class ChatFeedDisplayItem extends StatefulWidget {
  final ChatItem chat;
  final GameData game;

  const ChatFeedDisplayItem(this.chat, this.game);

  @override
  State<ChatFeedDisplayItem> createState() => _ChatFeedDisplayItemState();
}

class _ChatFeedDisplayItemState extends State<ChatFeedDisplayItem> {
  @override
  Widget build(BuildContext context) {
    Widget container;
    Widget row;
    ChatItem chat = widget.chat;
    GameData game = widget.game;

    var dt = DateTime.fromMillisecondsSinceEpoch(chat.timestamp);
    var dtString = "${dt.year}-${dt.month}-${dt.day} ${dt.hour}:${dt.minute}";

    var teamId;
    if (chat.fanLevel > 30) {
      teamId = game.homeTeam.teamId;
    }
    if (chat.fanLevel < 30) {
      teamId = game.awayTeam.teamId;
    }

    return Column(children: [
      Container(
        margin: EdgeInsets.fromLTRB(20, 2, 20, 0),
        child: Row(
          children: [
            Text(
              chat.displayName,
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              dtString,
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(20, 2, 20, 10),
        decoration: BoxDecoration(
          color: Colors.amber[50],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.amber[100],
            width: 1,
          ),
        ),
        child: Column(children: [
          Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 4),
              child: Text(
                chat.comment,
                style: TextStyle(fontSize: 14),
              )),
          Container(
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: teamId == null
                  ? null
                  : ConstantHelper.getTeamColor_Gradient(
                      teamId.toString(), chat.fanLevel),
            ),
          )
        ]),
      ),
    ]);
  }
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
