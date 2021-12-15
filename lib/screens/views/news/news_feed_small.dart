import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/model/news_item.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class NbaNewsFeedSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool blocked =
        Provider.of<JsonFiles>(context, listen: false).getIsFeatureBlocked();

    blocked = false;

    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: blocked
            ? Container(
                padding: EdgeInsets.all(20),
                child: Text(
                    'This feature is blocked for testing. It will be re-enabled once the app goes live.'),
              )
            : FutureBuilder(
                future: loadData(context),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var json = Provider.of<JsonFiles>(context, listen: false)
                        .getNbaNews();

                    if (json == null) {
                      return Container(
                          padding: EdgeInsets.all(30),
                          child: Center(child: Text("No data returned")));
                    }

                    FNNewsItemList news = FNNewsItemList(json);
                    news.sortByDate();

                    if (news.items.length == 0) {
                      return Container(
                          padding: EdgeInsets.all(30),
                          child: Center(child: Text("No data returned")));
                    }

                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        // Check if Id is in allTeam and points aint empty
                        return Container(
                          padding: EdgeInsets.all(4),
                          child: InkWell(
                            onTap: () {
                              Network.launchSite(news.items[index].link);
                            },
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    news.items[index].headline,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[800]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
                }));
  }

  Future<bool> loadData(BuildContext context) async {
    var n = Provider.of<JsonFiles>(context, listen: false).getNbaNews();

    if (n == null) {
      try {
        var news = await Network.getJson(Urls.getFantasyNerdsNews());
        // var news = await Network.getJson(
        //   Urls.freeNewsApiSearch("nba basketball"),
        //   requestHeaders: RequestHeaders.freeNewsHeaders,
        // );
        Provider.of<JsonFiles>(context, listen: false).setNbaNews(news);
        return true;
      } catch (e) {
        print(e);
      }
    } else {
      return true;
    }

    return false;
  }

  String removeAllHtmlTags(String htmlText) {
    htmlText = htmlText.replaceAll("&nbsp;", " ");
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}
