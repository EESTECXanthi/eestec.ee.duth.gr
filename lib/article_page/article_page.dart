import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:website/navigation.dart';
import 'package:website/widgets/lang_changer.dart';

import '../responsive.dart';
import 'arcticle_list.dart';
import 'quote_container.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigation(
        child: CustomScrollView(
      //shrinkWrap: true,
      slivers: [
        const SliverToBoxAdapter(child: QuoteContainer()),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.pink,
            height: 400,
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: LangText(
              greek: "Science εν τάχει",
              english: "Science briefly",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: Responsive.isMobile(context) ? 7.w : 3.w),
            ),
          ),
        ),
        // fit: FlexFit.tight,
        const ArticleList(),
        // Expanded(child: ArticleList()),
      ],
    ));
  }
}
