import 'package:dotted_line/dotted_line.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timelines/timelines.dart';
import 'package:website/responsive.dart';
import 'package:website/widgets/lang_changer.dart';

import 'faq_model.dart';

class FaqContainer extends StatelessWidget {
  const FaqContainer({Key? key, required this.faq}) : super(key: key);
  final FaqModel faq;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5.w,
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      child: ExpansionTileCard(
        leading: Icon(
          Icons.arrow_forward,
          color: Colors.red,
          size: Responsive.isMobile(context) ? 5.w : 2.w,
        ),
        title: LangText(
          greek: faq.question["greek"] ?? "",
          english: faq.question["english"] ?? "",
          style: TextStyle(
              color: Colors.red,
              fontSize: Responsive.isMobile(context) ? 5.w : 2.w),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LangText(
              greek: faq.answer["greek"] ?? "",
              english: faq.answer["english"] ?? "",
              style: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 5.w : 1.7.w),
            ),
          )
        ],
      ),
    );
  }
}
