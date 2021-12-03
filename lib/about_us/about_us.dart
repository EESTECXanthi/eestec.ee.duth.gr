import 'package:flutter/material.dart';
import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';

import '../navigation.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Navigation(
        bottom: const TabBar(
          tabs: [Text("1"), Text("2")],
        ),
        child: VerticalTabBarView(children: [
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.yellow,
          )
        ]),
      ),
    );
  }
}
