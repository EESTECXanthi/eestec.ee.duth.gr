import 'package:flutter/material.dart';
import 'package:website/faq/faq_container.dart';
import 'package:website/faq/faq_model.dart';
import 'package:website/navigation.dart';

class Faq extends StatelessWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigation(
      child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            return FaqContainer(faq: faqs[index]);
          }),
    );
  }
}
