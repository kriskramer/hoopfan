import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/completed_game_card.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class PreviousGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FutureBuilder(
        future: loadData(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var games = Provider.of<JsonFiles>(context, listen: false)
                .getPreviousGames();

            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: games["games"].length,
                itemBuilder: (context, index) {
                  var game = games["games"][index];
                  return CompletedGameCard(
                    game: game,
                  );
                });
          }
          return Text(' ');
        },
      ),
    );
  }

  Future<bool> loadData(BuildContext context) async {
    if (Provider.of<JsonFiles>(context, listen: false).getPreviousGames() ==
        null) {
      var games1 = await Network.getJson(Urls.nbaGamesDayMinusOne());
      // var games2 = await Network.getJson(Urls.nbaGamesDayMinusTwo());
      // var games3 = await Network.getJson(Urls.nbaGamesDayMinusThree());

      if (games1 != null) {
        Provider.of<JsonFiles>(context, listen: false).setPreviousGames(games1);
        return true;
      }
      return false;
    }
    return false;
  }
}
