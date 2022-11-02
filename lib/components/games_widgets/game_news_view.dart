import 'package:flutter/material.dart';
import 'package:hoop/components/social_widgets/twitter_feed.dart';
import 'package:hoop/components/social_widgets/twitter_feed_small.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/games/game_news2.dart';
import 'package:hoop/screens/views/games/game_preview_article.dart';
import 'package:hoop/screens/views/games/game_preview_article_2.dart';
import 'package:hoop/screens/views/games/game_recap_article.dart';
import 'package:hoop/screens/views/games/game_recap_article2.dart';

class GameNewsView extends StatelessWidget {
  final dynamic gameData;
  final String gameId;

  const GameNewsView(this.gameData, this.gameId);

  @override
  Widget build(BuildContext context) {
    var date = gameData["gameUrlCode"].toString().split("/")[0];
    var gameStatus = gameData["statusNum"];
    var twitterSearchString = getTwitterSearchString(gameData);

    return Scaffold(
        appBar: AppBar(
          title: Text("Game News & Social"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: DefaultTabController(
            length: 4, // length of tabs
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text: 'News'),
                      Tab(text: 'Social'),
                      Tab(text: 'Preview'),
                      Tab(text: 'Recap'),
                    ],
                  ),
                ),
                Container(
                  height: 1000, //height of TabBarView
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: TabBarView(
                    children: <Widget>[
                      GameNews2(searchString: twitterSearchString),
                      Container(
                          child: TwitterFeedSmall(
                              searchTerms: twitterSearchString, itemCount: 10)),
                      Container(
                        child: GamePreviewArticle2(
                          gameDate: date,
                          gameId: gameId,
                        ),
                      ),
                      Container(
                        child: GameRecapArticle2(
                          gameDate: date,
                          gameId: gameId,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  String getTwitterSearchString(dynamic gameData) {
    var vTeamName =
        ConstantHelper.getTeamName(gameData["awayTeam"]["teamId"].toString());
    var hTeamName =
        ConstantHelper.getTeamName(gameData["homeTeam"]["teamId"].toString());

    var search = vTeamName + " " + hTeamName + " nba game";

    return search;
  }
}
