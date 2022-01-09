import 'package:flutter/material.dart';
import 'package:hoop/config.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';
import 'package:xml/xml.dart';

class InjuryReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FutureBuilder(
          future: loadData(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var n = Provider.of<JsonFiles>(context, listen: false)
                  .getInjuryReport();
              InjuryReportList list = InjuryReportList(n);
              List<Widget> rows = [];

              // var xml = XmlDocument.parse(snapshot.data);

              // var teams = xml.lastChild.findAllElements('Team');

              // for (var x in teams) {
              //   for (var p in x.children) {
              //     list.add(InjuryReportItem(
              //         name: p.getElement('name').innerText,
              //         injury: p.getElement('injury').innerText,
              //         notes: p.getElement('notes').innerText,
              //         updated: p.getElement('updated').innerText,
              //         team: x.getAttribute('code').toString()));
              //   }
              // }

              // print(list.length);
              var team = '';

              for (var l in list.items) {
                if (l.team != team) {
                  rows.add(SizedBox(
                    height: 20,
                  ));
                  rows.add(Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.black, width: 2))),
                    child: Center(
                      child: Text(l.team, style: TextStyle(fontSize: 24)),
                    ),
                  ));
                  team = l.team;
                }
                rows.add(Row(
                  children: [
                    // Text(
                    //   l.team,
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Text(
                      l.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ));
                rows.add(Row(
                  children: [
                    Flexible(child: Text(l.injury + ' - ' + l.status)),
                  ],
                ));
                rows.add(SizedBox(
                  height: 5,
                ));
              }

              return Container(
                padding: EdgeInsets.all(20),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Injury Report',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ...rows
                    ],
                  ),
                ),
              );
            } else
              return Container(
                  padding: EdgeInsets.all(25),
                  child: Text(
                    'No Current Injury Data',
                    style: TextStyle(fontSize: 16),
                  ));
          }),
    );
  }

  Future<bool> loadData(BuildContext context) async {
    var n = Provider.of<JsonFiles>(context, listen: false).getInjuryReport();

    if (n == null) {
      try {
        var report = await Network.getJson(Urls.getFantasyNerdsInjuries());

        Provider.of<JsonFiles>(context, listen: false).setInjuryReport(report);
        return true;
      } catch (e) {
        print(e);
      }
    } else {
      return true;
    }

    return false;
  }
}

class InjuryReportItem {
  final String name;
  final String injury;
  final String position;
  final String status;
  final String updated;
  final String team;

  InjuryReportItem(
      {this.name,
      this.injury,
      this.status,
      this.updated,
      this.position,
      this.team});
}

class InjuryReportList {
  List<InjuryReportItem> items = [];

  InjuryReportList(dynamic json) {
    Map<String, dynamic> data = new Map<String, dynamic>.from(json["teams"]);
    for (var team in data.entries) {
      // print(team);
      // print(team.key);
      // print(team.value);
      var teamName = team.key;
      for (var i in team.value) {
        items.add(InjuryReportItem(
            injury: i["injury"],
            name: i["name"],
            position: i["position"],
            status: i["game_status"],
            team: teamName,
            updated: i["last_update"]));
      }
    }
  }
}
