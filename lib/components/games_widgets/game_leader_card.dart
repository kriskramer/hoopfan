import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/screens/views/players/player_detail.dart';
import 'package:provider/provider.dart';

class GameLeaderCard extends StatelessWidget {
  final String playerId;
  final String value;
  final String description;
  final int teamColor;
  final int teamTextColor;
  final String triCode;

  GameLeaderCard(
      {@required this.playerId,
      @required this.description,
      @required this.value,
      this.teamColor,
      this.teamTextColor,
      this.triCode});

  @override
  Widget build(BuildContext context) {
    dynamic player =
        Provider.of<JsonFiles>(context, listen: false).getPlayer(playerId);

    return playerId != ""
        ? Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border(
                    bottom: BorderSide(width: 5, color: Color(teamColor)))),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                      elevation: 1,
                      child: Container(
                        color: Color(teamColor),
                        padding: EdgeInsets.all(10),
                        child: Text(triCode,
                            style: TextStyle(
                              color: Color(teamTextColor),
                            )),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  CachedLogo(
                    url:
                        "https://cdn.nba.com/headshots/nba/latest/1040x760/$playerId.png",
                    radius: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(children: [
                    Text(player["firstName"]),
                    Text(player["lastName"])
                  ]),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    value,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          )
        : Text('');
  }
}
