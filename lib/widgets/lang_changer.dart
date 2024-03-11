import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website/bloc/lang.dart';

class LangText extends StatelessWidget {
  const LangText(
      {Key? key, this.english, required this.greek, this.style, this.textAlign})
      : super(key: key);
  final String? english;
  final String greek;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Language, String>(builder: (context, option) {
      String text = greek;
      if (option == "en") {
        if (english != null) {
          text = english!;
        }
      }

      return Text(
        text,
        style: style,
        textAlign: textAlign,
      );
    });
  }
}

TextSpan getLangTextSpan({String? english, required String greek}) {
  return const TextSpan();
}
