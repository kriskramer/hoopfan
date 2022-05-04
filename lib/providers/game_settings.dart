import 'package:flutter/foundation.dart';

class GameSettingsProv with ChangeNotifier {
  bool _showPbp = true;
  bool _showChat = true;
  bool _showLead = true;

  void setShowPbp(bool show) {
    _showPbp = show;
  }

  void setShowChat(bool show) {
    _showChat = show;
  }

  void setShowLead(bool show) {
    _showLead = show;
  }

  bool getShowPbp() => _showPbp;
  bool getShowChat() => _showChat;
  bool getShowLead() => _showLead;
}
