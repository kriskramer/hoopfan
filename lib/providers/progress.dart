import 'package:flutter/foundation.dart';

class ProgressProv with ChangeNotifier {
  bool _showSpinner = false;

  void spinHud() {
    _showSpinner = !_showSpinner;
    notifyListeners();
  }

  bool get spinnerVal => _showSpinner;
}
