import 'package:flutter/material.dart';
import 'package:hoop/providers/game_settings.dart';
import 'package:hoop/screens/views/games/game_view.dart';
import 'package:provider/provider.dart';

import '../../../json/jsons.dart';

class GameSettings extends StatefulWidget {
  final dynamic gameData;
  final String gameId;
  final ValueChanged<int> update;

  const GameSettings(this.gameData, this.gameId, this.update);

  @override
  State<GameSettings> createState() => _GameSettingsState();
}

class _GameSettingsState extends State<GameSettings> {
  bool showPbp;
  bool showChat;
  bool showLead;

  @override
  Widget build(BuildContext context) {
    var gameStatus = widget.gameData["statusNum"];
    var stats = Provider.of<JsonFiles>(context, listen: false)
        .getCurrentGameStats(widget.gameId);

    showPbp =
        Provider.of<GameSettingsProv>(context, listen: false).getShowPbp();
    showChat =
        Provider.of<GameSettingsProv>(context, listen: false).getShowChat();
    showLead =
        Provider.of<GameSettingsProv>(context, listen: false).getShowLead();

    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Text("Settings", style: TextStyle(fontSize: 18)),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Show Pbp:"),
                  Switch(
                    value: showPbp,
                    onChanged: (value) {
                      setState(() {
                        showPbp = value;
                        Provider.of<GameSettingsProv>(context, listen: false)
                            .setShowPbp(showPbp);
                        widget.update(1);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Show Chat:"),
                  Switch(
                    value: showChat,
                    onChanged: (value) {
                      setState(() {
                        showChat = value;
                        Provider.of<GameSettingsProv>(context, listen: false)
                            .setShowChat(showChat);
                      });
                      widget.update(1);
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Show Lead:"),
                  Switch(
                    value: showLead,
                    onChanged: (value) {
                      setState(() {
                        showLead = value;
                        Provider.of<GameSettingsProv>(context, listen: false)
                            .setShowLead(showLead);
                      });
                      widget.update(1);
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text("Want to go back to the old Game View?"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GameView(game: widget.gameData)),
                    );
                  },
                  child: Text("Old Game View"))
            ],
          ),
        ));
  }
}
