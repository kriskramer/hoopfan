import 'package:flutter/material.dart';

class GameOfficials extends StatelessWidget {
  final dynamic game;

  GameOfficials({this.game});

  @override
  Widget build(BuildContext context) {
    dynamic officials = game["officials"]["formatted"];
    String returnValue = "";

    for (var o in officials) {
      returnValue += o["firstNameLastName"];
      returnValue += ", ";
    }

    if (returnValue == "") {
      returnValue = "Not yet listed.";
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
