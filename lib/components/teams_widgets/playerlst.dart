import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/components/teams_widgets/roster.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class PlayerList extends StatelessWidget {
  final String teamId;
  final int teamColor;

  PlayerList({@required this.teamId, this.teamColor});

  @override
  Widget build(BuildContext context) {
    List<Map> teamRoster = new List<Map>();
    return Provider.of<JsonFiles>(context, listen: false)
                .getTeamRoster(teamId) ==
            null
        ? FutureBuilder<dynamic>(
            future: Network.getJson(Urls.nbaTeamRoster(teamId)),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              Widget playerList;

              var allPlayers = Provider.of<JsonFiles>(context, listen: false)
                  .getAllPlayers();

              if (snapshot.hasData) {
                for (var ap in allPlayers["league"]["standard"]) {
                  if (ap["teamId"] == teamId) {
                    teamRoster.add(ap);
                  }
                }

                Provider.of<JsonFiles>(context, listen: false)
                    .addTeamPlayers(teamId, teamRoster);
                playerList = Roster(
                  json: teamRoster,
                  teamColor: teamColor,
                );
              } else if (snapshot.hasError) {
                playerList = Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      size: 50,
                    ),
                    Text("Something went wrong!"),
                  ],
                );
              } else {
                playerList = Center(
                  child: CircularProgressIndicator(),
                );
              }
              return playerList;
            },
          )
        : Roster(
            json: Provider.of<JsonFiles>(context, listen: false)
                .getTeamRoster(teamId),
            teamColor: teamColor,
          );
  }
}
