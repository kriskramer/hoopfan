import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/social_widgets/tweet_author.dart';
import 'package:hoop/components/social_widgets/tweet_display_embed.dart';
import 'package:hoop/models/twitter_news.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';

class TweetDisplayWithPopup extends StatelessWidget {
  final TwitterNewsItem tweet;
  final bool shortDisplayText;

  const TweetDisplayWithPopup({this.tweet, this.shortDisplayText});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return getTweetDialog(context);
                  });
            },
            child: Text(
              shortDisplayText ? tweet.getShortText() : tweet.text,
              style: TextStyle(fontSize: 14, color: Colors.blue[800]),
            )));
  }

  Widget getTweetDialog(BuildContext context) {
    print("Tweet: " + tweet.id.toString());
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        content: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var t = snapshot.data;

              var rt;

              if (t["data"]["referenced_tweets"] != null) {
                if (t["data"]["referenced_tweets"][0]["type"] == "retweeted") {
                  rt = t["data"]["referenced_tweets"][0];
                }
              }

              if (rt == null) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TweetAuthorDisplay(t["data"]["author_id"]),
                        SizedBox(height: 10),
                        Text(t["data"]["text"], style: TextStyle(fontSize: 20)),
                        (rt != null)
                            ? TweetDisplayEmbed(
                                id: rt["id"],
                              )
                            : SizedBox(),
                        SizedBox(height: 20),
                        Text(t["data"]["created_at"],
                            style: TextStyle(fontSize: 12)),
                        SizedBox(height: 10),
                        Text(t["data"]["source"],
                            style: TextStyle(fontSize: 12)),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Network.launchSite('https://twitter.com/' +
                                t["data"]["author_id"] +
                                '/status/' +
                                tweet.id.toString());
                          },
                          child: Text(
                            'View in Twitter',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[800]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                // This is a retweet
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TweetAuthorDisplay(t["data"]["author_id"]),
                        SizedBox(height: 5),
                        Text("Retweeted:", style: TextStyle(fontSize: 20)),
                        TweetDisplayEmbed(
                          id: rt["id"],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Network.launchSite('https://twitter.com/' +
                                t["data"]["author_id"] +
                                '/status/' +
                                tweet.id.toString());
                          },
                          child: Text(
                            'View in Twitter',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[800]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            } else {
              return NoConnection();
            }
          },
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ]);
  }

  Future<dynamic> loadData() async {
    // Load the tweet into a model object first...
    var feed = await Network.getJson(
        "https://api.twitter.com/2/tweets/${tweet.id}?tweet.fields=attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,referenced_tweets,source,text&user.fields=created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username",
        requestHeaders: RequestHeaders.twitterStreamHeaders);

    // Then get the user based on user id and load that into the tweet object...
    return feed;
  }
}
