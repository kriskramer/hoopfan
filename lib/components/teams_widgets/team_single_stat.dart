import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';
import 'package:hoop/screens/views/teams/team_rank_list.dart';
import 'package:hoop/stat_definition.dart';

class TeamSingleStat extends StatefulWidget {
  final label;
  final value;
  final rank;
  final width;
  final teamId;
  final measure;
  final statName;

  const TeamSingleStat(this.label, this.value, this.rank, this.width,
      this.teamId, this.measure, this.statName);

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

    rankMeter = (31 - double.parse(rankCalculation)) / 30;

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
    var noRank = false;

    if (widget.rank.toString().trim() == "") {
      noRank = true;
    }

    return Container(
      height: 35,
      child: Stack(children: [
        Container(
          width: widget.width,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: LinearProgressIndicator(
              color: getProgressBarColor(rankMeter),
              backgroundColor: Color(0xffD6D6D6), //Colors.green,
              minHeight: 22,
              value: progressValue,
              semanticsValue: widget.rank.toString(),
            ),
          ),
        ),
        Container(
          width: widget.width,
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                SizedBox(
                  width: 130,
                ),
                Text(
                  widget.value,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ]),
              noRank
                  ? SizedBox(
                      width: 1,
                    )
                  : InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeamRankList(widget.measure,
                                  widget.label, widget.statName, widget.teamId),
                            ));
                      },
                      child: Text(
                        "Rank: " + widget.rank.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.blue[700]),
                      ),
                    ),
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(width: 30),
            Container(
              padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: StatInfoDialog(
                label: Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 14,
                    //color: Colors.red[900]
                  ),
                ),
                statName: widget.statName,
              ),
            ),
          ],
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
