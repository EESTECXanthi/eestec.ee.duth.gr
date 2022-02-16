import 'package:flutter/cupertino.dart';

class Category {
  late String name;
  late String path;
  late String imagePath;
  late int numberOfPhotos;

  Category({
    required this.name,
    required this.path,
    required this.imagePath,
    required this.numberOfPhotos,
  });

  List<Widget> getImages() {
    final imageTiles = <Widget>[];

    for (var i = 0; i < numberOfPhotos; i++) {
      imageTiles.add(buildImageTile('assets/gallery/$name/$i.jpg'));
    }

    return imageTiles;
  }

  // // Image Tile for method 1
// Widget buildImageTile(String assetPath) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Image.asset(assetPath),
//   );
// }

// Image Tile for method 2
  Widget buildImageTile(String assetPath) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Image.asset(
        assetPath,
      ),
    );
  }
}
