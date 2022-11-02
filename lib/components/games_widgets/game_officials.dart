import 'package:flutter/material.dart';
import 'package:hoop/models/game_data.dart';

class GameOfficials extends StatelessWidget {
  final GameData game;

  GameOfficials({this.game});

  @override
  Widget build(BuildContext context) {
    String returnValue = "";

    if (game.officials.officials.length == 0) {
      returnValue = "Not yet listed";
    } else {
      for (var o in game.officials.officials) {
        returnValue += o.nameI;
        returnValue += ", ";
      }

      if (returnValue == "") {
        returnValue = "Not yet listed.";
      }
    }

    return Card(
      elevation: 1,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Text(
              "OFFICIALS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(returnValue)
          ],
        ),
      ),
    );
  }
}
