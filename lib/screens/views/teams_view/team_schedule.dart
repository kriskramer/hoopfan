import 'package:flutter/material.dart';
import 'package:hoop/components/teams_widgets/scheduled_game_card.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class TeamSchedule extends StatelessWidget {
  final String teamId;
  TeamSchedule({@required this.teamId});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: Network.getJson(Urls.nbaTeamSchedule(teamId, "2020")),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<dynamic> games = snapshot.data["league"]["standard"];
          List<dynamic> preseasonGames = new List<dynamic>();
          List<dynamic> regseasonGames = new List<dynamic>();

          for (var g in games) {
            if (g["seasonStageId"] == 1) {
              preseasonGames.add(g);
            } else if (g["seasonStageId"] == 2) {
              regseasonGames.add(g);
            }
          }

          return Column(
            children: [
              Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Pre Season",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: preseasonGames.length,
                itemBuilder: (context, index) {
                  return ScheduledGameCard(game: preseasonGames[index]);
                },
              ),
              Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Regular Season",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: regseasonGames.length,
                itemBuilder: (context, index) {
                  return ScheduledGameCard(game: regseasonGames[index]);
                },
              ),
            ],
          );
        } else {
          return Text(' ');
        }
      },
    ));
  }

  String formatDate(String date) {
    String d = "";

    var dt = DateTime.parse(date);
    d = "${dt.month}-${dt.day}-${dt.year}";

    return d;
  }
}
