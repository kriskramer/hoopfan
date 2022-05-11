import 'package:flutter/foundation.dart';
import 'package:hoop/model/user.dart';

class UserProv with ChangeNotifier {
  AppUser _userInstance = AppUser();
  double _fanValue = 30.0;

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

  void setUser(AppUser u) {
    _userInstance = u;
  }

  void setFanValue(double value) {
    _fanValue = value;
  }

  double getFanValue() {
    return _fanValue;
  }

  AppUser getUser() {
    return _userInstance;
  }

  bool isUserLoggedIn() {
    if (_userInstance != null && _userInstance.email != "") {
      return true;
    }

    return false;
  }

  String get email => _userInstance.email;
  String get displayName => _userInstance.displayName;
  String get password => _userInstance.password;
}
