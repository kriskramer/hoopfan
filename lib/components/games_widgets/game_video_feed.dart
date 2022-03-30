import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/pbp_period_view.dart';

class GameVideoFeed extends StatelessWidget {
  final String gameId;

  const GameVideoFeed(this.gameId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Feed"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            PbpPeriodView(gameId: gameId, period: "1"),
            SizedBox(
              height: 20,
            ),
            PbpPeriodView(gameId: gameId, period: "2"),
            SizedBox(
              height: 20,
            ),
            PbpPeriodView(gameId: gameId, period: "3"),
            SizedBox(
              height: 20,
            ),
            PbpPeriodView(gameId: gameId, period: "4"),
            SizedBox(
              height: 20,
            ),
            PbpPeriodView(gameId: gameId, period: "5"),
            SizedBox(
              height: 20,
            ),
            PbpPeriodView(gameId: gameId, period: "6"),
          ],
        ),
      ),
    );
  }

  Widget getHeader(String text) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Center(
            child: Text(text,
                style: TextStyle(fontSize: 20, color: Colors.white))));
  }
}
