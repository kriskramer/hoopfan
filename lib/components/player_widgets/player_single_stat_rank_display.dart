import 'package:flutter/material.dart';

class PlayerSingleStatRankDisplay extends StatelessWidget {
  final String stat;
  final String statName;
  final int rank;
  final int total;
  const PlayerSingleStatRankDisplay(
      this.stat, this.statName, this.rank, this.total);

  @override
  Widget build(BuildContext context) {
    var rankMeter = (total - rank) / total;
    return Container(
      padding: EdgeInsets.fromLTRB(12, 3, 12, 3),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      statName,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 30),
                    Text(
                      stat,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Text(
                  "Rank: " + rank.toString(),
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: LinearProgressIndicator(
                  color: getProgressBarColor(rankMeter),
                  backgroundColor: Colors.grey[50], //Colors.green,
                  minHeight: 8,
                  value: rankMeter,
                  semanticsValue: rankMeter.toString(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Color getProgressBarColor(double value) {
    if (value < .15) {
      return Colors.red;
    } else if (value < .3) {
      return Colors.deepOrange;
    } else if (value < .45) {
      return Colors.orange;
    } else if (value < .6) {
      return Colors.amber;
    } else if (value < .75) {
      return Colors.yellow;
    } else if (value < .9) {
      return Colors.green;
    }

    return Colors.lightBlue;
  }
}
