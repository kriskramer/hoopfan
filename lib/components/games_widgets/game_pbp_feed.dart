import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/screens/views/games_view/game_pbp.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class GamePbpFeed extends StatefulWidget {
  final dynamic gameData;

  GamePbpFeed({this.gameData});

  @override
  _GamePbpFeedState createState() => _GamePbpFeedState();
}

class _GamePbpFeedState extends State<GamePbpFeed> {
  String date;
  String gameId;
  String period;
  dynamic _pbpFeed;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    date = widget.gameData["startDateEastern"];
    gameId = widget.gameData["gameId"];
    period = widget.gameData["period"]["current"].toString();

    getData(date, gameId, period);

    _timer = new Timer.periodic(Duration(seconds: 30), (t) {
      refreshData(date, gameId, period);
    });
  }

  void refreshData(String date, String gameId, String period) {
    setState(() {
      getData(date, gameId, period);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.gameData["statusNum"] == false) {
      _timer.cancel();
    }
    period = widget.gameData["period"]["current"].toString();
    //print(period);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        FutureBuilder(
          future: _pbpFeed,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var plays = snapshot.data["plays"];
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5, //plays.length,
                  itemBuilder: (context, index) {
                    int idx = index + plays.length - 5;
                    if (idx < 0) {
                      idx = 0;
                    }
                    return Container(
                      padding: EdgeInsets.fromLTRB(25, 4, 25, 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(plays[idx]["clock"] + " - "),
                          Flexible(child: Text(plays[idx]["description"]))
                        ],
                      ),
                    );
                  });
            }
            return Text('');
          },
        ),
        FlatButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GamePlayByPlay(
                    gameData: widget.gameData,
                  ),
                ));
          },
          child:
              Text('Full Play by Play', style: TextStyle(color: Colors.blue)),
        )
      ]),
    );
  }

  Future<void> getData(String date, String gameId, String period) async {
    _pbpFeed = Network.getJson(Urls.nbaPlayByPlay(date, gameId, period));
  }
}
