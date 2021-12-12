import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hoop/model/user.dart';
import 'package:hoop/models/season_model.dart';
import 'package:hoop/providers/progress.dart';
import 'package:hoop/screens/layout.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';
import 'api/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// TODO: Example usage just for testing delete soon
  Map<String, dynamic> response = await Auth.loginUser(
    AppUser(
        displayName: "Emmanuel",
        email: "ogasule601@gmail.com",
        password: "password67",
        favoriteTeam: "Clippers"),
  );
  print(response);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JsonFiles>(
          create: (_) => JsonFiles(),
        ),
        ChangeNotifierProvider<SeasonProv>(
          create: (_) => SeasonProv(),
        ),
        ChangeNotifierProvider<ProgressProv>(
          create: (_) => ProgressProv(),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: Layout(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
