import 'package:flutter/material.dart';
import 'package:hoop/api/config/firebase.dart';
import 'package:hoop/components/user_widgets/usr_button.dart';
import 'package:hoop/screens/views/account/login_ui.dart';
import 'package:hoop/screens/views/account/signup_ui.dart';

class UserMain extends StatefulWidget {
  const UserMain();

  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UserButton(
          title: "LOGIN",
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginUI(),
              ),
            );
          },
        ),
        SizedBox(
          height: 30,
        ),
        UserButton(
          title: "SIGNUP",
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignupUI(),
              ),
            );
          },
        ),
      ],
    );
  }
}
