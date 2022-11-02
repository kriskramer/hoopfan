import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:hoop/components/game_feed_widgets/chat_feed_count.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_count.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_last_pbp.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';
import 'package:hoop/utils/date_helper.dart';

class GameFeedLatest extends StatefulWidget {
  final String gameId;

  const GameFeedLatest(this.gameId);

  @override
  State<GameFeedLatest> createState() => _GameFeedLatestState();
}

class _GameFeedLatestState extends State<GameFeedLatest> {
  final FeedList2 list = new FeedList2();

  @override
  Widget build(BuildContext context) {
    int comments = 0;
    int pbpCount = 0;
    String lastPbp = "";

    return Container(
        //padding: EdgeInsets.all(15),
        child: Column(
      children: [
        Divider(
          color: Colors.blueGrey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Comments: ",
              style: TextStyle(fontSize: 10, color: Colors.lightBlue),
            ),
            ChatFeedCount(widget.gameId),
            SizedBox(
              width: 20,
            ),
            Text(
              "Plays: ",
              style: TextStyle(fontSize: 10, color: Colors.lightBlue),
            ),
            GameFeedCount(widget.gameId),
          ],
        ),
        GameFeedLastPbp(widget.gameId)
      ],
    ));
  }
}
