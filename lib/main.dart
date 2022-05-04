import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hoop/models/season_model.dart';
import 'package:hoop/providers/game_settings.dart';
import 'package:hoop/providers/progress.dart';
import 'package:hoop/screens/layout.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';
import 'providers/user_prov.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ChangeNotifierProvider<UserProv>(
          create: (_) => UserProv(),
        ),
        ChangeNotifierProvider<GameSettingsProv>(
          create: (_) => GameSettingsProv(),
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
