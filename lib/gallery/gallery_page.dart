import 'package:flutter/material.dart';
import 'package:website/gallery/gallery.dart';
import 'package:website/gallery/gallery_categories.dart';
import 'package:website/navigation.dart';
import 'category.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  Category? category;

  final categories = [
    Category(
        name: 'SSA1\n01/01/2001',
        path: 'ssa1',
        imagePath: 'assets/gallery/ssa.png',
        numberOfPhotos: 16),
    Category(
        name: 'SSA2\n01/01/2002',
        path: 'ssa2',
        imagePath: 'assets/gallery/ssa.png',
        numberOfPhotos: 16),
    Category(
        name: 'SSA3\n01/01/2003',
        path: 'ssa3',
        imagePath: 'assets/gallery/ssa.png',
        numberOfPhotos: 16),
  ];

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (category == null) {
      child = GalleryCategories(
        categories: categories,
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
