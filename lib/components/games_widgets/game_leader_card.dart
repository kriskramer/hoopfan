import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/screens/views/players/player_detail.dart';
import 'package:provider/provider.dart';

class GameLeaderCard extends StatelessWidget {
  final String playerId;
  final String value;
  final String description;

  GameLeaderCard(
      {@required this.playerId,
      @required this.description,
      @required this.value});

  @override
  Widget build(BuildContext context) {
    dynamic player =
        Provider.of<JsonFiles>(context, listen: false).getPlayer(playerId);

    return Container(
      margin: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          //dynamic teamsJson;

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PlayerDetail(playerId: player["personId"])),
          );
        },
        child: Column(
          children: [
            CachedLogo(
              url:
                  "https://cdn.nba.com/headshots/nba/latest/1040x760/$playerId.png",
              radius: 40,
            ),
            Column(children: [
              Text(player["firstName"]),
              Text(player["lastName"])
            ]),
            Text(
              value,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
