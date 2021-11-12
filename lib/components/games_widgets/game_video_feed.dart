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
            getHeader("1st Period"),
            SizedBox(
              height: 5,
            ),
            PbpPeriodView(gameId: gameId, period: "1"),
            SizedBox(
              height: 20,
            ),
            getHeader("2nd Period"),
            SizedBox(
              height: 5,
            ),
            PbpPeriodView(gameId: gameId, period: "2"),
            SizedBox(
              height: 20,
            ),
            getHeader("3rd Period"),
            SizedBox(
              height: 5,
            ),
            PbpPeriodView(gameId: gameId, period: "3"),
            SizedBox(
              height: 20,
            ),
            getHeader("4th Period"),
            SizedBox(
              height: 5,
            ),
            PbpPeriodView(gameId: gameId, period: "4"),
            SizedBox(
              height: 20,
            ),
            getHeader("OT 1"),
            SizedBox(
              height: 5,
            ),
            PbpPeriodView(gameId: gameId, period: "5"),
            getHeader("OT 2"),
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
