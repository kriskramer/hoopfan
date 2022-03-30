import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';

class TweetAuthorDisplay extends StatelessWidget {
  final String authorId;
  const TweetAuthorDisplay(this.authorId);

  @override
  Widget build(BuildContext context) {
    TweetAuthor author;

    return FutureBuilder(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var t = snapshot.data;

          if (t != null) {
            author = TweetAuthor(t);
            print('Author: ' + author.id);

            return Container(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(author.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(" (@" + author.username + ") ",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 5),
                  Text(
                      "Followers: " +
                          author.followerCount.toString() +
                          "  Tweets: " +
                          author.tweetCount.toString(),
                      style: TextStyle(fontSize: 12)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(author.location, style: TextStyle(fontSize: 12)),
                ],
              ),
            );
          } else {
            return NoConnection();
          }
        } else {
          return NoConnection();
        }
      },
    );
  }

  Future<dynamic> loadData() async {
    // Load the tweet into a model object first...
    var feed = await Network.getJson(
        "https://api.twitter.com/2/users/$authorId?user.fields=description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified",
        requestHeaders: RequestHeaders.twitterStreamHeaders);

    // Then get the user based on user id and load that into the tweet object...
    return feed;
  }
}

class TweetAuthor {
  var id;
  var location;
  var username;
  var name;
  var profileImage;
  var verified;
  var followerCount;
  var tweetCount;
  var followingCount;

  TweetAuthor(dynamic json) {
    id = json["data"]["id"];
    name = json["data"]["name"];
    username = json["data"]["username"];

    if (json["data"]["location"] != null) {
      location = json["data"]["location"];
    } else
      location = "";

    if (json["data"]["profile_image_url"] != null) {
      profileImage = json["data"]["profile_image_url"];
    } else
      profileImage = "";

    if (json["data"]["public_metrics"] != null) {
      if (json["data"]["public_metrics"]["followers_count"] != null) {
        followerCount =
            json["data"]["public_metrics"]["followers_count"].toString();
      } else {
        followerCount = 0;
      }
      if (json["data"]["public_metrics"]["tweet_count"] != null) {
        tweetCount = json["data"]["public_metrics"]["tweet_count"].toString();
      } else {
        tweetCount = 0;
      }
      if (json["data"]["public_metrics"]["following_count"] != null) {
        followingCount =
            json["data"]["public_metrics"]["following_count"].toString();
      } else {
        followingCount = 0;
      }
      profileImage = json["data"]["profile_image_url"];
    } else {
      followerCount = 0;
      followingCount = 0;
      tweetCount = 0;
    }
  }
}
