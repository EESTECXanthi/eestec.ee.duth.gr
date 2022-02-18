import 'package:flutter/material.dart';
import 'package:website/information_page/article_model.dart';
import 'package:website/responsive.dart';
import 'package:sizer/sizer.dart';

import '../widgets/lang_changer.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  late List<ArticleModel> _articles;

  @override
  void initState() {
    _articles = articles;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // child: Row(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: _articles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async => await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: LangText(
                        greek: _articles[index].desc["greek"] ?? "",
                        english: _articles[index].desc["english"] ?? "",
                      ),
                    );
                  }),
              child: ListTile(
                title: LangText(
                  greek: _articles[index].name["greek"] ?? "",
                  english: _articles[index].name["english"],
                ),
                leading: Image.network(
                  _articles[index].image,
                  width: 15.w,
                  height: 15.w,
                  fit: BoxFit.fill,
                ),
                subtitle: _articles[index].quote != null
                    ? LangText(
                        greek: _articles[index].quote?["greek"] ?? "",
                        english: _articles[index].quote?["english"],
                      )
                    : null,
              ),
            );
          }),
      //     Responsive.isMobile(context)
      //         ? const SizedBox.shrink()
      //         : SizedBox(
      //             width: 30.w,
      //             child: Card(
      //               child: Column(),
      //             ),
      //           ),
      //   ],
      // ),
    );
  }
}
