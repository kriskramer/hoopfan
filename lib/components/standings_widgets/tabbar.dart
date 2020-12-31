import 'package:flutter/material.dart';
import 'package:hoop/components/standings_widgets/table.dart';
import 'package:hoop/components/standings_widgets/table_div.dart';

class Bar extends StatelessWidget {
  final dynamic confStandings;
  final dynamic divStandings;
  Bar({this.confStandings, this.divStandings});
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        SingleChildScrollView(
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
                ConfTable(
                    json: confStandings["league"]["standard"]["conference"]
                        ["east"]),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Western Conference',
                  style: TextStyle(fontSize: 18),
                ),
                ConfTable(
                    json: confStandings["league"]["standard"]["conference"]
                        ["west"]),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.15), BlendMode.dstATop),
                    image: AssetImage("images/bball1.jpg"),
                    fit: BoxFit.fitHeight)),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Atlantic Division',
                  style: TextStyle(fontSize: 18),
                ),
                DivTable(
                    json: divStandings["league"]["standard"]["conference"]
                        ["east"]["atlantic"]),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Central Division',
                  style: TextStyle(fontSize: 18),
                ),
                DivTable(
                    json: divStandings["league"]["standard"]["conference"]
                        ["east"]["central"]),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Southeast Division',
                  style: TextStyle(fontSize: 18),
                ),
                DivTable(
                    json: divStandings["league"]["standard"]["conference"]
                        ["east"]["southeast"]),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Northwest Division',
                  style: TextStyle(fontSize: 18),
                ),
                DivTable(
                    json: divStandings["league"]["standard"]["conference"]
                        ["west"]["northwest"]),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Pacific Division',
                  style: TextStyle(fontSize: 18),
                ),
                DivTable(
                    json: divStandings["league"]["standard"]["conference"]
                        ["west"]["pacific"]),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Southwest Division',
                  style: TextStyle(fontSize: 18),
                ),
                DivTable(
                    json: divStandings["league"]["standard"]["conference"]
                        ["west"]["southwest"]),
              ],
            ),
          ),
        )
      ],
    );
  }
}
