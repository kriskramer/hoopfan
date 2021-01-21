import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/teams_view/team_stats_lineups.dart';
import 'package:hoop/screens/views/teams_view/team_stats_shooting.dart';
import 'package:hoop/screens/views/teams_view/team_stats_summary.dart';

class TeamStatsView extends StatefulWidget {
  final dynamic teamId;

  TeamStatsView({this.teamId});

  @override
  _TeamStatsViewState createState() => _TeamStatsViewState();
}

class _TeamStatsViewState extends State<TeamStatsView> {
  bool showSummary = true;
  bool showShooting = false;
  bool showLineups = false;

  void summaryClick() {
    setState(() {
      showSummary = true;
      showShooting = false;
      showLineups = false;
    });
  }

  void shootingClick() {
    setState(() {
      showSummary = false;
      showShooting = true;
      showLineups = false;
    });
  }

  void lineupsClick() {
    setState(() {
      showSummary = false;
      showShooting = false;
      showLineups = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final teamColor = ConstantHelper.getTeamColor(widget.teamId);
    final teamTextColor = ConstantHelper.getTeamTextColor(widget.teamId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: teamColor != null
            ? Color(teamColor)
            : Theme.of(context).primaryColor,
        title: Text('Team Stats'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            child: Column(children: [
          ButtonBar(
              alignment: MainAxisAlignment.center,
              layoutBehavior: ButtonBarLayoutBehavior.constrained,
              children: [
                RaisedButton(
                  elevation: 1,
                  child: Text(
                    'Summary',
                    style: TextStyle(
                        color:
                            showSummary ? Colors.black : Color(teamTextColor)),
                  ),
                  color: showSummary ? Colors.grey[400] : Color(teamColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    summaryClick();
                  },
                ),
                RaisedButton(
                  elevation: 1,
                  child: Text(
                    'Shooting',
                    style: TextStyle(
                        color:
                            showShooting ? Colors.black : Color(teamTextColor)),
                  ),
                  color: showShooting ? Colors.grey[400] : Color(teamColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  onPressed: () {
                    shootingClick();
                  },
                ),
                RaisedButton(
                  elevation: 1,
                  child: Text(
                    'Lineups',
                    style: TextStyle(
                        color:
                            showLineups ? Colors.black : Color(teamTextColor)),
                  ),
                  color: showLineups ? Colors.grey[400] : Color(teamColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  onPressed: () {
                    lineupsClick();
                  },
                ),
              ]),
          SizedBox(
            height: 10,
          ),
          showSummary
              ? TeamStatsSummaryView(teamId: widget.teamId)
              : SizedBox(),
          showShooting
              ? TeamStatsShootingView(teamId: widget.teamId)
              : SizedBox(),
          showLineups
              ? TeamStatsLineupsView(teamId: widget.teamId)
              : SizedBox(),
        ])),
      ),
    );
  }
}
