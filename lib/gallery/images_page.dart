import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:website/gallery/category.dart';

class Gallery extends StatelessWidget {
  final Category category;
  final Function updateCategory;
  const Gallery(
      {Key? key, required this.category, required this.updateCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const categoryTitleStyle =
        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  updateCategory(null);
                },
                icon: const Icon(Icons.arrow_back_rounded),
              ),
              Expanded(
                  child: Center(
                      child: Text(
                category.name,
                style: categoryTitleStyle,
                textAlign: TextAlign.center,
              ))),
            ],
          ),
          Expanded(
            child: FutureBuilder<int>(
              future: category.getNumberOfImages(category),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MasonryGridView.count(
                      crossAxisCount: 4,
                      itemCount: snapshot.data!,
                      itemBuilder: (context, index) {
                        // print('---- INDEX: $index ----');
                        // return Padding(
                        //   padding: const EdgeInsets.all(4.0),
                        //   child: Image.asset('${category.prefix}$index.jpg'),
                        // );
                        return GestureDetector(
                          onTap: () => _showMaterialDialog(
                              context, '${category.prefix}$index.jpg'),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset('${category.prefix}$index.jpg'),
                          ),
                        );
                      });
                }
                return const Text('Loading...');
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showMaterialDialog(BuildContext context, String imagePath) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(category.name),
            content: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog(context);
                  },
                  child: const Text('Close')),
              TextButton(
                onPressed: () async {
                  final image = await rootBundle.load(imagePath);
                  final _base64 = base64.encode(Uint8List.view(image.buffer));
                  final anchor = AnchorElement(
                      href: 'data:application/jpg;base64,$_base64')
                    ..target = 'blank';
                  anchor.download = "filename.jpg";
                  document.body?.append(anchor);
                  anchor.click();
                  anchor.remove();
                  _dismissDialog(context);
                },
                child: const Text('Download'),
              )
            ],
          );
        });
  }

  _dismissDialog(BuildContext context) async {
    Navigator.pop(context);
  }
}
