import 'package:flutter/material.dart';
import 'package:hoop/components/player_widgets/player_rank_list.dart';

class PlayerSingleStatRankDisplay extends StatelessWidget {
  final String stat;
  final String statName;
  final int rank;
  final int total;
  final String measure;
  final String playerId;
  const PlayerSingleStatRankDisplay(this.stat, this.statName, this.rank,
      this.total, this.measure, this.playerId);

  @override
  Widget build(BuildContext context) {
    var rankMeter = (total - rank) / total;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 35,
            child: LinearProgressIndicator(
              color: getProgressBarColor(rankMeter),
              backgroundColor: Colors.grey[50],
              minHeight: 32,
              value: rankMeter,
              semanticsValue: rankMeter.toString(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
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
                SizedBox(
                  height: 35,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlayerRankList(measure, statName, playerId),
                          ));
                    },
                    child: Text(
                      "Rank: " + rank.toString(),
                      style: TextStyle(fontSize: 16, color: Colors.blue[700]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color getProgressBarColor(double value) {
    if (value < .15) {
      return Colors.purple.withAlpha(125);
    } else if (value < .3) {
      return Colors.red.withAlpha(125);
    } else if (value < .45) {
      return Colors.deepOrange.withAlpha(125);
    } else if (value < .6) {
      return Colors.orange.withAlpha(125);
    } else if (value < .75) {
      return Colors.amber.withAlpha(125);
    } else if (value < .9) {
      return Colors.green.withAlpha(125);
    }

    return Colors.lightBlue.withAlpha(125);
  }
}
