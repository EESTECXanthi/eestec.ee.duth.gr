import 'package:flutter/material.dart';
import 'category.dart';

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
                '${category.name}',
                style: categoryTitleStyle,
                textAlign: TextAlign.center,
              ))),
            ],
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: category.getImages(),
            ),
          )
        ],
      ),
    );
  }
}
