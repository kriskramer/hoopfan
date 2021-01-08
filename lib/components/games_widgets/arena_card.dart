import 'package:flutter/material.dart';

class ArenaCard extends StatelessWidget {
  final dynamic gameData;

  ArenaCard({this.gameData});

  @override
  Widget build(BuildContext context) {
    var arena = gameData["arena"]["name"];
    var arenaLoc =
        gameData["arena"]["city"] + " " + gameData["arena"]["stateAbbr"];

    return Card(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(children: [
          Text(
            'ARENA',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                arena,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                arenaLoc,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
