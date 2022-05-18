import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_display_item.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';
import 'package:hoop/providers/game_settings.dart';
import 'package:hoop/screens/views/games/game_view.dart';
import 'package:provider/provider.dart';

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
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    DatabaseReference pbpFeed =
        FirebaseDatabase.instance.ref('gameFeed/${widget.gameId}');

    bool showPbp =
        Provider.of<GameSettingsProv>(context, listen: false).getShowPbp();
    bool showChat =
        Provider.of<GameSettingsProv>(context, listen: false).getShowChat();
    bool showLead =
        Provider.of<GameSettingsProv>(context, listen: false).getShowLead();

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
                Text("No data yet..."),
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

            Provider.of<JsonFiles>(context, listen: false)
                .setGameFeed(widget.gameId, list);

            return new ListView.builder(
              shrinkWrap: true,
              //controller: _scrollController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: (list.items.length > 200 && !showAll)
                  ? 200
                  : list.items.length,
              itemBuilder: (BuildContext context, int index) {
                if (list.items.length > 200 && index == 0 && !showAll) {
                  return Column(children: [
                    Center(
                      child: Text("Showing latest 200 items..."),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showAll = true;
                          });
                        },
                        child: Text("Show All"))
                  ]);
                }

                int idx = index;
                // Only show the latest 200 items (for now)
                if (!showAll) {
                  if (list.items.length > 200) {
                    idx = index + list.items.length - 200;
                  }

                  if (idx < 0) {
                    idx = 0;
                  }
                }
                return GameFeedDisplayItem(
                    list.items[idx], widget.gameData, widget.stats, showLead);
              },
            );
          }
          return Container(child: Text("Loading Game Feed..."));
        },
      ),
    );
  }
}
