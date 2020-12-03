import 'package:flutter/material.dart';

import 'package:hoop/components/cacheimg.dart';

class PlayerDetail extends StatelessWidget {
  final dynamic json;

  PlayerDetail({@required this.json});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                CachedLogo(
                  url:
                      "https://cdn.nba.com/headshots/nba/latest/1040x760/${json["personId"]}.png",
                  radius: 100,
                ),
                Column(
                  children: [
                    Text(
                      json["firstName"],
                      style: TextStyle(fontSize: 32),
                    ),
                    Text(
                      json["lastName"],
                      style: TextStyle(fontSize: 32),
                    ),
                    Row(
                      children: [
                        Text(
                          "#" + json["jersey"],
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          json["pos"],
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Divider(
              thickness: 3,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Column(
                    children: [
                      Text('Height'),
                      Text(json["heightFeet"] +
                          "\' " +
                          json["heightInches"] +
                          "\" (" +
                          json["heightMeters"] +
                          ")"),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Weight'),
                      Text(json["weightPounds"] +
                          " (" +
                          json["weightKilograms"] +
                          ")"),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Country'),
                      Text(json["country"]),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('College'),
                      Text(json["lastAffiliation"]),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Column(
                    children: [
                      Text('Age'),
                      Text(getAge(json["dateOfBirthUTC"])),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Birthday'),
                      Text(json["dateOfBirthUTC"]),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Drafted'),
                      Row(
                        children: [
                          Text("Pick " + json["draft"]["pickNum"]),
                          Text(" R" + json["draft"]["roundNum"]),
                          Text(" " + json["draft"]["seasonYear"]),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('Years Pro'),
                      Text(json["yearsPro"]),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 3,
            ),
            // Use a FutureBuilder to get the player data and then build out a data table or some other widget
          ],
        ),
      ),
    );
  }

  String getAge(String utcDob) {
    var dob = DateTime.parse(utcDob);
    var now = DateTime.now();
    var age = now.difference(dob);
    var years = age.inDays / 365;
    return years.floor().toString();
  }
}
