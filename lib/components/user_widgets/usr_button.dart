import 'package:flutter/material.dart';

class UserButton extends StatelessWidget {
  final String title;
  final Function function;

  UserButton({@required this.title, @required this.function});
  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height / 15;
    double height = 50;
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: height / 2.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
