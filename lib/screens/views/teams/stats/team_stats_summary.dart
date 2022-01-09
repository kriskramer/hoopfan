import 'package:flutter/material.dart';
import 'package:hoop/components/teams_widgets/team_advanced_stats_card.dart';
import 'package:hoop/components/teams_widgets/team_base_stats_card.dart';
import 'package:hoop/components/teams_widgets/team_estimated_stats_card.dart';
import 'package:hoop/components/teams_widgets/team_ff_stats_card.dart';
import 'package:hoop/components/teams_widgets/team_misc_stats_card.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:provider/provider.dart';

class TeamStatsSummaryView extends StatefulWidget {
  final String teamId;

  TeamStatsSummaryView({this.teamId});

  @override
  _TeamStatsSummaryViewState createState() => _TeamStatsSummaryViewState();
}

class _TeamStatsSummaryViewState extends State<TeamStatsSummaryView> {
  @override
  Widget build(BuildContext context) {
    final LeagueStandingList standings =
        Provider.of<JsonFiles>(context, listen: false).getLeagueStandings();
    final teamStandings = standings.getTeamStandings(widget.teamId);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [
            Container(
              //padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    standing(teamStandings.wins.toString(), "Win"),
                    standing(teamStandings.losses.toString(), "Loss"),
                    standing(teamStandings.winPct.toString(), "Win %"),
                    standing(
                        teamStandings.conferenceGamesBack.toString(), "GB"),
                    standing(
                        teamStandings.strCurrentStreak.toString(), "Streak"),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    standing("${teamStandings.l10}", "Last 10"),
                    standing("${teamStandings.conferenceRecord}", "Conf"),
                    standing("${teamStandings.divisionRecord}", "Div"),
                    standing("${teamStandings.home}", "Home"),
                    standing("${teamStandings.road}", "Away"),
                  ],
                ),
              ]),
            ),
            SizedBox(height: 15),
            getSectionHeader('Base Stats'),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                  "Standard basketball stats typically found in a box score."),
            ),
            TeamBaseStatsCard(
              teamId: widget.teamId,
            ),
            SizedBox(
              height: 20,
            ),
            getSectionHeader('Advanced Stats'),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                  "Advanced Stats are a way to study basketball through objective analysis. It is a more in-depth way to look at a simple box score, and more accurately evaluates the skill and production of a player or team."),
            ),
            TeamAdvancedStatsCard(
              teamId: widget.teamId,
            ),
            SizedBox(
              height: 20,
            ),
            getSectionHeader('Estimated Stats'),
            Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                    "An estimate of specific stats based on performance so far.")),
            TeamEstimatedStatsCard(
              teamId: widget.teamId,
            ),
            SizedBox(
              height: 20,
            ),
            getSectionHeader('Four Factors'),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                  "The four factors of winning basketball are to score efficiently, protect the basketball on offense, grab as many rebounds as possible, and get to the foul line as often as possible."),
            ),
            TeamFourFactorsStatsCard(
              teamId: widget.teamId,
            ),
            SizedBox(
              height: 20,
            ),
            getSectionHeader('Misc Stats'),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                  "Misc stats show types of scoring opportunities for the team and its opponent."),
            ),
            TeamMiscStatsCard(
              teamId: widget.teamId,
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget getSectionHeader(String title) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          //color: Colors.blue[100],
          border: Border(
        bottom: BorderSide(color: Colors.blue),
        //top: BorderSide(color: Colors.grey)
      )),
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  dynamic getTeamStandingsFromJson(
      String teamId, dynamic json, String conference) {
    dynamic team;

    if (conference.toLowerCase() == "east") {
      for (var t in json["east"]) {
        if (t["teamId"] == teamId) {
          team = t;
          break;
        }
      }
    } else {
      for (var t in json["west"]) {
        if (t["teamId"] == teamId) {
          team = t;
          break;
        }
      }
    }

    return team;
  }

  Widget standing(String value, String desc) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            "$desc",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          Container(
              height: 1,
              width: 30,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400], width: 1))),
          Text(
            value,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
