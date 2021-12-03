import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:website/homepage/homepage.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      );
    });
  }
}
