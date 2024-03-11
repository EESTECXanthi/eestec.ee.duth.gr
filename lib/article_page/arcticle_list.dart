import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'article_model.dart';

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
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final article = articles[index];
          final subtitle = article.subtitle;
          return GestureDetector(
            onTap: () async {
              if (await canLaunchUrl(Uri.parse(article.link))) {
                await launchUrl(Uri.parse(article.link));
              } else {
                throw "Could not launch ${article.link}";
              }
            },
            child: ListTile(
              title: Text(article.title),
              leading: Image.network(
                _articles[index].image,
                width: 15.w,
                height: 15.w,
                fit: BoxFit.fill,
              ),
              subtitle: subtitle != null ? Text(subtitle) : null,
            ),
          );
        },
        childCount: _articles.length,
      ),
    );
  }
}
