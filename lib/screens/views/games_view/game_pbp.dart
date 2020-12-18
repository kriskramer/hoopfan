import 'package:flutter/material.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class GamePlayByPlay extends StatelessWidget {
  final dynamic gameData;

  GamePlayByPlay({this.gameData});

  @override
  Widget build(BuildContext context) {
    String date = gameData["startDateEastern"];
    String gameId = gameData["gameId"];

    //var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Play by Play'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          FutureBuilder(
            future: Network.getJson(Urls.nbaPlayByPlay(date, gameId, "1")),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var plays = snapshot.data["plays"];
                return ExpansionTile(
                  title: Text('1st quarter'),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: plays.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(plays[index]["clock"] + " - "),
                                Flexible(
                                    child: Text(plays[index]["description"]))
                              ],
                            ),
                          );
                        }),
                  ],
                );
              }
              return Text('');
            },
          ),
          FutureBuilder(
            future: Network.getJson(Urls.nbaPlayByPlay(date, gameId, "2")),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var plays = snapshot.data["plays"];
                return ExpansionTile(
                  title: Text('2nd quarter'),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: plays.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(plays[index]["clock"] + " - "),
                                Flexible(
                                    child: Text(plays[index]["description"]))
                              ],
                            ),
                          );
                        }),
                  ],
                );
              }
              return Text('');
            },
          ),
          FutureBuilder(
            future: Network.getJson(Urls.nbaPlayByPlay(date, gameId, "3")),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var plays = snapshot.data["plays"];
                return ExpansionTile(
                  title: Text('3rd quarter'),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: plays.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(plays[index]["clock"] + " - "),
                                Flexible(
                                    child: Text(plays[index]["description"]))
                              ],
                            ),
                          );
                        }),
                  ],
                );
              }
              return Text('');
            },
          ),
          FutureBuilder(
            future: Network.getJson(Urls.nbaPlayByPlay(date, gameId, "4")),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var plays = snapshot.data["plays"];
                return ExpansionTile(
                  title: Text('4th quarter'),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: plays.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(plays[index]["clock"] + " - "),
                                Flexible(
                                    child: Text(plays[index]["description"]))
                              ],
                            ),
                          );
                        }),
                  ],
                );
              }
              return Text('');
            },
          ),
        ]),
      ),
    );
  }

  //Future<bool> loadData(BuildContext context) async {}
}
