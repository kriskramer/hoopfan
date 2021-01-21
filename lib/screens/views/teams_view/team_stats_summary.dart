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
    return Container(
      child: Column(
        children: [
          Text(
            'Base Stats',
            style: TextStyle(fontSize: 20),
          ),
          TeamBaseStatsCard(
            teamId: widget.teamId,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Advanced Stats',
            style: TextStyle(fontSize: 20),
          ),
          TeamAdvancedStatsCard(
            teamId: widget.teamId,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Estimated Stats',
            style: TextStyle(fontSize: 20),
          ),
          TeamEstimatedStatsCard(
            teamId: widget.teamId,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Four Factors',
            style: TextStyle(fontSize: 20),
          ),
          TeamFourFactorsStatsCard(
            teamId: widget.teamId,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Misc Stats',
            style: TextStyle(fontSize: 20),
          ),
          TeamMiscStatsCard(
            teamId: widget.teamId,
          ),
          SizedBox(
            height: 60,
          ),
        ],
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
