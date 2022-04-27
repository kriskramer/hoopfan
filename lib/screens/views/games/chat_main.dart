import 'package:flutter/material.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_main.dart';

class ChatMain extends StatefulWidget {
  final String gameId;

  const ChatMain(this.gameId);

  @override
  State<ChatMain> createState() => _ChatMainState();
}

class _ChatMainState extends State<ChatMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Game Recap'),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: GameFeedMain(widget.gameId, null, null)));
  }
}
