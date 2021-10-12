import 'package:flutter/material.dart';
import 'package:hoop/components/standings_widgets/custom_picker.dart';
import 'package:hoop/models/season_model.dart';
import 'package:hoop/screens/views/standings_view/standings.dart';
import 'package:provider/provider.dart';

class LeagueMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF1F6BA3),
        automaticallyImplyLeading: false, // hides back arrow button
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          "Standings",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        actions: [
          Consumer<SeasonProv>(builder: (context, data, child) {
            return Center(
              child: customPicker(
                  context, data.seasonList, Color(0XFF1F6BA3), data.season,
                  (value) {
                data.changeSeason(
                  value,
                );
              }),
            );
          }),
          SizedBox(
            width: 3,
          )
        ],
      ),
      body: Standings(),
    );
  }
}
