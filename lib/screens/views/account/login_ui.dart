import 'package:flutter/material.dart';
import 'package:hoop/api/auth.dart';
import 'package:hoop/components/toaster.dart';
import 'package:hoop/components/user_widgets/inputfield.dart';
import 'package:hoop/components/user_widgets/usr_button.dart';
import 'package:hoop/model/user.dart';
import 'package:hoop/providers/user_prov.dart';
import 'package:hoop/utils/fieldtype.dart';
import 'package:provider/provider.dart';

// TODO: add loading spinner
class LoginUI extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: ListView(
            reverse: true,
            children: [
              SizedBox(
                height: 70,
              ),
              UserButton(
                  title: "LOGIN",
                  function: () async {
                    if (_formKey.currentState.validate()) {
                      AppUser user = AppUser(
                        email:
                            Provider.of<UserProv>(context, listen: false).email,
                        password: Provider.of<UserProv>(context, listen: false)
                            .password,
                      );
                      Map<String, dynamic> response =
                          await Auth.loginUser(user); // returns a response
                      if (response["code"] == 200) {
                        toaster(response["message"]);
                        Navigator.pop(context);
                      } else {
                        toaster(response["message"]);
                      }
                    }
                  }),
              InputField(
                name: "password",
                keyboard: TextInputType.visiblePassword,
                fieldType: FieldType.password,
              ),
              InputField(
                name: "email",
                keyboard: TextInputType.emailAddress,
                fieldType: FieldType.email,
              )
            ],
          ),
        ),
      ),
    );
  }
}
