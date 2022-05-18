import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';
import 'package:provider/provider.dart';

class GamePbpPopup extends StatefulWidget {
  final dynamic game;
  final dynamic stats;
  final PbpItem pbp;

  const GamePbpPopup({this.game, this.stats, this.pbp});

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
    String gameId = widget.game["gameId"];
    var pbp = widget.pbp;
    String key = pbp.timestamp.toString();

    cheersCount =
        Provider.of<JsonFiles>(context, listen: false).getGameCheers(key);
    if (cheersCount == null) cheersCount = 0;

    boosCount = Provider.of<JsonFiles>(context, listen: false).getGameBoos(key);
    if (boosCount == null) boosCount = 0;

    DatabaseReference feed =
        FirebaseDatabase.instance.ref('gameFeed/$gameId/${pbp.timestamp}');

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
              StreamBuilder(
                  stream: feed.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.hasData) {
                      //print("Error on the way");
                      DataSnapshot dataValues = snapshot.data.snapshot;
                      Map<dynamic, dynamic> values = dataValues.value;
                      if (values == null) {
                        return Text("No data yet...");
                      }
                      var cheers = values["cheers"];
                      var boos = values["boos"];

                      if (cheers == null) cheers = 0;
                      if (boos == null) boos = 0;

                      // These act as a flag to prevent the value getting updated in the button tap
                      // Not an elegant solution but sorta works for now
                      var updatedCheers = cheers;
                      var updatedBoos = boos;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("Boo"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.thumb_down,
                                    ),
                                    iconSize: 40,
                                    color: Colors.red,
                                    splashColor: Colors.purple,
                                    onPressed: () {
                                      if (updatedBoos == boos) {
                                        setState(() {
                                          doBoo(gameId, widget.pbp.timestamp,
                                              boos);
                                          updatedBoos++;
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                              Row(children: [
                                Text(boos.toString(),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.red)),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("+" + boosCount.toString(),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.red)),
                              ]),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("Cheer"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.thumb_up,
                                    ),
                                    iconSize: 40,
                                    color: Colors.green,
                                    splashColor: Colors.orange,
                                    onPressed: () {
                                      if (updatedCheers == cheers) {
                                        setState(() {
                                          doCheer(gameId, widget.pbp.timestamp,
                                              cheers);
                                          updatedCheers++;
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                              Row(children: [
                                Text(cheers.toString(),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green)),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("+" + cheersCount.toString(),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green)),
                              ]),
                            ],
                          ),
                        ],
                      );
                    }
                    return NoConnection();
                  }),
              SizedBox(
                height: 10,
              ),
              Text(enoughCheers),
              Text(enoughBoos)
            ]),
          ),
        ),
      );
    }
  }

  /// Register a cheer for the given PBP item, with a maximum of 5
  void doCheer(gameId, key, cheers) async {
    enoughBoos = "";
    enoughCheers = "";
    if (cheersCount >= 5) {
      enoughCheers = "That's enough... for now.";
      return;
    }

    // TODO: If the button is pressed too fast, the counter goes up but the db update
    // doesn't keep up with it. This leads to the counter getting maxed at 5 but
    // only two entries getting added to the DB... need to find a way to either
    // slow it down or to kick off the update asynchronously to ensure it ends up
    // happening eventually.

    DatabaseReference feed =
        FirebaseDatabase.instance.ref('gameFeed/$gameId/$key');

    if (cheers == null) {
      cheers = 1;
    } else {
      cheers++;
    }

    feed.update({
      "cheers": cheers,
    });

    cheersCount++;
    Provider.of<JsonFiles>(context, listen: false)
        .setGameCheers(key.toString(), cheersCount);
    //Navigator.of(context, rootNavigator: true).pop();
  }

  /// Register a boo for the given PBP item, with a maximum of 5
  void doBoo(gameId, key, boos) async {
    enoughCheers = "";
    enoughBoos = "";
    if (boosCount >= 5) {
      enoughBoos = "That's enough... for now.";
      return;
    }

    DatabaseReference feed =
        FirebaseDatabase.instance.ref('gameFeed/$gameId/$key');

    if (boos == null) {
      boos = 1;
    } else {
      boos++;
    }

    await feed.update({
      "boos": boos,
    });

    boosCount++;
    Provider.of<JsonFiles>(context, listen: false)
        .setGameBoos(key.toString(), boosCount);
    //Navigator.of(context, rootNavigator: true).pop();
  }
}
