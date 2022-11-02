import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hoop/components/game_feed_widgets/chat_feed_display_item.dart';
import 'package:hoop/models/game_data.dart';
import 'package:hoop/models/game_feed/chat_item.dart';

class ChatFeed extends StatefulWidget {
  final String gameId;
  final GameData game;

  const ChatFeed(this.gameId, this.game);

  @override
  State<ChatFeed> createState() => _ChatFeedState();
}

class _ChatFeedState extends State<ChatFeed> {
  final ChatFeedList list = ChatFeedList();

  @override
  Widget build(BuildContext context) {
    var gameId = widget.gameId;

    DatabaseReference gameChatFeed =
        FirebaseDatabase.instance.ref('gameChat22/$gameId');

    return Container(
      padding: EdgeInsets.all(15),
      child: StreamBuilder(
        stream: gameChatFeed.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData) {
            list.items.clear();
            DataSnapshot dataValues = snapshot.data.snapshot;
            Map<dynamic, dynamic> values = dataValues.value;
            if (values == null) {
              return Column(children: [
                Text("No one's talking yet..."),
              ]);
            }
            // for (var p in values) {
            //   list.items.add(ChatItem(p));
            // }
            values.forEach((key, val) {
              ChatItem chat = ChatItem(key, val);
              list.items.add(chat);
            });
            //   if (pbp.type == "1" && showPbp) {
            //     list.items.add(PbpItem(key, val));
            //   }
            //   if (pbp.type == "2" && showChat) {
            //     list.items.add(PbpItem(key, val));
            //   }
            //   // temp fix
            //   if (pbp.type == null) {
            //     list.items.add(PbpItem(key, val));
            //   }
            // });

            list.sort();

            // Provider.of<JsonFiles>(context, listen: false)
            //     .setGameFeed(widget.gameId, list);

            return new ListView.builder(
              shrinkWrap: true,
              //controller: _scrollController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.items.length,
              itemBuilder: (BuildContext context, int index) {
                int idx = index;

                return ChatFeedDisplayItem(list.items[idx], widget.game);
              },
            );
          }
          return Container(child: Text("Loading Game Feed..."));
        },
      ),
    );
  }
}
