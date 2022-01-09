import 'package:flutter/material.dart';
import 'package:hoop/components/social_widgets/tweet_display_with_popup.dart';
import 'package:hoop/models/twitter_news.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';

class TwitterFeed extends StatelessWidget {
  final searchTerms;

  TwitterFeed({this.searchTerms});

  @override
  Widget build(BuildContext context) {
    bool blocked = true;
    TwitterNewsItemList list;

    return Scaffold(
      appBar: AppBar(
        title: Text("Social Feeds"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: blocked
            ? Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child:
                      Text("This feature is temporarily blocked for testing."),
                ),
              )
            : FutureBuilder(
                future: loadData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    dynamic json = snapshot.data;

                    if (json != null) {
                      list = TwitterNewsItemList(json);
                    } else {
                      return Center(
                        child: Text("No data..."),
                      );
                    }

                    if (list.items.length > 0) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 25,
                        itemBuilder: (context, index) {
                          // Check if Id is in allTeam and points aint empty
                          return Column(children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              child: InkWell(
                                onTap: () {
                                  //Network.launchSite(news.items[index].link);
                                },
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TweetDisplayWithPopup(
                                        tweet: list.items[index],
                                        shortDisplayText: false)),
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                          ]);
                        },
                      );
                    } else {
                      return Container();
                    }
                  } else {
                    return Container();
                  }
                }),
      ),
    );
  }

  Future<dynamic> loadData() async {
    var feed = await Network.getJson(
        "https://api.twitter.com/2/tweets/search/recent?query=$searchTerms&max_results=25&tweet.fields=attachments,created_at,entities&user.fields=id,name,username",
        requestHeaders: RequestHeaders.twitterStreamHeaders);
    return feed;
  }

  String getFormattedText(String text) {
    if (text.toString().length > 119) {
      return text.toString().substring(0, 120) + "...";
    } else {
      return text;
    }
  }
}
