import 'package:flutter/material.dart';
import 'package:website/information_page/arcticle_list.dart';
import 'package:website/information_page/quote_container.dart';
import 'package:website/navigation.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigation(
        child: ListView(
      shrinkWrap: true,
      children: const [
        QuoteContainer(),

        // fit: FlexFit.tight,
        ArticleList(),
        // Expanded(child: ArticleList()),
      ],
    ));
  }
}
