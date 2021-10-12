import 'package:flutter/material.dart';
import 'package:hoop/components/standings_widgets/custom_picker.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/models/season_model.dart';
import 'package:hoop/screens/views/standings_view/standings.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class LeagueMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF1F6BA3),
        automaticallyImplyLeading: false, // hides back arrow button
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          "Standings",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        actions: [
          Consumer<SeasonProv>(builder: (context, data, child) {
            return Center(
              child: customPicker(
                  context, data.seasonList, Color(0XFF1F6BA3), data.season,
                  (value) async {
                data.changeSeason(
                  value,
                );
                // TODO: Add a spinner while screen fetches data
                // TODO: Add flutter_toast package to show usefule message when fetch request fails
                try {
                  print("Getting data for $value");
                  var standings = await Network.getJson(
                    Urls.getNbaStatsLeagueStandings(season: value),
                    requestHeaders: RequestHeaders.nbaStatsHeaders,
                  );
                  Provider.of<JsonFiles>(context, listen: false)
                      .setLeagueStandings(
                    LeagueStandingList(standings),
                  );
                  Provider.of<SeasonProv>(context, listen: false).setView(
                    league: false,
                    conference: true,
                    division: false,
                  );
                } catch (e) {
                  print(e);
                }
              }),
            );
          }),
          SizedBox(
            width: 3,
          )
        ],
      ),
      body: Standings(),
    );
  }
}
