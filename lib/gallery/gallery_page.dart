import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:website/gallery/images_page.dart';
import 'package:website/gallery/gallery_categories.dart';
import 'package:website/navigation.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'category.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  Category? category;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (category == null) {
      child = GalleryCategories(
        updateCategory: updateCategory,
      );
    } else {
      child = Gallery(category: category!, updateCategory: updateCategory);
    }
    return Navigation(child: child);
  }

  void updateCategory(Category? newCategory) {
    setState(() {
      category = newCategory;
    });
  }
}
