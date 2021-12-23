import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/social_widgets/tweet_author.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';

class TweetDisplayEmbed extends StatelessWidget {
  final String id;

  const TweetDisplayEmbed({this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var t = snapshot.data;

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TweetAuthorDisplay(t["data"]["author_id"]),
                  SizedBox(height: 10),
                  Text(t["data"]["text"], style: TextStyle(fontSize: 20)),
                  SizedBox(height: 20),
                  Text(t["data"]["created_at"], style: TextStyle(fontSize: 12)),
                  SizedBox(height: 10),
                  Text(t["data"]["source"], style: TextStyle(fontSize: 12)),
                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        } else {
          return NoConnection();
        }
      },
    );
  }

  Future<dynamic> loadData() async {
    // Load the tweet into a model object first...
    var feed = await Network.getJson(
        "https://api.twitter.com/2/tweets/${id}?tweet.fields=attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,referenced_tweets,source,text&user.fields=created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username",
        requestHeaders: RequestHeaders.twitterStreamHeaders);

    // Then get the user based on user id and load that into the tweet object...
    return feed;
  }
}
