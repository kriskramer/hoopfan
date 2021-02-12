import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';
import 'package:hoop/components/standings_widgets/tabbar.dart';
import 'package:hoop/components/connection.dart';

class Standings extends StatefulWidget {
  @override
  _StandingsState createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  LeagueStandingList standingsList;

  // This is the first screen to load up so I'm using this as the default 'load everything' method
  Future<bool> loadData() async {
    bool complete = false;
    //String year = Provider.of<JsonFiles>(context, listen: false).getYear();

    if (standingsList == null) {
      try {
        var newStandings = await Network.getJson(
          Urls.getNbaStatsLeagueStandings(),
          requestHeaders: RequestHeaders.nbaStatsHeaders,
        );
        var players = await Network.getJson(Urls.nbaAllPlayers());
        var teams = await Network.getJson(Urls.nbaAllTeams());

        standingsList = LeagueStandingList(newStandings);
        Provider.of<JsonFiles>(context, listen: false)
            .setLeagueStandings(standingsList);

        Provider.of<JsonFiles>(context, listen: false).setAllPlayers(players);
        Provider.of<JsonFiles>(context, listen: false).setAllTeams(teams);

        Provider.of<JsonFiles>(context, listen: false)
            .setSelectedDate(DateTime.now());

        if (Provider.of<JsonFiles>(context, listen: false)
                .getLeagueStandings() !=
            null) {
          complete = true; // data gotten
        }
      } catch (e) {
        print(e);
      }
    }

    return complete;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF1F6BA3),
          automaticallyImplyLeading: false, // hides back arrow button
          toolbarHeight: 60,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Conference",
              ),
              Tab(
                text: "Division",
              )
            ],
          ),
        ),
        body: (Provider.of<JsonFiles>(context, listen: false)
                    .getLeagueStandings() ==
                null)
            ? FutureBuilder(
                future: loadData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  Widget table;
                  if (snapshot.data == true) {
                    var standings =
                        Provider.of<JsonFiles>(context, listen: false)
                            .getLeagueStandings();
                    table = Bar(list: standings);
                  } else if (snapshot.data == false) {
                    table = NoConnection();
                  } else {
                    table = Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return table;
                },
              )
            : Bar(
                list: Provider.of<JsonFiles>(context, listen: false)
                    .getLeagueStandings()),
      ),
    );
  }
}
