import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class TeamLeaderCard extends StatelessWidget {
  final String playerId;
  final String value;

  TeamLeaderCard({this.playerId, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey[300]),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 200,
            child: Column(
              children: [
                CachedLogo(
                  url:
                      "https://cdn.nba.com/headshots/nba/latest/1040x760/$playerId.png",
                  radius: 35,
                ),
                Text(
                  getPlayerName(playerId, context),
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }

  String getPlayerName(String playerId, BuildContext context) {
    var player =
        Provider.of<JsonFiles>(context, listen: false).getPlayer(playerId);

    if (player != null) {
      return player["firstName"] + " " + player["lastName"];
    } else {
      return "Unknown Player";
    }
  }
}
