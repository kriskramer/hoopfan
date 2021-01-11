import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
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
  // This is the first screen to load up so I'm using this as the default 'load everything' method
  Future<bool> loadData() async {
    bool complete = false;
    String year = Provider.of<JsonFiles>(context, listen: false).getYear();
    try {
      var standings = await Network.getJson(Urls.nbaConferenceStandings());
      var divStandings = await Network.getJson(Urls.nbaDivisionStandings());
      var players = await Network.getJson(Urls.nbaAllPlayers());
      var teams = await Network.getJson(Urls.nbaAllTeams());
      var teamStats = await Network.getJson(Urls.nbaTeamStats(year));

      Provider.of<JsonFiles>(context, listen: false)
          .setConfStandings(standings);
      Provider.of<JsonFiles>(context, listen: false)
          .setDivStandings(divStandings);
      Provider.of<JsonFiles>(context, listen: false).setAllPlayers(players);
      Provider.of<JsonFiles>(context, listen: false).setAllTeams(teams);
      Provider.of<JsonFiles>(context, listen: false).setTeamStats(teamStats);
      Provider.of<JsonFiles>(context, listen: false)
          .setSelectedDate(DateTime.now());

      if (Provider.of<JsonFiles>(context, listen: false).getStandings() !=
          null) {
        complete = true; // data gotten
      }
    } catch (e) {
      print(e);
    }
    return complete;
  }

  @override
  Widget build(BuildContext context) {
    // String year =
    //     Provider.of<JsonFiles>(context, listen: false).getYearFormatted();
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
        body: (Provider.of<JsonFiles>(context, listen: false).getStandings() ==
                null)
            ? FutureBuilder(
                future: loadData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  Widget table;
                  if (snapshot.data == true) {
                    table = Bar(
                      confStandings:
                          Provider.of<JsonFiles>(context).getStandings(),
                      divStandings:
                          Provider.of<JsonFiles>(context).getDivStandings(),
                    );
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
                confStandings: Provider.of<JsonFiles>(context).getStandings(),
                divStandings: Provider.of<JsonFiles>(context).getDivStandings(),
              ),
      ),
    );
  }

  // Widget getSeasonSelectDialog() {
  //   var seasons = Provider.of<JsonFiles>(context, listen: false).getSeasons();
  //   var seasonList = seasons["api"]["seasons"];

  //   return Dialog(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  //     elevation: 12,
  //     child: Container(
  //       padding: EdgeInsets.all(15),
  //       height: MediaQuery.of(context).size.height - 250,
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: <Widget>[
  //           SizedBox(
  //             height: 10,
  //           ),
  //           Text(
  //             'Select Season:',
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //           Divider(
  //             thickness: 1,
  //             color: Colors.red,
  //           ),
  //           ListView.builder(
  //               shrinkWrap: true,
  //               itemCount: seasonList.length,
  //               itemBuilder: (context, index) {
  //                 return Center(
  //                   child: ListTile(
  //                     onTap: () {
  //                       setState(() {
  //                         Provider.of<JsonFiles>(context, listen: false)
  //                             .setYear(seasonList[index]);
  //                       });
  //                       loadData();
  //                       Navigator.pop(context);
  //                     },
  //                     title: Text(seasonList[index],
  //                         style: TextStyle(
  //                             fontSize: 20, fontWeight: FontWeight.bold)),
  //                   ),
  //                 );
  //               })
  //         ],
  //       ),
  //     ),
  //   );
  // }

}
