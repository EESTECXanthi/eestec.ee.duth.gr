import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Category {
  late String name;
  late String prefix;
  late String date;
  late String imagePath;

  Category({
    required this.name,
    required this.prefix,
    required this.date,
    required this.imagePath,
  });

  static Future<Iterable<String>> loadGalleryManifest() async {
    final manifest = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> decoded = json.decode(manifest);
    final List<String> keys = decoded.keys.toList();
    return keys.where((dynamic key) => key.startsWith('assets/gallery'));
  }

  static Future<List<Category>> loadCategories() async {
    final galleryManifest = await loadGalleryManifest();

    // Get all elements with index 0 (first element in each category)
    var categoryKeys = galleryManifest
        .where((String key) => key.endsWith('_0.jpg') || key.endsWith('_0.png'))
        .toList();

    final List<String> categoryNames = categoryKeys.map((String filename) {
      var parts = filename.split('/');
      parts = parts[parts.length - 1].split('_');
      return parts[0];
    }).toList();

    final List<String> categoryDates = categoryKeys.map((String filename) {
      final parts = filename.split('_');
      return parts[1];
    }).toList();

    final List<Category> categories = <Category>[];
    for (int i = 0; i < categoryNames.length; i++) {
      categories.add(Category(
          name: categoryNames[i],
          prefix: 'assets/gallery/${categoryNames[i]}_${categoryDates[i]}_',
          date: categoryDates[i],
          imagePath: categoryKeys[i]));
    }
    return categories;
  }

  Future<List<Widget>> getImages(Category category) async {
    final imageTiles = <Widget>[];
    final galleryManifest = await loadGalleryManifest();

    final List<String> images = galleryManifest
        .where((element) => element.startsWith(category.prefix))
        .toList();

    for (var i = 0; i < images.length; i++) {
      imageTiles.add(buildImageTile(images[i]));
    }

    return imageTiles;
  }

  Future<int> getNumberOfImages(Category category) async {
    // final imageTiles = <Widget>[];
    final galleryManifest = await loadGalleryManifest();

    final List<String> images = galleryManifest
        .where((element) => element.startsWith(category.prefix))
        .toList();
    return images.length;
  }

  Widget buildImageTile(String assetPath) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Image.asset(
        assetPath,
      ),
    );
  }
}
