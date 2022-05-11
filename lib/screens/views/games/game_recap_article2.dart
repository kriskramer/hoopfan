import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

// Difference between this one and the original is the scaffold
class GameRecapArticle2 extends StatelessWidget {
  final String gameDate;
  final String gameId;

  GameRecapArticle2({this.gameDate, this.gameId});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FutureBuilder(
          future: loadData(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var article = snapshot.data;

              return Container(
                padding: EdgeInsets.all(15),
                child: Column(children: [
                  Text(
                    article["title"],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    article["pubDateUTC"],
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: article["paragraphs"].length,
                    itemBuilder: (context, index) {
                      // Check if Id is in allTeam and points aint empty
                      return Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(article["paragraphs"][index]["paragraph"]),
                      );
                    },
                  ),
                  Text(
                    article["copyright"],
                    style: TextStyle(fontSize: 10),
                  ),
                ]),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      size: 50,
                    ),
                    Text("An error occured!"),
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
          }),
    );
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
