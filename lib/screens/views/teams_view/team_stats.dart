import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/screens/views/teams_view/team_stats_last_n_games.dart';
import 'package:hoop/screens/views/teams_view/team_stats_lineups.dart';
import 'package:hoop/screens/views/teams_view/team_stats_shooting.dart';
import 'package:hoop/screens/views/teams_view/team_stats_splits_main.dart';
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
  // bool showSummary = true;
  // bool showShooting = false;
  // bool showLineups = false;
  // bool showSplits = false;

  // void summaryClick() {
  //   setState(() {
  //     showSummary = true;
  //     showShooting = false;
  //     showLineups = false;
  //     showSplits = false;
  //   });
  // }

  // void shootingClick() {
  //   setState(() {
  //     showSummary = false;
  //     showShooting = true;
  //     showLineups = false;
  //     showSplits = false;
  //   });
  // }

  // void splitsClick() {
  //   setState(() {
  //     showSummary = false;
  //     showShooting = false;
  //     showLineups = false;
  //     showSplits = true;
  //   });
  // }

  // void lineupsClick() {
  //   setState(() {
  //     showSummary = false;
  //     showShooting = false;
  //     showLineups = true;
  //     showSplits = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final teamColor = ConstantHelper.getTeamColor(widget.teamId);
    final teamTextColor = ConstantHelper.getTeamTextColor(widget.teamId);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: teamColor != null
              ? Color(teamColor)
              : Theme.of(context).primaryColor,
          title: Text('Team Stats'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Text("Summary",
                    style: TextStyle(color: Color(teamTextColor))),
              ),
              Tab(
                child: Text("Last N",
                    style: TextStyle(color: Color(teamTextColor))),
              ),
              Tab(
                child: Text("Shooting",
                    style: TextStyle(color: Color(teamTextColor))),
              ),
              Tab(
                child: Text("Splits",
                    style: TextStyle(color: Color(teamTextColor))),
              ),
              Tab(
                child: Text("Lineups",
                    style: TextStyle(color: Color(teamTextColor))),
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          FutureBuilder(
              future: loadData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasData) {
                  return Column(
                      children: [SizedBox(height: 20), Text('No data')]);
                }

                if (snapshot.hasData) {
                  return TeamStatsSummaryView(teamId: widget.teamId);
                } else {
                  return NoConnection();
                }
              }),
          TeamStatsLastNGames(teamId: widget.teamId),
          TeamStatsShootingView(teamId: widget.teamId),
          TeamStatsSplitsView(teamId: widget.teamId),
          TeamStatsLineupsView(teamId: widget.teamId),
        ]),
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
