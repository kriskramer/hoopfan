import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';
import 'package:hoop/utils/date_helper.dart';

class GameFeedLastPbp extends StatelessWidget {
  final String gameId;

  GameFeedLastPbp(this.gameId);

  final FeedList2 list = new FeedList2();

  @override
  Widget build(BuildContext context) {
    DatabaseReference pbpFeed =
        FirebaseDatabase.instance.ref('gamePbp22/$gameId');
    String lastPbp = "";

    return Container(
      //padding: EdgeInsets.all(15),
      child: StreamBuilder(
        stream: pbpFeed.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData) {
            //print("Error on the way");
            list.items.clear();
            DataSnapshot dataValues = snapshot.data.snapshot;
            Map<dynamic, dynamic> values = dataValues.value;
            if (values == null) {
              return SizedBox();
            }
            for (var p in values["pbp"]["actions"]) {
              list.items.add(PbpItem2(p));
            }

            list.sort();

            var index = list.items.length - 1;
            var lastItem = list.items[index];

            lastPbp = DateHelper.formatClockWithPT(lastItem.clock) +
                " - " +
                lastItem.description;

            return Text(
              lastPbp,
              style: TextStyle(color: Colors.grey[700]),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
