import 'package:firebase_auth/firebase_auth.dart';
import 'package:hoop/model/user.dart';
import 'package:hoop/api/config/firebase.dart';

class Auth {
  static Future<Map<String, dynamic>> registerUser(AppUser user) async {
    Map<String, dynamic> response = {};
    try {
      final UserCredential _user = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      if (_user != null) {
        response["code"] = 200;
        response["message"] = "success";
      } else {}
    } catch (e) {
      response["code"] = 400;
      if (e.code == "email-already-in-use") {
        response["message"] = "email already taken";
      } else if (e.code == "invalid-email") {
        response["message"] = "invalid email";
      } else if (e.code == "operation-not-allowed") {
        response["message"] = "enable your account";
      } else if (e.code == "weak-password") {
        response["message"] = "password is too weak";
      }
    }
    return response; // return response for further processing by app
  }

  static Future<Map<String, dynamic>> loginUser(AppUser user) async {
    Map<String, dynamic> response = {};
    try {
      final UserCredential _user = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      if (_user != null) {
        response["code"] = 200;
        response["message"] = "success";
      } else {}
    } on FirebaseAuthException catch (e) {
      response["code"] = 400;
      if (e.code == "invalid-email") {
        response["message"] = "invalid email";
      } else if (e.code == "user-disabled") {
        response["message"] = "account disabled";
      } else if (e.code == "user-not-found") {
        response["message"] = "account doesn't exist";
      } else if (e.code == "wrong-password") {
        response["message"] = "wrong password";
      }
    }
    return response; // return response for further processing by app
  }
}
