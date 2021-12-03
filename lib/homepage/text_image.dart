import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:website/responsive.dart';

class TextImage extends StatelessWidget {
  const TextImage({
    Key? key,
    required this.text,
    required this.title,
    required this.image,
    this.reversed = false,
  }) : super(key: key);
  final String text;
  final String title;
  final String image;
  final bool reversed;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      Container(
        // color: Colors.pink,
        width: 50.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment:
                  reversed ? Alignment.bottomRight : Alignment.centerLeft,
              child: Text(
                title,
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.isMobile(context) ? 6.w : 3.w,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DottedLine(
                dashColor: Colors.red,
                lineThickness: 0.5.w,
                dashLength: 1.w,
                dashGapLength: 1.w,
              ),
            ),
            Align(
              alignment:
                  reversed ? Alignment.bottomRight : Alignment.centerLeft,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 2.w,
                ),
              ),
            ),
          ],
        ),
      ),
      Responsive.isMobile(context)
          ? const SizedBox.shrink()
          : Image(
              height: 200,
              width: 200,
              image: AssetImage(image),
            ),
    ];
    if (reversed == true) {
      list = list.reversed.toList();
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: list),
    );
  }
}
