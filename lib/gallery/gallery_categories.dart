import 'package:flutter/material.dart';
import 'category.dart';

class GalleryCategories extends StatelessWidget {
  final Function updateCategory;
  const GalleryCategories({Key? key, required this.updateCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
        future: Category.loadCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final categoryTiles = snapshot.data!
                .map((category) => buildCategory(category))
                .toList();
            return GridView.count(
              crossAxisCount: 3,
              children: categoryTiles,
            );
          }
          return const Text('Loading');
        });
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
