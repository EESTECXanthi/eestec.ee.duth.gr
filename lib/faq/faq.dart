import 'package:flutter/material.dart';
import 'package:website/faq/faq_container.dart';
import 'package:website/faq/faq_model.dart';
import 'package:website/navigation.dart';
import 'package:sizer/sizer.dart';

class Faq extends StatelessWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigation(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "FAQ",
            style: TextStyle(color: Colors.red, fontSize: 3.w),
          ),
        ),
        Divider(
          thickness: 3,
          indent: 5,
          endIndent: 8.w,
          color: Colors.red,
        ),
        for (final faq in faqs) FaqContainer(faq: faq)
      ],
    ));
  }
}
