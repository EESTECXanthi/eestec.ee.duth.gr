import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:website/bloc/lang.dart';
import 'package:website/responsive.dart';
import 'package:website/widgets/lang_changer.dart';

class TextImage extends StatelessWidget {
  const TextImage({
    Key? key,
    this.englishText,
    required this.greekText,
    required this.greek,
    required this.image,
    this.reversed = false,
    this.english,
  }) : super(key: key);
  final List<TextSpan> greekText;
  final List<TextSpan>? englishText;
  final String greek;
  final String image;
  final bool reversed;
  final String? english;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: reversed ? Alignment.bottomRight : Alignment.centerLeft,
            child: LangText(
              english: english,
              greek: greek,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: Responsive.isMobile(context) ? 7.w : 3.w,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: DottedLine(
              dashColor: Colors.red,
              lineThickness: 0.5.w,
              dashLength: 1.w,
              dashGapLength: 1.w,
            ),
          ),
          BlocBuilder<Language, String>(builder: (context, snapshot) {
            return Align(
              alignment:
                  reversed ? Alignment.bottomRight : Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Responsive.isMobile(context) ? 5.w : 1.5.w,
                  ),
                  children: snapshot == "el" || englishText == null
                      ? greekText
                      : englishText,
                ),
              ),
            );
          }),
        ],
      ),
      // Responsive.isMobile(context)
      //     ? const SizedBox.shrink()
      //     : Padding(
      //         padding: const EdgeInsets.all(20.0),
      //         child: Image(
      //           height: 200,
      //           width: 200,
      //           image: AssetImage(image),
      //         ),
      //       ),
    ];
    if (reversed == true) {
      list = list.reversed.toList();
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: list),
    );
  }
}
