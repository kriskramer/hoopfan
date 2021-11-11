import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/screens/views/teams_view/team_stats_lineups.dart';
import 'package:hoop/screens/views/teams_view/team_stats_shooting.dart';
import 'package:hoop/screens/views/teams_view/team_stats_summary.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

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
        child: FutureBuilder(
            future: loadData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  !snapshot.hasData) {
                return Column(
                    children: [SizedBox(height: 20), Text('No data')]);
              }
              if (snapshot.hasData) {
                return Container(
                  child: Column(children: [
                    ButtonBar(
                        alignment: MainAxisAlignment.center,
                        layoutBehavior: ButtonBarLayoutBehavior.constrained,
                        children: [
                          ElevatedButton(
                            child: Text(
                              'Summary',
                              style: TextStyle(
                                  color: showSummary
                                      ? Colors.black
                                      : Color(teamTextColor)),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              primary: showSummary
                                  ? Colors.grey[400]
                                  : Color(teamColor),
                            ),
                            onPressed: () {
                              summaryClick();
                            },
                          ),
                          ElevatedButton(
                            child: Text(
                              'Shooting',
                              style: TextStyle(
                                  color: showShooting
                                      ? Colors.black
                                      : Color(teamTextColor)),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              primary: showShooting
                                  ? Colors.grey[400]
                                  : Color(teamColor),
                            ),
                            onPressed: () {
                              shootingClick();
                            },
                          ),
                          ElevatedButton(
                            child: Text(
                              'Lineups',
                              style: TextStyle(
                                  color: showLineups
                                      ? Colors.black
                                      : Color(teamTextColor)),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              primary: showLineups
                                  ? Colors.grey[400]
                                  : Color(teamColor),
                            ),
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
                  ]),
                );
              } else {
                return NoConnection();
              }
            }),
      ),
    );
  }

  Future<bool> loadData() async {
    if (Provider.of<JsonFiles>(context, listen: false)
            .getEstimatedTeamStats() ==
        null) {
      dynamic estimatedTeamStats = await Network.getJson(
        Urls.getNbaStatsEstimatedMetricsAllTeams(),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setEstimatedTeamStats(estimatedTeamStats);
    }

    if (Provider.of<JsonFiles>(context, listen: false).getAdvancedTeamStats() ==
        null) {
      dynamic advancedTeamStats = await Network.getJson(
        Urls.getNbaStatsTeamStatisticsAdvanced(),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setAdvancedTeamStats(advancedTeamStats);
    }

    if (Provider.of<JsonFiles>(context, listen: false).getBaseTeamStats() ==
        null) {
      dynamic baseTeamStats = await Network.getJson(
        Urls.getNbaStatsTeamStatisticsBase(),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setBaseTeamStats(baseTeamStats);
    }

    if (Provider.of<JsonFiles>(context, listen: false).getMiscTeamStats() ==
        null) {
      dynamic miscTeamStats = await Network.getJson(
        Urls.getNbaStatsTeamStatisticsMisc(),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setMiscTeamStats(miscTeamStats);
    }

    if (Provider.of<JsonFiles>(context, listen: false)
            .getFourFactorsTeamStats() ==
        null) {
      dynamic stats = await Network.getJson(
        Urls.getNbaStatsTeamStatisticsFourFactors(),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setFourFactorsTeamStats(stats);
    }

    return true;
  }
}
