import 'package:flutter/material.dart';
import 'package:hoop/components/standings_widgets/table_standings_small.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';
import 'package:hoop/components/standings_widgets/table_standings.dart';

class StandingsSmall extends StatefulWidget {
  @override
  _StandingsSmallState createState() => _StandingsSmallState();
}

class _StandingsSmallState extends State<StandingsSmall> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'East',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    StandingsTableSmall(
                      list: Provider.of<JsonFiles>(context)
                          .getLeagueStandings()
                          .getConferenceStandings('East'),
                      teamCount: 6,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'West',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    StandingsTableSmall(
                      list: Provider.of<JsonFiles>(context)
                          .getLeagueStandings()
                          .getConferenceStandings('West'),
                      teamCount: 6,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
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
