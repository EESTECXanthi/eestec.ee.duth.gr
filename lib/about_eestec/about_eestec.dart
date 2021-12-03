import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';
import 'package:sizer/sizer.dart';

import '../navigation.dart';

class AboutEestec extends StatelessWidget {
  const AboutEestec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(fontWeight: FontWeight.bold, fontSize: 1.5.w);
    return DefaultTabController(
      length: 3,
      child: Navigation(
        bottom: TabBar(
          tabs: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "About EESTEC",
                style: style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "International Teams",
                style: style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "International Projects",
                style: style,
              ),
            ),
          ],
        ),
        child: VerticalTabBarView(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Text(
                      "About EESTEC",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 3.w,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    thickness: 0.5.h,
                    color: Colors.red,
                    indent: 25.w,
                    endIndent: 25.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("LOREM"),
                      SizedBox(width: 15.w),
                      Container(
                        width: 20.w,
                        height: 20.w,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
