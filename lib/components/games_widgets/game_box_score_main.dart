import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/game_box_score_advanced.dart';
import 'package:hoop/components/games_widgets/game_box_score_defense.dart';
import 'package:hoop/components/games_widgets/game_box_score_four_factors.dart';
import 'package:hoop/components/games_widgets/game_box_score_summary.dart';

class GameBoxScoreMain extends StatefulWidget {
  final dynamic game;
  final dynamic stats;
  final bool isHomeTeam;

  GameBoxScoreMain({this.game, this.stats, this.isHomeTeam});

  @override
  _GameBoxScoreMainState createState() => _GameBoxScoreMainState();
}

class _GameBoxScoreMainState extends State<GameBoxScoreMain> {
  bool showSummary = true;
  bool showAdvanced = false;
  bool showDefensive = false;
  bool showFourFactors = false;
  String teamId = "";

  void summaryClick() {
    setState(() {
      showSummary = true;
      showAdvanced = false;
      showDefensive = false;
      showFourFactors = false;
    });
  }

  void advancedClick() {
    setState(() {
      showSummary = false;
      showAdvanced = true;
      showDefensive = false;
      showFourFactors = false;
    });
  }

  void defensiveClick() {
    setState(() {
      showSummary = false;
      showAdvanced = false;
      showDefensive = true;
      showFourFactors = false;
    });
  }

  void fourFactorsClick() {
    setState(() {
      showSummary = false;
      showAdvanced = false;
      showDefensive = false;
      showFourFactors = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isHomeTeam) {
      teamId = widget.game["hTeam"]["teamId"];
    } else {
      teamId = widget.game["vTeam"]["teamId"];
    }

    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 5,
        ),
        ButtonBar(
            alignment: MainAxisAlignment.center,
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            children: [
              FlatButton(
                child: Text(
                  'Summary',
                  style: TextStyle(
                      fontWeight:
                          showSummary ? FontWeight.bold : FontWeight.normal),
                ),
                onPressed: () {
                  summaryClick();
                },
              ),
              FlatButton(
                child: Text(
                  'Advanced',
                  style: TextStyle(
                      fontWeight:
                          showAdvanced ? FontWeight.bold : FontWeight.normal),
                ),
                onPressed: () {
                  advancedClick();
                },
              ),
              FlatButton(
                child: Text(
                  'Defense',
                  style: TextStyle(
                      fontWeight:
                          showDefensive ? FontWeight.bold : FontWeight.normal),
                ),
                onPressed: () {
                  defensiveClick();
                },
              ),
              FlatButton(
                child: Text(
                  '4 Factors',
                  style: TextStyle(
                      fontWeight: showFourFactors
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
                onPressed: () {
                  fourFactorsClick();
                },
              ),
            ]),
        showSummary
            ? GameBoxScoreSummary(
                game: widget.game,
                stats: widget.stats,
                isHomeTeam: widget.isHomeTeam)
            : SizedBox(),
        showAdvanced
            ? GameBoxScoreAdvanced(
                gameId: widget.game["gameId"],
                teamId: teamId,
              )
            : SizedBox(),
        showDefensive
            ? GameBoxScoreDefense(
                gameId: widget.game["gameId"],
                teamId: teamId,
              )
            : SizedBox(),
        showFourFactors
            ? GameBoxScoreFourFactors(
                gameId: widget.game["gameId"],
                teamId: teamId,
              )
            : SizedBox(),
      ],
    ));
  }
}
