import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'category.dart';

class GalleryCategories extends StatelessWidget {
  final List<Category> categories;
  final Function updateCategory;
  const GalleryCategories(
      {Key? key, required this.categories, required this.updateCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GridView.count(
        crossAxisCount: 3,
        children:
            categories.map((_category) => buildCategory(_category)).toList(),
      ),
    );
  }

  Future<List<String>> loadCategories() async {
    // final manifest DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final manifest = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> decoded = json.decode(manifest);
    final List<String> keys = decoded.keys.toList();
    final selected =
        keys.where((dynamic key) => key.startsWith('assets/gallery'));
    //assets/gallery/<event>_<date>_<index>.png
    var categories = selected
        .where((String key) => key.endsWith('_0.jpg') || key.endsWith('_0.png'))
        .toList();

    //assets/gallery/<event>_<date>_0.png
    categories = categories.map((String filename) {
      final parts = filename.split('_');
      return parts[0];
    }).toList();

    //assets/gallery/<event>
    categories = categories.map((String filename) {
      final parts = filename.split('/');
      return parts[parts.length - 1];
    }).toList();

    //<event>
    return categories;
  }

  Widget buildCategory(Category _category) {
    TextStyle _categoryTextStyle =
        const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);

    void pressFunction() {
      updateCategory(_category);
    }

    return Center(
      child: Column(
        children: [
          IconButton(
            onPressed: pressFunction,
            icon: Image.asset(
              _category.imagePath,
            ),
            iconSize: 150.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: pressFunction,
              child: Text(
                _category.name,
                style: _categoryTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
