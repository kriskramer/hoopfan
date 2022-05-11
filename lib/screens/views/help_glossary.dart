import 'package:flutter/material.dart';

class HelpGlossary extends StatelessWidget {
  const HelpGlossary();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Help/Glossary"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Coming soon...",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ));
  }
}
