import 'package:flutter/material.dart';
import 'package:hoop/components/teams_widgets/team_advanced_stats_card.dart';
import 'package:hoop/components/teams_widgets/team_base_stats_card.dart';
import 'package:hoop/components/teams_widgets/team_estimated_stats_card.dart';
import 'package:hoop/components/teams_widgets/team_ff_stats_card.dart';
import 'package:hoop/components/teams_widgets/team_misc_stats_card.dart';

class TeamStatsSummaryView extends StatefulWidget {
  final String teamId;

  TeamStatsSummaryView({this.teamId});

  @override
  _TeamStatsSummaryViewState createState() => _TeamStatsSummaryViewState();
}

class _TeamStatsSummaryViewState extends State<TeamStatsSummaryView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [
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
}
