import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
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
    DatabaseReference pbpFeed =
        FirebaseDatabase.instance.ref('gamePbp22/${widget.gameId}');
    int comments = 0;
    int pbpCount = 0;
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
            comments = 0;
            pbpCount = 0;
            for (var p in values["pbp"]["actions"]) {
              list.items.add(PbpItem2(p));
              pbpCount++;
            }
            // values.forEach((key, values) {
            //   var pbp = PbpItem(key, values);
            //   list.items.add(pbp);
            //   if (pbp.type == "1") {
            //     pbpCount++;
            //   }
            //   if (pbp.type == "2") {
            //     comments++;
            //   }
            //   if (pbp.type == null) {
            //     pbpCount++;
            //   }
            // });

            list.sort();

            var index = list.items.length - 1;
            var lastItem = list.items[index];

            if (lastItem.type == "1") {
              lastPbp = DateHelper.formatClockWithPT(lastItem.clock) +
                  " - " +
                  lastItem.description;
            } else if (lastItem.type == "2") {
              lastPbp = '"' + lastItem.chat + '"';
            }

            return Column(
              children: [
                Divider(
                  color: Colors.blueGrey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Comments: " + comments.toString(),
                      style: TextStyle(fontSize: 10, color: Colors.lightBlue),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Plays: " + pbpCount.toString(),
                      style: TextStyle(fontSize: 10, color: Colors.lightBlue),
                    ),
                  ],
                ),
                Text(
                  lastPbp,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
