import 'package:flutter/material.dart';

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
