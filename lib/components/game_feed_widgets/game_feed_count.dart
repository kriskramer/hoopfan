import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';

class GameFeedCount extends StatelessWidget {
  final String gameId;

  GameFeedCount(this.gameId);

  final FeedList2 list = new FeedList2();

  @override
  Widget build(BuildContext context) {
    DatabaseReference pbpFeed =
        FirebaseDatabase.instance.ref('gamePbp22/$gameId');
    int pbpCount = 0;

    return Container(
      child: StreamBuilder(
        stream: pbpFeed.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData) {
            list.items.clear();
            DataSnapshot dataValues = snapshot.data.snapshot;
            Map<dynamic, dynamic> values = dataValues.value;
            if (values == null) {
              return SizedBox();
            }
            pbpCount = 0;
            for (var p in values["pbp"]["actions"]) {
              pbpCount++;
            }

            return Text(
              pbpCount.toString(),
              style: TextStyle(fontSize: 10, color: Colors.blue),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
