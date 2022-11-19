import 'package:flutter/material.dart';
//import 'package:hoop/components/games_widgets/completed_game_card.dart';
import 'package:hoop/components/games_widgets/headers/completed_game_card_viewing_team.dart';
import 'package:hoop/components/games_widgets/headers/in_progress_game_card.dart';
import 'package:hoop/components/teams_widgets/scheduled_game_card.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class TeamSchedule extends StatelessWidget {
  final String teamId;
  TeamSchedule({@required this.teamId});

  @override
  Widget build(BuildContext context) {
    //print('Team Schedule');
    List<dynamic> teamSchedule = [];
    List<dynamic> preseasonGames = [];
    List<dynamic> regseasonGames = [];

    var fullSchedule =
        Provider.of<JsonFiles>(context, listen: false).getFullSchedule();

    var nbaSchedule = fullSchedule["league"]["standard"];

    for (var s in nbaSchedule) {
      if (s["hTeam"]["teamId"].toString() == teamId ||
          s["vTeam"]["teamId"].toString() == teamId) {
        teamSchedule.add(s);
      }
    }

    for (var g in teamSchedule) {
      if (g["seasonStageId"] == 1) {
        preseasonGames.add(g);
      } else if (g["seasonStageId"] == 2) {
        regseasonGames.add(g);
      }
    }

    //print(teamSchedule);

    return Scaffold(
        appBar: AppBar(
          title: Text("Team Schedule"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              child: Column(
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
                  if (preseasonGames[index]["statusNum"] == 1) {
                    return ScheduledGameCard(
                      game: preseasonGames[index],
                      teamId: teamId,
                    );
                  } else if (preseasonGames[index]["statusNum"] == 2) {
                    return InProgressGameCard(game: preseasonGames[index]);
                  } else if (preseasonGames[index]["statusNum"] == 3) {
                    return CompletedGameCardViewingTeam(
                      game: preseasonGames[index],
                      viewingTeam: teamId,
                    );
                  }
                  // If I can't resolve the statusNum, just return scheduled game card
                  return ScheduledGameCard(
                      game: preseasonGames[index], teamId: teamId);
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
                  if (regseasonGames[index]["statusNum"] == 1) {
                    return ScheduledGameCard(
                        game: regseasonGames[index], teamId: teamId);
                  } else if (regseasonGames[index]["statusNum"] == 2) {
                    return InProgressGameCard(game: regseasonGames[index]);
                  } else if (regseasonGames[index]["statusNum"] == 3) {
                    return CompletedGameCardViewingTeam(
                      game: regseasonGames[index],
                      viewingTeam: teamId,
                    );
                  }
                  // If I can't resolve the statusNum, just return scheduled game card
                  return ScheduledGameCard(
                      game: regseasonGames[index], teamId: teamId);
                },
              ),
            ],
          )),
        ));
  }

  String formatDate(String date) {
    String d = "";

    var dt = DateTime.parse(date);
    d = "${dt.month}-${dt.day}-${dt.year}";

    return d;
  }
}
