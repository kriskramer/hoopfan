import 'package:flutter/material.dart';
import 'package:hoop/models/twitter_news.dart';

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
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        content: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              Text(tweet.text, style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Text(tweet.created, style: TextStyle(fontSize: 12)),
              SizedBox(height: 10),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ]);
  }
}
