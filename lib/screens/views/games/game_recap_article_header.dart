import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class GameRecapArticleHeader extends StatelessWidget {
  final String gameDate;
  final String gameId;

  GameRecapArticleHeader({this.gameDate, this.gameId});

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
            .getRecapArticle(gameId) ==
        null) {
      try {
        var article =
            await Network.getJson(Urls.nbaGameRecapArticle(gameDate, gameId));
        Provider.of<JsonFiles>(context, listen: false)
            .setRecapArticles(gameId, article);
        return article;
      } catch (e) {
        print(e);
      }
    } else {
      return Provider.of<JsonFiles>(context, listen: false)
          .getRecapArticle(gameId);
    }
    return null;
  }

  String removeAllHtmlTags(String htmlText) {
    htmlText = htmlText.replaceAll("&nbsp;", " ");
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}
