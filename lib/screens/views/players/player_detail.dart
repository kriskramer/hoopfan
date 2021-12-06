import 'package:flutter/material.dart';

import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/player_widgets/player_advanced_stats_display.dart';
import 'package:hoop/components/player_widgets/player_base_stats_display.dart';
import 'package:hoop/components/player_widgets/player_defense_stats_display.dart';
import 'package:hoop/components/player_widgets/player_detailed_stats.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class PlayerDetail extends StatefulWidget {
  final String playerId;

  PlayerDetail({@required this.playerId});

  @override
  _PlayerDetailState createState() => _PlayerDetailState();
}

class _PlayerDetailState extends State<PlayerDetail> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var player = Provider.of<JsonFiles>(context, listen: false)
        .getPlayer(widget.playerId);

    var teamId = player["teamId"];
    var teamColor = ConstantHelper.getTeamColor(teamId);
    var teamTextColor = ConstantHelper.getTeamTextColor(teamId);

    print(widget.playerId);
    print(player["teamId"]);

    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'Player Details',
          style: TextStyle(color: Color(teamTextColor)),
        ),
        backgroundColor: teamColor != null
            ? Color(teamColor)
            : Theme.of(context).primaryColor,
      ),
      body: newMethod(player, deviceWidth, teamColor, teamTextColor),
    );
  }

  SafeArea newMethod(
      player, double deviceWidth, int teamColor, int teamTextColor) {
    String playerName = player["firstName"] + " " + player["lastName"];

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                CachedLogo(
                  url:
                      "https://cdn.nba.com/headshots/nba/latest/1040x760/${player["personId"]}.png",
                  radius: deviceWidth * 0.22,
                ),
                Column(
                  children: [
                    Text(
                      player["firstName"],
                      style: TextStyle(fontSize: 28),
                    ),
                    Text(
                      getShortString(player["lastName"]),
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        Text(
                          "#" + player["jersey"],
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          player["pos"],
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Divider(
              thickness: 2,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.white),
                //     color: Color(teamColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Height', style: TextStyle(fontSize: 14)),
                        Text(
                            player["heightFeet"] +
                                "\' " +
                                player["heightInches"] +
                                "\" (" +
                                player["heightMeters"] +
                                ")",
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text('Weight', style: TextStyle(fontSize: 14)),
                        Text(
                            player["weightPounds"] +
                                " (" +
                                player["weightKilograms"] +
                                ")",
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text('Country', style: TextStyle(fontSize: 14)),
                        Text(player["country"], style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text('Years Pro', style: TextStyle(fontSize: 14)),
                        Text(player["yearsPro"],
                            style: TextStyle(fontSize: 14)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.white),
                //     color: Color(teamColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Age', style: TextStyle(fontSize: 14)),
                        Text(getAge(player["dateOfBirthUTC"]),
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text('Birthday', style: TextStyle(fontSize: 14)),
                        Text(player["dateOfBirthUTC"],
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text('Drafted', style: TextStyle(fontSize: 14)),
                        Row(
                          children: [
                            Text("Pick " + player["draft"]["pickNum"],
                                style: TextStyle(fontSize: 14)),
                            Text(" R" + player["draft"]["roundNum"],
                                style: TextStyle(fontSize: 14)),
                            Text(" " + player["draft"]["seasonYear"],
                                style: TextStyle(fontSize: 14)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text('College', style: TextStyle(fontSize: 14)),
                        Text(getShortString(player["lastAffiliation"]),
                            style: TextStyle(fontSize: 14)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PlayerDetailedStats(widget.playerId, playerName),
                      ));
                },
                child: Text(
                  "Detailed Stats",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(teamColor))),
              ),
              SizedBox(
                width: 40,
              )
            ]),
            SizedBox(
              height: 15,
            ),
            PlayerBaseStatsDisplay(widget.playerId),
            SizedBox(
              height: 15,
            ),
            PlayerAdvancedStatsDisplay(widget.playerId),
            SizedBox(
              height: 15,
            ),
            PlayerDefenseStatsDisplay(widget.playerId),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  String getAge(String utcDob) {
    var dob = DateTime.parse(utcDob);
    var now = DateTime.now();
    var age = now.difference(dob);
    var years = age.inDays / 365;
    return years.floor().toString();
  }

  String getShortString(String value) {
    if (value.length > 14) {
      return value.substring(0, 13) + "...";
    } else {
      return value;
    }
  }
}
