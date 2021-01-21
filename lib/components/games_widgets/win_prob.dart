import 'package:flutter/material.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class WinProbability extends StatelessWidget {
  final String gameId;

  WinProbability({this.gameId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic wp = snapshot.data["resultSets"][0];
          var vp = 0.0;
          var hp = 0.0;

          if (wp["rowSet"].length > 0) {
            int maxIndex = wp["rowSet"].length - 1;
            hp = wp["rowSet"][maxIndex][2];
            vp = wp["rowSet"][maxIndex][3];
          }

          vp *= 100;
          hp *= 100;

          return Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(width: 1, color: Colors.grey[400]))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    vp.toStringAsFixed(2) + "%",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Win Probability',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    hp.toStringAsFixed(2) + "%",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ));
        } else
          return SizedBox();
      },
    );
  }

  Future<void> loadData() async {
    return await Network.getJsonFromNbaStats(
        Urls.getNbaStatsWinProbability(gameId));
  }
}
