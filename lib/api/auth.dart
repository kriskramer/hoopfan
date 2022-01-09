import 'package:firebase_auth/firebase_auth.dart';
import 'package:hoop/api/get_message.dart';
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
        String userId = _user.user.uid; // get user ID

        // save the users details in the users collection
        await store
            .collection("users")
            .doc(userId)
            .set(user.toJson(id: userId));

        response["code"] = 200;
        response["message"] = "success";
      } else {}
    } catch (e) {
      response["code"] = 400;
      response["message"] = getMessage(e.code);
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
      response["message"] = getMessage(e.code);
    }
    return response; // return response for further processing by app
  }
}
