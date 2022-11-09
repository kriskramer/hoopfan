import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/game_data.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';
import 'package:provider/provider.dart';

class GamePbpPopup extends StatefulWidget {
  final String gameId;
  final PbpItem2 pbp;

  const GamePbpPopup({this.gameId, this.pbp});

  @override
  State<GamePbpPopup> createState() => _GamePbpPopupState();
}

class _GamePbpPopupState extends State<GamePbpPopup> {
  int cheersCount = 0;
  int boosCount = 0;
  String enoughCheers = "";
  String enoughBoos = "";

  @override
  Widget build(BuildContext context) {
    // DatabaseReference pbpFeed =
    //     FirebaseDatabase.instance.ref('gamePbp22/${widget.gameId}/pbp/actions');

    String gameId = widget.gameId;
    var pbp = widget.pbp;
    String key = pbp.timestamp.toString();

    cheersCount =
        Provider.of<JsonFiles>(context, listen: false).getGameCheers(key);
    if (cheersCount == null) cheersCount = 0;

    boosCount = Provider.of<JsonFiles>(context, listen: false).getGameBoos(key);
    if (boosCount == null) boosCount = 0;

    // DatabaseReference reactions = FirebaseDatabase.instance
    //     .ref('gameReactions22/$gameId/pbp/${pbp.orderNumber}');

    if (pbp == null) {
      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 8,
          child: Center(
              child: Text("Data Not Found", style: TextStyle(fontSize: 20))));
    } else {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Center(
                child: Text(
                  widget.pbp.description,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Boo"),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Cheer"),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.thumb_down,
                                ),
                                iconSize: 30,
                                color: Colors.red,
                                splashColor: Colors.purple,
                                onPressed: () {
                                  setState(() {
                                    doBoo(gameId, widget.pbp.orderNumber, 3);
                                  });
                                },
                              ),
                              // boos == 3
                              //     ? Text(
                              //         "+" + boos.toString(),
                              //         style: TextStyle(
                              //             fontSize: 12,
                              //             color: Colors.red),
                              //       )
                              //     : SizedBox()
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.thumb_down,
                                ),
                                iconSize: 15,
                                color: Colors.red,
                                splashColor: Colors.purple,
                                onPressed: () {
                                  setState(() {
                                    doBoo(gameId, widget.pbp.orderNumber, 1);
                                  });
                                },
                              ),
                              // boos == 1
                              //     ? Text(
                              //         "+" + boos.toString(),
                              //         style: TextStyle(
                              //             fontSize: 12,
                              //             color: Colors.red),
                              //       )
                              //     : SizedBox()
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                ),
                                iconSize: 15,
                                color: Colors.green,
                                splashColor: Colors.orange,
                                onPressed: () {
                                  setState(() {
                                    doCheer(gameId, widget.pbp.orderNumber, 1);
                                  });
                                },
                              ),
                              // cheers == 1
                              //     ? Text(
                              //         "+" + cheers.toString(),
                              //         style: TextStyle(
                              //             fontSize: 12,
                              //             color: Colors.green),
                              //       )
                              //     : SizedBox()
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                ),
                                iconSize: 30,
                                color: Colors.green,
                                splashColor: Colors.orange,
                                onPressed: () {
                                  setState(() {
                                    doCheer(gameId, widget.pbp.orderNumber, 3);
                                  });
                                },
                              ),
                              // cheers == 3
                              //     ? Text(
                              //         "+" + cheers.toString(),
                              //         style: TextStyle(
                              //             fontSize: 12,
                              //             color: Colors.green),
                              //       )
                              //     : SizedBox()
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ]),
          ),
        ),
      );
    }
  }

  /// Register a cheer for the given PBP item, with a maximum of 5
  void doCheer(gameId, key, cheers) async {
    // DatabaseReference feed =
    //     FirebaseDatabase.instance.ref('gameFeed22/$gameId/$key/pbp');
    DatabaseReference feed =
        FirebaseDatabase.instance.ref('gameReactions22/$gameId/pbp/$key');

    int currentCheers = 0;

    DatabaseEvent e = await feed.once();
    print(e.snapshot.value);
    Map f = e.snapshot.value;
    if (f != null) {
      if (f["cheers"] != null) currentCheers = f["cheers"];
    }

    await feed.update({
      "cheers": cheers + currentCheers,
    });

    // This is a hack. Updating the pbp order number to itself to trigger a build
    // in the game feed since it's listening to the gamepbp22 collection already
    DatabaseReference pbpFeed = FirebaseDatabase.instance
        .ref('gamePbp22/${widget.gameId}/pbp/react/$key');
    pbpFeed.remove();
    pbpFeed.set({key: key});

    // cheersCount++;
    // Provider.of<JsonFiles>(context, listen: false)
    //     .setGameCheers(key.toString(), cheersCount);
    Navigator.of(context, rootNavigator: true).pop();
  }

  /// Register a boo for the given PBP item, with a maximum of 5
  void doBoo(gameId, key, boos) async {
    DatabaseReference feed =
        FirebaseDatabase.instance.ref('gameReactions22/$gameId/pbp/$key');

    int currentBoos = 0;

    DatabaseEvent e = await feed.once();
    print(e.snapshot.value);
    Map f = e.snapshot.value;
    if (f != null) {
      if (f["boos"] != null) currentBoos = f["boos"];
    }

    await feed.update({
      "boos": boos + currentBoos,
    });

    // This is a hack. Updating the pbp order number to itself to trigger a build
    // in the game feed since it's listening to the gamepbp22 collection already
    DatabaseReference pbpFeed = FirebaseDatabase.instance
        .ref('gamePbp22/${widget.gameId}/pbp/react/$key');
    pbpFeed.remove();
    pbpFeed.set({key: key});

    // boosCount++;
    // Provider.of<JsonFiles>(context, listen: false)
    //     .setGameBoos(key.toString(), boosCount);
    Navigator.of(context, rootNavigator: true).pop();
  }
}
