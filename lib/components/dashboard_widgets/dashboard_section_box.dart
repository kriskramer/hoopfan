import 'package:flutter/material.dart';

class DashboardSectionBox extends StatelessWidget {
  final String sectionTitle;
  final String tapMoreText;
  final IconData iconData;
  final IconData secondIcon;
  final Widget dashboardWidget;
  final Widget linkWidget;

  const DashboardSectionBox({
    this.sectionTitle,
    this.tapMoreText,
    this.iconData,
    this.dashboardWidget,
    this.linkWidget,
    this.secondIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Row(
                  children: [
                    Icon(
                      iconData,
                      color: Colors.blue,
                    ),
                    secondIcon != null
                        ? Icon(
                            secondIcon,
                            color: Colors.blue,
                          )
                        : SizedBox()
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  sectionTitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ]),
            )),
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
                            Text(
                              tapMoreText,
                              style: TextStyle(fontSize: 12),
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
