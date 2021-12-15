import 'package:flutter/foundation.dart';
import 'package:hoop/model/user.dart';

class UserProv with ChangeNotifier {
  AppUser _userInstance = AppUser();

  void setEmail(String email) {
    _userInstance.email = email;
    notifyListeners();
  }

  void setDisplayName(String name) {
    _userInstance.displayName = name;
    notifyListeners();
  }

  void setPassword(String password) {
    _userInstance.password = password;
    notifyListeners();
  }

  String get email => _userInstance.email;
  String get displayName => _userInstance.displayName;
  String get password => _userInstance.password;
}
