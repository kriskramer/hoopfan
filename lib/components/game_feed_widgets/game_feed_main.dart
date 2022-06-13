import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_display_item.dart';
import 'package:hoop/components/games_widgets/arena_card.dart';
import 'package:hoop/components/games_widgets/game_officials.dart';
import 'package:hoop/components/games_widgets/how_to_watch_card.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';
import 'package:hoop/providers/game_settings.dart';
import 'package:hoop/screens/views/games/game_view.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
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
    var gameData = widget.gameData;
    var gameStatus = gameData["statusNum"];

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
                gameStatus > 1
                    ? ElevatedButton(
                        onPressed: () {
                          var date = widget.gameData["homeStartDate"];
                          getPbpData(date, widget.gameId);
                        },
                        child: Text("Refresh"))
                    : Text(
                        getStartCountdown(widget.gameData),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      ),
                SizedBox(
                  height: 25,
                ),
                ArenaCard(
                  gameData: gameData,
                ),
                GameOfficials(
                  game: gameData,
                ),
                gameStatus < 3 ? HowToWatchCard(game: gameData) : Text(''),
                gameStatus < 3 ? getTicketsCard() : Text('')
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

  String getStartCountdown(dynamic game) {
    String startTimeUTC = game["startTimeUTC"];

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
    // Get the current period's pbp feed in real-time
    var currentPeriod = widget.gameData["period"]["current"];

    for (int i = 1; i <= currentPeriod; i++) {
      var _pbpFeed =
          await Network.getJson(Urls.nbaPlayByPlay(date, gameId, i.toString()));
      //print(_pbpFeed);
      var plays = _pbpFeed["plays"];

      if (plays.length > 0) {
        for (int j = 0; j < plays.length; j++) {
          print(plays[j]);
          var pbp = plays[j];

          DatabaseReference pbpFeed = FirebaseDatabase.instance.ref(
              'gameFeed/' +
                  gameId +
                  '/' +
                  DateTime.now().millisecondsSinceEpoch.toString());

          pbpFeed.set({
            "type": "1",
            "period": i,
            "clock": pbp["clock"],
            "description": pbp["description"],
            "hTeamScore": pbp["hTeamScore"],
            "vTeamScore": pbp["vTeamScore"],
            "eventMsgType": pbp["eventMsgType"],
            "personId": pbp["personId"],
            "teamId": pbp["teamId"],
            "isScoreChange": pbp["isScoreChange"],
            "isVideoAvailable": pbp["isVideoAvailable"],
            "formatted": pbp["formatted"]
          });
        }
      }
    }
  }
}
