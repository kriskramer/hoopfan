import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';

class GamePbpPopup extends StatefulWidget {
  final dynamic game;
  final dynamic stats;
  final PbpItem pbp;

  const GamePbpPopup({this.game, this.stats, this.pbp});

  @override
  State<GamePbpPopup> createState() => _GamePbpPopupState();
}

class _GamePbpPopupState extends State<GamePbpPopup> {
  @override
  Widget build(BuildContext context) {
    String gameId = widget.game["gameId"];
    var pbp = widget.pbp;

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
                      setState(() {
                        doBoo(gameId, widget.pbp.timestamp, widget.pbp.boos);
                      });
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
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
                      setState(() {
                        doCheer(
                            gameId, widget.pbp.timestamp, widget.pbp.cheers);
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      );
    }
  }

  void doCheer(gameId, key, cheers) {
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

    Navigator.of(context, rootNavigator: true).pop();
  }

  void doBoo(gameId, key, boos) {
    DatabaseReference feed =
        FirebaseDatabase.instance.ref('gameFeed/$gameId/$key');

    if (boos == null) {
      boos = 1;
    } else {
      boos++;
    }

    feed.update({
      "boos": boos,
    });

    Navigator.of(context, rootNavigator: true).pop();
  }
}
