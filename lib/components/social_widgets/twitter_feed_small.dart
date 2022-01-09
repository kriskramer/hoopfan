import 'package:flutter/material.dart';
import 'package:hoop/components/social_widgets/tweet_display_with_popup.dart';
import 'package:hoop/models/twitter_news.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';

class TwitterFeedSmall extends StatelessWidget {
  final searchTerms;

  TwitterFeedSmall({this.searchTerms});

  @override
  Widget build(BuildContext context) {
    TwitterNewsItemList list;

    return FutureBuilder(
        future: loadData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            dynamic json = snapshot.data;

            if (json != null) {
              list = TwitterNewsItemList(json);
            }

            if (list.items.length > 0) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) {
                  // Check if Id is in allTeam and points aint empty
                  return Column(children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      child: InkWell(
                        onTap: () {
                          //Network.launchSite(news.items[index].link);
                        },
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: TweetDisplayWithPopup(
                              tweet: list.items[index],
                              shortDisplayText: true,
                            )),
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
        });
  }

  Future<dynamic> loadData() async {
    var feed = await Network.getJson(
        "https://api.twitter.com/2/tweets/search/recent?query=$searchTerms&max_results=10&tweet.fields=attachments,created_at,entities",
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
