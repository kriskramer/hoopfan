import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/team_tricode_card.dart';
import 'package:provider/provider.dart';

import '../../providers/user_prov.dart';

class GameFeedChatPopup extends StatefulWidget {
  final String gameId;
  final int vTeamId;
  final int hTeamId;

  const GameFeedChatPopup({this.gameId, this.vTeamId, this.hTeamId});

  @override
  State<GameFeedChatPopup> createState() => _GameFeedChatPopupState();
}

class _GameFeedChatPopupState extends State<GameFeedChatPopup> {
  TextEditingController _textController = TextEditingController();
  double _fanValue = 30.0;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProv>(context, listen: false).getUser();
    _fanValue = Provider.of<UserProv>(context, listen: false).getFanValue();

    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        child: user.displayName == null
            ? Container(
                padding: EdgeInsets.all(20),
                child: Text(
                    'You are not logged in. Return to the dashboard and tap the user icon at the top to log in and participate in the conversation.'))
            : Column(mainAxisSize: MainAxisSize.min, children: [
                TextField(
                  controller: _textController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Say something!',
                  ),
                  onSubmitted: (text) => {doChat(text)},
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
                  child: Text(
                    "State your allegiance:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
                  child: Text(getfanLevel(_fanValue)),
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            child: TeamIconFromTeamId(
                              teamId: widget.vTeamId,
                            ),
                            onTap: () {
                              setState(() {
                                _fanValue -= 10;
                                if (_fanValue < 0) {
                                  _fanValue = 0;
                                }
                                Provider.of<UserProv>(context, listen: false)
                                    .setFanValue(_fanValue);
                              });
                            }),
                        Slider(
                          min: 0.0,
                          max: 60.0,
                          value: _fanValue,
                          divisions: 6,
                          //label: '${getfanLevel(_fanValue)}',
                          onChanged: (value) {
                            setState(() {
                              _fanValue = value;
                              Provider.of<UserProv>(context, listen: false)
                                  .setFanValue(_fanValue);
                            });
                          },
                        ),
                        GestureDetector(
                          child: TeamIconFromTeamId(
                            teamId: widget.hTeamId,
                          ),
                          onTap: () {
                            setState(() {
                              _fanValue += 10;
                              if (_fanValue > 60) {
                                _fanValue = 60;
                              }
                              Provider.of<UserProv>(context, listen: false)
                                  .setFanValue(_fanValue);
                            });
                          },
                        )
                      ]),
                ),
                ElevatedButton(
                    onPressed: () {
                      doChat(_textController.text);
                    },
                    child: Text("Submit")),
                SizedBox(height: 10),
              ]));
  }

  void doChat(String text) {
    var name = Provider.of<UserProv>(context, listen: false).displayName;
    String key = DateTime.now().millisecondsSinceEpoch.toString();
    //print(DateTime.now().millisecondsSinceEpoch.toString());

    DatabaseReference feed =
        FirebaseDatabase.instance.ref('gameFeed22/${widget.gameId}/$key/chat');

    if (text != "") {
      Provider.of<UserProv>(context, listen: false).setFanValue(_fanValue);
      feed.set({
        "type": "2",
        "chat": text,
        "displayName": name,
        "fanLevel": _fanValue == null ? 30 : _fanValue,
        "cheers": 0,
        "boos": 0
      });
    }

    print(text);

    _textController.clear();
    Navigator.of(context, rootNavigator: true).pop();
  }

  String getfanLevel(double value) {
    if (value == 0.0) {
      return "BEST. FAN. EVER!";
    }
    if (value == 10.0) {
      return "I'm wearing team clothes right now";
    }
    if (value == 20.0) {
      return "I have friends who like this team.";
    }
    if (value == 30.0) {
      return "Just a nuetral observer.";
    }
    if (value == 40.0) {
      return "I enjoy a foam finger or two.";
    }
    if (value == 50.0) {
      return "Let me show you my tattoo of the team logo.";
    }
    if (value == 60.0) {
      return "I BLEED FOR THIS TEAM!.";
    }
    return "";
  }
}
