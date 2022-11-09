import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/headers/upcoming_game_card.dart';
import 'package:hoop/constant_schedule.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class UpcomingGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FutureBuilder(
        future: loadData(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var games = Provider.of<JsonFiles>(context, listen: false)
                .getUpcomingGames();

            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: games.length,
                itemBuilder: (context, index) {
                  var game = games[index];
                  return UpcomingGameCard(
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
    if (Provider.of<JsonFiles>(context, listen: false).getUpcomingGames() ==
        null) {
      var games = ScheduleHelper.getUpcomingSchedule();

      if (games != null) {
        Provider.of<JsonFiles>(context, listen: false).setUpcomingGames(games);
        return true;
      }
      return false;
    }
    return false;
  }
}
