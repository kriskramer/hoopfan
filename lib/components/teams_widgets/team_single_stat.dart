import 'dart:async';

import 'package:flutter/material.dart';

class TeamSingleStat extends StatefulWidget {
  final label;
  final value;
  final rank;
  final width;

  const TeamSingleStat(this.label, this.value, this.rank, this.width);

  @override
  _TeamSingleStatState createState() => _TeamSingleStatState();
}

class _TeamSingleStatState extends State<TeamSingleStat> {
  var progressValue = 0.0;
  Timer _timer;
  var rankMeter;
  var rankCalculation;

  @override
  void initState() {
    rankCalculation = (widget.rank.trim() == "") ? "30" : widget.rank;
    rankMeter = (30 - double.parse(rankCalculation)) / 30;

    const oneSec = const Duration(milliseconds: 50);
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
    return Container(
      height: 25,
      child: Stack(children: [
        Container(
          width: widget.width,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: LinearProgressIndicator(
            color: getProgressBarColor(rankMeter),
            backgroundColor: Colors.grey[50], //Colors.green,
            minHeight: 22,
            value: progressValue,
            semanticsValue: widget.rank.toString(),
          ),
        ),
        Container(
          width: widget.width,
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  width: 100,
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: 14,
                      //color: Colors.red[900]
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.value,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ]),
              Text("(" + widget.rank + ")"),
            ],
          ),
        )
      ]),
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
