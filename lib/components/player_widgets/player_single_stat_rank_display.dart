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
    return Card(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 2, 0, 2),
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
                width: MediaQuery.of(context).size.width - 20,
                //padding: EdgeInsets.symmetric(horizontal: 20),
                child: LinearProgressIndicator(
                  color: Colors.green,
                  minHeight: 10,
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
}
