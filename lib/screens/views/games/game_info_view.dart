import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/games_widgets/arena_card.dart';
import '../../../components/games_widgets/game_officials.dart';
import '../../../components/games_widgets/how_to_watch_card.dart';
import '../../../components/games_widgets/on_court_card.dart';
import '../../../json/jsons.dart';

class GameInfoView extends StatelessWidget {
  final dynamic gameData;
  final String gameId;

  const GameInfoView(this.gameData, this.gameId);

  @override
  Widget build(BuildContext context) {
    var gameStatus = gameData["statusNum"];
    var stats = Provider.of<JsonFiles>(context, listen: false)
        .getCurrentGameStats(gameId);

    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                //padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                child: OnCourtCard(
                  stats: stats,
                  game: gameData,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ArenaCard(
                gameData: gameData,
              ),
              GameOfficials(
                game: gameData,
              ),
              gameStatus < 3 ? HowToWatchCard(game: gameData) : Text(''),
              gameStatus < 3 ? getTicketsCard(context) : Text('')
            ],
          ),
        ));
  }

  Widget getTicketsCard(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text("GET TICKETS", style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
                padding: EdgeInsets.fromLTRB(15, 12, 15, 5),
                child: Text(
                  //widget.game["tickets"]["mobileApp"],
                  'Coming Soon',
                  style: TextStyle(fontSize: 12),
                )),
          ],
        ),
      ),
    );
  }
}
