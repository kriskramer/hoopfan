import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/screens/views/teams_view/team_main.dart';

// Generates list of teams in alphabetical order and displays as a card
List<Widget> teams(BuildContext context) {
  List<Widget> teamCard = [];
  Map allTeams = {}; // combine all teams into single map
  allTeams.addAll(allTeams);

  for (String id in sortedIds) {
    teamCard.add(
      GestureDetector(
        onTap: () {
          //dynamic teamsJson;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TeamDetails(
                nbaTeamId: allTeams[id][5],
              ),
            ),
          );
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    child: CachedLogo(
                      url: allTeams[id][2],
                      radius: 20,
                    ),
                    radius: 20,
                    backgroundColor: Colors.transparent,
                  ),
                  Text(
                    allTeams[id][0].toString().toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  return teamCard;
}
