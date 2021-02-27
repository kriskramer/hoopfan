import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/standings_widgets/table.dart';
import 'package:hoop/components/standings_widgets/table_div.dart';

class Standings extends StatefulWidget {
  @override
  _StandingsState createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  LeagueStandingList standingsList;

  // This is the first screen to load up so I'm using this as the default 'load everything' method
  Future<bool> loadData() async {
    bool complete = false;
    standingsList =
        Provider.of<JsonFiles>(context, listen: false).getLeagueStandings();

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
    } else {
      complete = true;
    }

    return complete;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == true) {
          standingsList = Provider.of<JsonFiles>(context, listen: false)
              .getLeagueStandings();

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         colorFilter: new ColorFilter.mode(
              //             Colors.black.withOpacity(0.15), BlendMode.dstATop),
              //         image: AssetImage("images/bball1.jpg"),
              //         fit: BoxFit.fitHeight)),
              child: //Container(height: 1800, color: Color.fromRGBO(255, 255, 255, 0.8)),
                  Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: double.infinity,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(color: Colors.grey[400]))),
                      child: Center(
                        child: Text(
                          'Conference Standings',
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'East',
                    style: TextStyle(fontSize: 18),
                  ),
                  ConfTable(list: standingsList.getConferenceStandings('East')),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'West',
                    style: TextStyle(fontSize: 18),
                  ),
                  ConfTable(list: standingsList.getConferenceStandings('West')),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: double.infinity,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(color: Colors.grey[400]))),
                      child: Center(
                        child: Text(
                          'Division Standings',
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Atlantic',
                    style: TextStyle(fontSize: 18),
                  ),
                  DivTable(
                      list: standingsList.getDivisionStandings("Atlantic")),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Central',
                    style: TextStyle(fontSize: 18),
                  ),
                  DivTable(list: standingsList.getDivisionStandings("Central")),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Southeast',
                    style: TextStyle(fontSize: 18),
                  ),
                  DivTable(
                      list: standingsList.getDivisionStandings("Southeast")),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Northwest',
                    style: TextStyle(fontSize: 18),
                  ),
                  DivTable(
                      list: standingsList.getDivisionStandings("Northwest")),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Pacific',
                    style: TextStyle(fontSize: 18),
                  ),
                  DivTable(list: standingsList.getDivisionStandings("Pacific")),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Southwest',
                    style: TextStyle(fontSize: 18),
                  ),
                  DivTable(
                      list: standingsList.getDivisionStandings("Southwest")),
                ],
              ),
            ),
          );
        } else if (snapshot.data == false) {
          return NoConnection();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
