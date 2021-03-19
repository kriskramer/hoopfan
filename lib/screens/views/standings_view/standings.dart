import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/standings_widgets/table_standings.dart';

class Standings extends StatefulWidget {
  @override
  _StandingsState createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  LeagueStandingList standingsList;
  bool confSelected = true;
  bool divSelected = false;
  bool leagueSelected = false;

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

  leagueClick() {
    setState(() {
      confSelected = false;
      divSelected = false;
      leagueSelected = true;
    });
  }

  conferenceClick() {
    setState(() {
      confSelected = true;
      divSelected = false;
      leagueSelected = false;
    });
  }

  divisionClick() {
    setState(() {
      confSelected = false;
      divSelected = true;
      leagueSelected = false;
    });
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
                  ButtonBar(
                      alignment: MainAxisAlignment.center,
                      layoutBehavior: ButtonBarLayoutBehavior.constrained,
                      children: [
                        RaisedButton(
                          child: Text(
                            'League',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: leagueSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: leagueSelected ? Colors.blue : Colors.grey,
                          onPressed: () {
                            leagueClick();
                          },
                        ),
                        RaisedButton(
                          child: Text(
                            'Conference',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: confSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: confSelected ? Colors.blue : Colors.grey,
                          onPressed: () {
                            conferenceClick();
                          },
                        ),
                        RaisedButton(
                          child: Text(
                            'Division',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: divSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: divSelected ? Colors.blue : Colors.grey,
                          onPressed: () {
                            divisionClick();
                          },
                        ),
                      ]),
                  // Container(
                  //     width: double.infinity,
                  //     height: 30,
                  //     child: Center(
                  //       child: Text(
                  //         'Conference Standings',
                  //         style: TextStyle(fontSize: 20),
                  //       ),
                  //     )),
                  confSelected
                      ? Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'East',
                                style: TextStyle(fontSize: 18),
                              ),
                              StandingsTable(
                                list: standingsList
                                    .getConferenceStandings('East'),
                                teamCount: 15,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'West',
                                style: TextStyle(fontSize: 18),
                              ),
                              StandingsTable(
                                list: standingsList
                                    .getConferenceStandings('West'),
                                teamCount: 15,
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  divSelected
                      ? Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Atlantic',
                                style: TextStyle(fontSize: 18),
                              ),
                              StandingsTable(
                                list: standingsList
                                    .getDivisionStandings("Atlantic"),
                                teamCount: 5,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Central',
                                style: TextStyle(fontSize: 18),
                              ),
                              StandingsTable(
                                list: standingsList
                                    .getDivisionStandings("Central"),
                                teamCount: 5,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Southeast',
                                style: TextStyle(fontSize: 18),
                              ),
                              StandingsTable(
                                list: standingsList
                                    .getDivisionStandings("Southeast"),
                                teamCount: 5,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Northwest',
                                style: TextStyle(fontSize: 18),
                              ),
                              StandingsTable(
                                list: standingsList
                                    .getDivisionStandings("Northwest"),
                                teamCount: 5,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Pacific',
                                style: TextStyle(fontSize: 18),
                              ),
                              StandingsTable(
                                list: standingsList
                                    .getDivisionStandings("Pacific"),
                                teamCount: 5,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Southwest',
                                style: TextStyle(fontSize: 18),
                              ),
                              StandingsTable(
                                list: standingsList
                                    .getDivisionStandings("Southwest"),
                                teamCount: 5,
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  leagueSelected
                      ? Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'League',
                                style: TextStyle(fontSize: 18),
                              ),
                              StandingsTable(
                                list: standingsList.getLeagueStandings(),
                                teamCount: 30,
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          );
        } else if (snapshot.data == false) {
          return NoConnection();
        } else {
          return NoConnection();
        }
      },
    );
  }
}
