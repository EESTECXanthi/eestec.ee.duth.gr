import 'package:dotted_line/dotted_line.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timelines/timelines.dart';

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
          size: 2.w,
        ),
        title: Text(
          faq.question,
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 2.w),
        ),
        children: [
          Text(
            faq.question,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 1.9.w),
          )
        ],
      ),
    );
  }
}
