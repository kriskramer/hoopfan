import 'package:flutter/material.dart';

class DashboardSectionBox extends StatelessWidget {
  final String sectionTitle;
  final String tapMoreText;
  final IconData iconData;
  final Widget dashboardWidget;
  final Widget linkWidget;

  const DashboardSectionBox(
      {this.sectionTitle,
      this.tapMoreText,
      this.iconData,
      this.dashboardWidget,
      this.linkWidget});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  //width: 250,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey, width: 1)),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                iconData,
                color: Colors.blue,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                sectionTitle,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
        linkWidget == null
            ? Card(
                shape: RoundedRectangleBorder(
                  // borderRadius:
                  //     BorderRadius.circular(10), // if you need this
                  side: BorderSide(
                    color: Colors.cyan,
                    width: 1,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    dashboardWidget,
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          tapMoreText,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ]),
                ))
            : GestureDetector(
                child: Card(
                    shape: RoundedRectangleBorder(
                      // borderRadius:
                      //     BorderRadius.circular(10), // if you need this
                      side: BorderSide(
                        color: Colors.cyan,
                        width: 1,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        dashboardWidget,
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
                              decoration: BoxDecoration(
                                  color: Colors.orange[100],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                tapMoreText,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ]),
                    )),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => linkWidget),
                  );
                },
              ),
      ],
    );
  }
}
