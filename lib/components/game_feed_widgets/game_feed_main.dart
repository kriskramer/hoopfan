import 'dart:async';

import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_display_item.dart';
import 'package:hoop/components/games_widgets/arena_card.dart';
import 'package:hoop/components/games_widgets/game_officials.dart';
import 'package:hoop/components/games_widgets/how_to_watch_card.dart';
import 'package:hoop/models/game_data.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';
import 'package:hoop/providers/game_settings.dart';
import 'package:hoop/services/network.dart';
import 'package:provider/provider.dart';

import '../../json/jsons.dart';

class GameFeedMain extends StatefulWidget {
  final String gameId;
  final GameData game;
  //final DatabaseReference pbpFeed;

  const GameFeedMain(this.gameId, this.game);

  @override
  State<GameFeedMain> createState() => _GameFeedMainState();
}

class _GameFeedMainState extends State<GameFeedMain> {
  final FeedList2 list = new FeedList2();

  ScrollController _scrollController = ScrollController();
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    DatabaseReference pbpFeed =
        FirebaseDatabase.instance.ref('gamePbp22/${widget.gameId}');
    DatabaseReference reactionFeed =
        FirebaseDatabase.instance.ref('gameReactions22/${widget.gameId}');

    var game = widget.game;
    print(widget.gameId);

    Stream<DatabaseEvent> stream = reactionFeed.onValue;
    Map existingReactions;

// Subscribe to the stream!
    stream.listen((DatabaseEvent event) {
      existingReactions = event.snapshot.value;
    });

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
                Text("No play-by-play data yet..."),
                game.gameStatus > 1
                    ? ElevatedButton(
                        onPressed: () {
                          var date = game.gameTimeHome;
                          getPbpData(date, widget.gameId);
                        },
                        child: Text("Refresh"))
                    : Text(
                        getStartCountdown(game),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      ),
                SizedBox(
                  height: 25,
                ),
                ArenaCard(
                  game: game,
                ),
                GameOfficials(
                  game: game,
                ),
                //game.gameStatus < 3 ? HowToWatchCard(game: game) : Text(''),
                //game.gameStatus < 3 ? getTicketsCard() : Text('')
              ]);
            }
            for (var p in values["pbp"]["actions"]) {
              list.items.add(PbpItem2(p));
            }

            list.sort();

            Provider.of<JsonFiles>(context, listen: false)
                .setPbpFeed(game.gameId, list);

            return Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (showAll) {
                        setState(() {
                          showAll = false;
                        });
                      } else {
                        setState(() {
                          showAll = true;
                        });
                      }
                    },
                    child: showAll
                        ? Text(
                            "Showing all items...",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.blue,
                            ),
                          )
                        : Text(
                            "Showing latest 200 items...",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.blue,
                            ),
                          ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  //controller: _scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: (list.items.length > 200 && !showAll)
                      ? 200
                      : list.items.length,
                  itemBuilder: (BuildContext context, int index) {
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
                    return GameFeedDisplayItem(list.items[idx], showLead,
                        widget.game, existingReactions);
                  },
                ),
              ],
            );
          }
          return Container(child: Text("Loading Game Feed..."));
        },
      ),
    );
  }

  Widget getTicketsCard() {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text("GET TICKETS", style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
                padding: EdgeInsets.fromLTRB(15, 12, 15, 5),
                child: Text(
                  //widget.game["tickets"]["mobileApp"],
                  'Coming Soon',
                  style: TextStyle(fontSize: 12),
                )),
          ],
        ),
      ),
    );
  }

  String getStartCountdown(GameData game) {
    String startTimeUTC = game.gameTimeUTC;

    if (startTimeUTC == "") {
      return "";
    }

    DateTime start = DateTime.parse(startTimeUTC);

    Duration duration = start.difference(DateTime.now());

    if (duration.inMinutes > 0) {
      return "${duration.inMinutes.toString()} min to go!";
    }

    return "";
  }

  Future<void> getPbpData(String date, String gameId) async {
    const BASE_URL = "https://cdn.nba.com/static/json/liveData/playbyplay/";
    var url = "${BASE_URL}playbyplay_${gameId}.json";

    var pbpFeed = await Network.getJson(url);

    if (pbpFeed != null) {
      var plays = pbpFeed["game"]["actions"];

      DatabaseReference pbpRef1 =
          FirebaseDatabase.instance.ref('gamePbp22/' + gameId);

      pbpRef1.set({"pbp": pbpFeed["game"]});

      if (plays.length > 0) {
        for (int j = 0; j < plays.length; j++) {
          //print(plays[j]);
          var pbp = plays[j];

          DatabaseReference pbpRef2 = FirebaseDatabase.instance.ref(
              'gameFeed22/' +
                  gameId +
                  '/' +
                  DateTime.now().millisecondsSinceEpoch.toString());

          pbpRef2.set({"pbp": pbp});
        }
      }
    }
  }
}
