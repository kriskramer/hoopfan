import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/screens/views/players/player_rank_list.dart';

class PlayerSingleStatRankDisplay extends StatefulWidget {
  final String stat;
  final String statName;
  final int rank;
  final int total;
  final String measure;
  final String playerId;
  const PlayerSingleStatRankDisplay(this.stat, this.statName, this.rank,
      this.total, this.measure, this.playerId);

  @override
  State<PlayerSingleStatRankDisplay> createState() =>
      _PlayerSingleStatRankDisplayState();
}

class _PlayerSingleStatRankDisplayState
    extends State<PlayerSingleStatRankDisplay> {
  var progressValue = 0.0;
  Timer _timer;
  var rankMeter;

  @override
  void initState() {
    const oneSec = const Duration(milliseconds: 50);
    rankMeter = (widget.total - widget.rank) / widget.total;
    _timer = Timer.periodic(oneSec, (Timer t) {
      setState(() {
        progressValue += 0.05;
        if (progressValue >= rankMeter) {
          progressValue = rankMeter;
          t.cancel();
          return;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var rankMeter = (widget.total - widget.rank) / widget.total;
    //print(rankMeter);
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
              value: progressValue,
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
                      widget.statName,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 20),
                    Text(
                      widget.stat,
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
                            builder: (context) => PlayerRankList(widget.measure,
                                widget.statName, widget.playerId),
                          ));
                    },
                    child: Text(
                      "Rank: " + widget.rank.toString(),
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
