import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class GamePreviewArticleHeader extends StatelessWidget {
  final String gameDate;
  final String gameId;

  GamePreviewArticleHeader({this.gameDate, this.gameId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var article = snapshot.data;

            return Container(
              padding: EdgeInsets.all(4),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      article["title"],
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Divider(
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            );
          } else if (snapshot.data == null) {
            return NoConnection();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<dynamic> loadData(BuildContext context) async {
    if (Provider.of<JsonFiles>(context, listen: false)
            .getPreviewArticle(gameId) ==
        null) {
      try {
        var article =
            await Network.getJson(Urls.nbaGamePreviewArticle(gameDate, gameId));
        Provider.of<JsonFiles>(context, listen: false)
            .setPreviewArticles(gameId, article);
        return article;
      } catch (e) {
        print(e);
      }
    } else {
      return Provider.of<JsonFiles>(context, listen: false)
          .getPreviewArticle(gameId);
    }
    return null;
  }
}
