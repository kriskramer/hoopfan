import 'package:flutter/material.dart';

class GameCommentsViewingCount extends StatelessWidget {
  const GameCommentsViewingCount();

  @override
  Widget build(BuildContext context) {
    String comments = "0";
    String viewing = "0";

    return Container(
      child: Row(children: [
        Text("Comments: "),
        Text(comments),
        SizedBox(
          width: 20,
        ),
        Text("Viewing: "),
        Text(viewing),
      ]),
    );
  }
}
