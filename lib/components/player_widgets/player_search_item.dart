import 'package:flutter/material.dart';
import 'package:hoop/screens/views/players/player_detail.dart';

class PlayerSearchItem extends StatelessWidget {
  final dynamic player;
  const PlayerSearchItem({this.player});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //dynamic teamsJson;

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PlayerDetail(playerId: player["personId"])),
          );
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 7, 5, 7),
          child: Row(
            children: [
              Container(
                width: 30,
                child: Row(
                  children: [
                    Text(player["jersey"]),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Text(player["firstName"]),
              SizedBox(
                width: 5,
              ),
              Text(player["lastName"]),
            ],
          ),
        ));
  }
}
