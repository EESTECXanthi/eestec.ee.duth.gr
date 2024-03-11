import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:website/bloc/lang.dart';
import 'package:website/homepage/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return BlocProvider(
        create: (context) => Language(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
          theme: ThemeData(
            useMaterial3: false,
            textTheme: GoogleFonts.robotoTextTheme(
              Theme.of(context).textTheme,
            ),
            primarySwatch: Colors.red,
          ),
        ),
      );
    });
  }
}
