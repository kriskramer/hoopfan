import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/season_model.dart';
import 'package:provider/provider.dart';
import 'package:hoop/components/standings_widgets/table_standings.dart';

class Standings extends StatefulWidget {
  @override
  _StandingsState createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  // This is the first screen to load up so I'm using this as the default 'load everything' method
  Future<bool> loadData() async {
    return true;
  }

  leagueClick() {
    Provider.of<SeasonProv>(context, listen: false).setView(
      league: true,
      conference: false,
      division: false,
    );
  }

  conferenceClick() {
    Provider.of<SeasonProv>(context, listen: false).setView(
      league: false,
      conference: true,
      division: false,
    );
  }

  divisionClick() {
    Provider.of<SeasonProv>(context, listen: false).setView(
      league: false,
      conference: false,
      division: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Standings"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ButtonBar(
                  alignment: MainAxisAlignment.center,
                  layoutBehavior: ButtonBarLayoutBehavior.constrained,
                  children: [
                    ElevatedButton(
                      child: Text(
                        'League',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight:
                              Provider.of<SeasonProv>(context).leagueView
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        primary: Provider.of<SeasonProv>(context).leagueView
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      onPressed: () {
                        leagueClick();
                      },
                    ),
                    ElevatedButton(
                      child: Text(
                        'Conference',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: Provider.of<SeasonProv>(context).confView
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        primary: Provider.of<SeasonProv>(context).confView
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      onPressed: () {
                        conferenceClick();
                      },
                    ),
                    ElevatedButton(
                      child: Text(
                        'Division',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: Provider.of<SeasonProv>(context).divView
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        primary: Provider.of<SeasonProv>(context).divView
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      onPressed: () {
                        divisionClick();
                      },
                    ),
                  ]),
              SizedBox(
                height: 10,
              ),
              Text("Tap the team name to view the team page"),
              SizedBox(
                height: 5,
              ),
              Provider.of<SeasonProv>(context).confView
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
                            list: Provider.of<JsonFiles>(context)
                                .getLeagueStandings()
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
                            list: Provider.of<JsonFiles>(context)
                                .getLeagueStandings()
                                .getConferenceStandings('West'),
                            teamCount: 15,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              Provider.of<SeasonProv>(context).divView
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
                            list: Provider.of<JsonFiles>(context)
                                .getLeagueStandings()
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
                            list: Provider.of<JsonFiles>(context)
                                .getLeagueStandings()
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
                            list: Provider.of<JsonFiles>(context)
                                .getLeagueStandings()
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
                            list: Provider.of<JsonFiles>(context)
                                .getLeagueStandings()
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
                            list: Provider.of<JsonFiles>(context)
                                .getLeagueStandings()
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
                            list: Provider.of<JsonFiles>(context)
                                .getLeagueStandings()
                                .getDivisionStandings("Southwest"),
                            teamCount: 5,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              Provider.of<SeasonProv>(context).leagueView
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
                            list: Provider.of<JsonFiles>(context)
                                .getLeagueStandings()
                                .getLeagueStandings(),
                            teamCount: 30,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
    //     } else if (snapshot.data == false) {
    //       return NoConnection();
    //     } else {
    //       return NoConnection();
    //     }
    //   },
    // );
  }
}
