import 'package:flutter/material.dart';
import 'package:hoop/models/game_data.dart';

class ArenaCard extends StatelessWidget {
  final GameData game;

  ArenaCard({this.game});

  @override
  Widget build(BuildContext context) {
    var arena = game.arena.arenaName;
    var arenaLoc = game.arena.arenaCity + " " + game.arena.arenaState;

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
