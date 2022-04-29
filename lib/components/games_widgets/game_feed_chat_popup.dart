import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_prov.dart';

class GameFeedChatPopup extends StatefulWidget {
  final String gameId;

  const GameFeedChatPopup({this.gameId});

  @override
  State<GameFeedChatPopup> createState() => _GameFeedChatPopupState();
}

class _GameFeedChatPopupState extends State<GameFeedChatPopup> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        child: Column(children: [
          TextField(
            controller: _textController,
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Say something!',
            ),
            onSubmitted: (text) => {doChat(text)},
          ),
          TextButton(
              onPressed: () {
                doChat(_textController.text);
              },
              child: Text("Submit"))
        ]));
  }

  void doChat(String text) {
    var name = Provider.of<UserProv>(context, listen: false).displayName;
    String key = DateTime.now().millisecondsSinceEpoch.toString();
    DatabaseReference feed =
        FirebaseDatabase.instance.ref('gameFeed/${widget.gameId}/$key');
    //print(DateTime.now().millisecondsSinceEpoch.toString());
    feed.set({"type": "2", "chat": text, "displayName": name});

    print(text);

    _textController.clear();
    Navigator.of(context, rootNavigator: true).pop();
  }
}
