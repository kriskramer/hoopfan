import 'package:flutter/material.dart';
import 'package:hoop/components/standings_widgets/custom_picker.dart';
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0XFFced6e0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListTile(
                leading: Text(
                  "Filter by:",
                  style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                trailing: customPicker(
                  context,
                  [" Last 5 games", " Last 10 games"],
                  Color(0XFFced6e0),
                  " Last 5 games",
                  (todo) {
                    print("Do something");
                  },
                  dropDownColor: Color(0XFFced6e0),
                  textColour: Colors.black,
                ),
              ),
            ),
          ),
          getSectionHeader('Base Stats'),
          TeamBaseStatsCard(
            teamId: widget.teamId,
          ),
          SizedBox(
            height: 20,
          ),
          getSectionHeader('Advanced Stats'),
          TeamAdvancedStatsCard(
            teamId: widget.teamId,
          ),
          SizedBox(
            height: 20,
          ),
          getSectionHeader('Estimated Stats'),
          TeamEstimatedStatsCard(
            teamId: widget.teamId,
          ),
          SizedBox(
            height: 20,
          ),
          getSectionHeader('Four Factors'),
          TeamFourFactorsStatsCard(
            teamId: widget.teamId,
          ),
          SizedBox(
            height: 20,
          ),
          getSectionHeader('Misc Stats'),
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
