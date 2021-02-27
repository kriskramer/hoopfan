import 'package:flutter/material.dart';
import 'package:hoop/components/standings_widgets/table.dart';
import 'package:hoop/components/standings_widgets/table_div.dart';
import 'package:hoop/models/league_standings.dart';

class Bar extends StatelessWidget {
  final LeagueStandingList list;
  // final dynamic confStandings;
  // final dynamic divStandings;
  Bar({this.list});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.15), BlendMode.dstATop),
                image: AssetImage("images/bball1.jpg"),
                fit: BoxFit.fitHeight)),
        child: //Container(height: 1800, color: Color.fromRGBO(255, 255, 255, 0.8)),
            Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Eastern Conference',
              style: TextStyle(fontSize: 18),
            ),
            ConfTable(list: list.getConferenceStandings('East')),
            SizedBox(
              height: 30,
            ),
            Text(
              'Western Conference',
              style: TextStyle(fontSize: 18),
            ),
            ConfTable(list: list.getConferenceStandings('West')),
            //       ],
            //     ),
            //   ),
            // ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.vertical,
            //   child: Container(
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //             colorFilter: new ColorFilter.mode(
            //                 Colors.black.withOpacity(0.15), BlendMode.dstATop),
            //             image: AssetImage("images/bball1.jpg"),
            //             fit: BoxFit.fitHeight)),
            //     child: Column(
            //       children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Atlantic Division',
              style: TextStyle(fontSize: 18),
            ),
            DivTable(list: list.getDivisionStandings("Atlantic")),
            SizedBox(
              height: 20,
            ),
            Text(
              'Central Division',
              style: TextStyle(fontSize: 18),
            ),
            DivTable(list: list.getDivisionStandings("Central")),
            SizedBox(
              height: 20,
            ),
            Text(
              'Southeast Division',
              style: TextStyle(fontSize: 18),
            ),
            DivTable(list: list.getDivisionStandings("Southeast")),
            SizedBox(
              height: 20,
            ),
            Text(
              'Northwest Division',
              style: TextStyle(fontSize: 18),
            ),
            DivTable(list: list.getDivisionStandings("Northwest")),
            SizedBox(
              height: 20,
            ),
            Text(
              'Pacific Division',
              style: TextStyle(fontSize: 18),
            ),
            DivTable(list: list.getDivisionStandings("Pacific")),
            SizedBox(
              height: 20,
            ),
            Text(
              'Southwest Division',
              style: TextStyle(fontSize: 18),
            ),
            DivTable(list: list.getDivisionStandings("Southwest")),
          ],
        ),
      ),
    );
  }
}
